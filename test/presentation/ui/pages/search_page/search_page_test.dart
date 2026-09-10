import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/search_page/search_page.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/search_results.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:badges/badges.dart' as badges;

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late MockSearchBloc mockSearchBloc;
  late MockCartBloc mockCartBloc;

  setUpAll(() {
    registerFallbackValue(const SearchEvent.searchQueryChanged(query: 'test'));
    registerFallbackValue(
      SearchState(
        pagingState: PagingState(pages: [], keys: []),
      ),
    );
    registerFallbackValue(const CartEvent.getCart());
    registerFallbackValue(const CartState.initial());
  });

  setUp(() {
    mockSearchBloc = MockSearchBloc();
    mockCartBloc = MockCartBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, _) => MaterialApp(
        theme: ThemeData(
          extensions: [
            AppTextStyles.build(Brightness.light),
          ],
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SearchBloc>.value(value: mockSearchBloc),
            BlocProvider<CartBloc>.value(value: mockCartBloc),
          ],
          child: child,
        ),
      ),
    );
  }

  group('SearchPage Widget Test', () {
    testWidgets('renders SearchPage with correct components', (
      WidgetTester tester,
    ) async {
      // Setup Stubs with loaded empty state
      when(() => mockSearchBloc.state).thenReturn(
        SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );
      whenListen(
        mockSearchBloc,
        Stream.value(
          SearchState(
            pagingState: PagingState(pages: [], keys: []),
          ),
        ),
        initialState: SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );

      when(() => mockCartBloc.state).thenReturn(const CartState.initial());
      whenListen(
        mockCartBloc,
        Stream.value(const CartState.initial()),
        initialState: const CartState.initial(),
      );

      await tester.pumpWidget(makeTestableWidget(const SearchPage()));
      await tester.pumpAndSettle();

      // Verify AppBar exists
      expect(find.byType(SliverAppBar), findsOneWidget);

      // Verify Search TextField
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Search what you are looking for...'), findsOneWidget);

      // Verify Cart Icon
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

      // Verify SearchResults body
      expect(find.byType(SearchResults), findsOneWidget);

      // Verify Initial Message is shown and NO loader
      expect(find.byType(AppEmptyView), findsOneWidget);
      expect(find.text('Search for Products'), findsOneWidget);
      expect(find.text('No Results Found'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('entering text triggers search event', (
      WidgetTester tester,
    ) async {
      // Setup Stubs
      when(() => mockSearchBloc.state).thenReturn(
        SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );
      whenListen(
        mockSearchBloc,
        Stream.value(
          SearchState(
            pagingState: PagingState(pages: [], keys: []),
          ),
        ),
        initialState: SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );

      when(() => mockCartBloc.state).thenReturn(const CartState.initial());
      whenListen(
        mockCartBloc,
        Stream.value(const CartState.initial()),
        initialState: const CartState.initial(),
      );

      await tester.pumpWidget(makeTestableWidget(const SearchPage()));
      await tester.pumpAndSettle();

      final textField = find.byType(TextFormField);
      await tester.enterText(textField, 'iphone');
      await tester.pump(const Duration(milliseconds: 500));

      verify(
        () => mockSearchBloc.add(
          const SearchEvent.searchQueryChanged(query: 'iphone'),
        ),
      ).called(greaterThanOrEqualTo(1));
    });

    testWidgets('submitting text triggers search submitted event', (
      WidgetTester tester,
    ) async {
      // Setup Stubs
      when(() => mockSearchBloc.state).thenReturn(
        SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );
      whenListen(
        mockSearchBloc,
        Stream.value(
          SearchState(
            pagingState: PagingState(pages: [], keys: []),
          ),
        ),
        initialState: SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );

      when(() => mockCartBloc.state).thenReturn(const CartState.initial());
      whenListen(
        mockCartBloc,
        Stream.value(const CartState.initial()),
        initialState: const CartState.initial(),
      );

      await tester.pumpWidget(makeTestableWidget(const SearchPage()));
      await tester.pumpAndSettle();

      final textField = find.byType(TextFormField);
      await tester.enterText(textField, 'samsung');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();

      verify(
        () => mockSearchBloc.add(
          const SearchEvent.searchSubmitted(query: 'samsung'),
        ),
      ).called(1);
    });

    testWidgets('displays cart badge count when cart has items', (
      WidgetTester tester,
    ) async {
      // Setup Stubs with Loaded Cart
      const realCart = CartEntity(
        id: '1',
        itemsCount: 5,
        items: [],
        subtotal: 100,
        grandTotal: 100,
        discountAmount: 0,
        shippingAmount: 0,
        taxAmount: 0,
        couponCode: '',
      );

      when(() => mockSearchBloc.state).thenReturn(
        SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );
      whenListen(
        mockSearchBloc,
        Stream.value(
          SearchState(
            pagingState: PagingState(pages: [], keys: []),
          ),
        ),
        initialState: SearchState(
          pagingState: PagingState(pages: [], keys: []),
        ),
      );

      when(
        () => mockCartBloc.state,
      ).thenReturn(const CartState.loaded(realCart));
      whenListen(
        mockCartBloc,
        Stream.value(const CartState.loaded(realCart)),
        initialState: const CartState.loaded(realCart),
      );

      await tester.pumpWidget(makeTestableWidget(const SearchPage()));
      await tester.pumpAndSettle();

      // Verify Badge widget is present
      expect(find.byType(Badge), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      final textWidget = tester.widget<Text>(find.text('5'));
      expect(textWidget.style?.color, AppColors.white);
    });

    testWidgets(
      'displays "No Results Found" when search returns empty results, but prompt on initial',
      (WidgetTester tester) async {
        when(() => mockSearchBloc.state).thenReturn(
          SearchState(
            pagingState: PagingState(pages: [[]], keys: [0]),
          ),
        );
        whenListen(
          mockSearchBloc,
          Stream.value(
            SearchState(
              pagingState: PagingState(pages: [[]], keys: [0]),
            ),
          ),
          initialState: SearchState(
            pagingState: PagingState(pages: [[]], keys: [0]),
          ),
        );

        when(() => mockCartBloc.state).thenReturn(const CartState.initial());
        whenListen(
          mockCartBloc,
          Stream.value(const CartState.initial()),
          initialState: const CartState.initial(),
        );

        await tester.pumpWidget(makeTestableWidget(const SearchPage()));
        await tester.pumpAndSettle();

        // When search returns 0 products, "No Results Found" should display
        expect(find.text('No Results Found'), findsOneWidget);
        expect(find.text('Search for Products'), findsNothing);
      },
    );
  });
}
