import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_typography.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_event.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_state.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/ui/pages/cart/cart_page/cart_page.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_page/empty_cart_view.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockUserProfileBloc extends MockBloc<UserProfileEvent, UserProfileState>
    implements UserProfileBloc {}

/// CartPage reads AuthBloc to gate coupon/points actions behind login.
/// ClubPointBloc is no longer read by the page — club point figures come from
/// the cart's own reward segments — but it stays provided so the harness keeps
/// working if a descendant reaches for it.
class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockClubPointBloc extends MockBloc<ClubPointEvent, ClubPointState>
    implements ClubPointBloc {}

class MockInternetBloc extends MockBloc<InternetEvent, InternetState>
    implements InternetBloc {}

class MockAuthCacheManager extends Mock implements AuthCacheManager {}

void main() {
  late MockCartBloc mockCartBloc;
  late MockUserProfileBloc mockUserProfileBloc;
  late MockAuthBloc mockAuthBloc;
  late MockClubPointBloc mockClubPointBloc;
  late MockInternetBloc mockInternetBloc;
  late MockAuthCacheManager mockAuthCacheManager;

  setUpAll(() {
    registerFallbackValue(const CartEvent.getCart());
    registerFallbackValue(const UserProfileEvent.loadUserProfile());
    registerFallbackValue(const ClubPointEvent.getClubPoints());
  });

  setUp(() {
    mockCartBloc = MockCartBloc();
    mockUserProfileBloc = MockUserProfileBloc();
    mockAuthBloc = MockAuthBloc();
    mockClubPointBloc = MockClubPointBloc();
    mockInternetBloc = MockInternetBloc();
    mockAuthCacheManager = MockAuthCacheManager();

    if (getIt.isRegistered<AuthCacheManager>()) {
      getIt.unregister<AuthCacheManager>();
    }
    getIt.registerSingleton<AuthCacheManager>(mockAuthCacheManager);

    when(() => mockAuthCacheManager.getToken()).thenAnswer((_) async => null);
    when(
      () => mockAuthCacheManager.getGuestCartId(),
    ).thenAnswer((_) async => null);

    when(
      () => mockUserProfileBloc.state,
    ).thenReturn(const UserProfileState.initial());

    // Guest by default: keeps the club-points fetch out of these tests.
    when(() => mockAuthBloc.state).thenReturn(const AuthState.unauthenticated());
    when(
      () => mockClubPointBloc.state,
    ).thenReturn(const ClubPointState.initial());
    when(() => mockCartBloc.isPendingAddition).thenReturn(false);
    when(() => mockCartBloc.currentCart).thenReturn(null);
    when(
      () => mockInternetBloc.state,
    ).thenReturn(const InternetState.connected('Back Online'));
  });

  Widget createWidgetUnderTest({Size designSize = const Size(375, 812)}) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<CartBloc>.value(value: mockCartBloc),
              BlocProvider<UserProfileBloc>.value(value: mockUserProfileBloc),
              BlocProvider<AuthBloc>.value(value: mockAuthBloc),
              BlocProvider<ClubPointBloc>.value(value: mockClubPointBloc),
              BlocProvider<InternetBloc>.value(value: mockInternetBloc),
            ],
            child: const CartPage(),
          ),
        );
      },
    );
  }

  group('CartPage', () {
    testWidgets('shows loading indicator when CartBloc is in loading state', (
      tester,
    ) async {
      when(() => mockCartBloc.state).thenReturn(const CartState.loading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows EmptyCartView when CartBloc is in empty state', (
      tester,
    ) async {
      // Set a larger screen size and match design size to avoid scaling overflow
      const testSize = Size(800, 1200);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      whenListen(
        mockCartBloc,
        Stream.value(const CartState.empty()),
        initialState: const CartState.empty(),
      );

      await tester.pumpWidget(createWidgetUnderTest(designSize: testSize));
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.byType(EmptyCartView), findsOneWidget);
    });

    testWidgets(
      'shows cart items and summary when CartBloc is in loaded state',
      (tester) async {
        const testSize = Size(800, 1200);
        tester.view.physicalSize = testSize;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        const tCartItem = CartItemEntity(
          itemId: 1,
          sku: 'SKU1',
          qty: 1,
          name: 'Product 1',
          price: 100,
          productType: 'simple',
          quoteId: '1',
          rowTotal: 100,
          regularPrice: 100,
          specialPrice: 100,
          discount: '0',
          imageUrl: 'image.jpg',
          productUrlKey: 'p1',
          productId: 101,
          brand: 'Brand',
          stockAvailable: true,
        );

        const tCart = CartEntity(
          id: '1',
          itemsCount: 1,
          items: [tCartItem],
          subtotal: 100,
          grandTotal: 100,
          discountAmount: 0,
          shippingAmount: 0,
          taxAmount: 0,
          couponCode: '',
        );

        when(() => mockCartBloc.state).thenReturn(const CartState.loaded(tCart));

        await tester.pumpWidget(createWidgetUnderTest(designSize: testSize));
        await tester.pumpAndSettle();

        expect(find.text('Product 1'), findsOneWidget);
        expect(find.text('৳100'), findsWidgets);
      },
    );

    testWidgets(
      'shows error message and retry button when CartBloc is in error state',
      (tester) async {
        when(() => mockCartBloc.state).thenReturn(
          const CartState.error(
            error: AppErrorEntity(message: 'Something went wrong'),
          ),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('Something went wrong'), findsOneWidget);
        expect(find.text('Retry'), findsOneWidget);
      },
    );

    testWidgets(
      'shows loading indicator and NEVER EmptyCartView when isPendingAddition is true',
      (tester) async {
        const testSize = Size(800, 1200);
        tester.view.physicalSize = testSize;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        when(() => mockCartBloc.state).thenReturn(const CartState.empty());
        when(() => mockCartBloc.isPendingAddition).thenReturn(true);

        await tester.pumpWidget(createWidgetUnderTest(designSize: testSize));
        await tester.pump();

        // Must show loader, NEVER EmptyCartView
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(EmptyCartView), findsNothing);
      },
    );

    testWidgets(
      'shows loader and never flashes EmptyCartView before backend verifies empty state',
      (tester) async {
        const testSize = Size(800, 1200);
        tester.view.physicalSize = testSize;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        // Without whenListen emitting, backend verification has not completed
        when(() => mockCartBloc.state).thenReturn(const CartState.empty());
        when(() => mockCartBloc.isPendingAddition).thenReturn(false);

        await tester.pumpWidget(createWidgetUnderTest(designSize: testSize));
        await tester.pump();

        // Must NOT show EmptyCartView yet because backend has not responded in this session
        expect(find.byType(EmptyCartView), findsNothing);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );
  });
}
