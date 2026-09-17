import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/banner_bloc/banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_banner_bloc/category_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_products_bloc/category_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/special_category_products_bloc/special_category_products_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/category_product_page/category_product_page.dart';
import 'package:pickaboo/presentation/ui/pages/special_category_product_page/special_category_product_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/secondary_home_widget.dart';

class MockSpecialCategoryProductsBloc
    extends MockBloc<SpecialCategoryProductsEvent, SpecialCategoryProductsState>
    implements SpecialCategoryProductsBloc {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockCategoryProductsBloc
    extends MockBloc<CategoryProductsEvent, CategoryProductsState>
    implements CategoryProductsBloc {}

class MockCategoryBannerBloc
    extends MockBloc<CategoryBannerEvent, CategoryBannerState>
    implements CategoryBannerBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const SpecialCategoryProductsEvent.getProducts(categorySlug: 'fallback'),
    );
    registerFallbackValue(const BannerEvent.getBannerContent());
  });

  group('SecondaryHomeWidget Unit & Embedding Tests', () {
    test('isSpecialCategory correctly identifies special categories', () {
      const specialCat = CategoryListEntity(
        id: '123',
        slug: 'air-conditioner',
        name: 'Air Conditioner',
        isSpecial: true,
        icon: '',
      );
      const widgetSpecial = SecondaryHomeWidget(category: specialCat);
      expect(widgetSpecial.isSpecialCategory, isTrue);

      const nonNumericSlugCat = CategoryListEntity(
        id: '',
        slug: 'smartphones',
        name: 'Smartphones',
        isSpecial: false,
        icon: '',
      );
      const widgetSlug = SecondaryHomeWidget(category: nonNumericSlugCat);
      expect(widgetSlug.isSpecialCategory, isTrue);

      const regularCat = CategoryListEntity(
        id: '456',
        slug: 'kitchen-appliances',
        name: 'Kitchen Appliances',
        isSpecial: false,
        icon: '',
      );
      const widgetRegular = SecondaryHomeWidget(category: regularCat);
      expect(widgetRegular.isSpecialCategory, isFalse);
    });

    test('getCachedProducts delegates to CategoryPreloadCache', () {
      const sampleProduct = ProductEntity(
        id: '101',
        expressDelivery: true,
        productName: 'Sample Phone',
        sku: 'SKU101',
        slug: 'sample-phone',
        typeId: 'simple',
        stockAvailable: true,
        freeDelivery: false,
        productPrice: 10000,
        productSpecialPrice: 9000,
        productDiscount: 10,
        offers: '',
        rating: 4.5,
        clubPoint: 10,
        ratingCount: 5,
        productImg: 'https://example.com/img.png',
        emiAvailable: true,
        comingSoon: false,
      );
      CategoryPreloadCache.instance.save(
        ['test-category'],
        products: [sampleProduct],
        filterAttributes: const [],
      );
      expect(SecondaryHomeWidget.getCachedProducts('test-category'), isNotEmpty);
      expect(SecondaryHomeWidget.getCachedProducts('non-existent-key'), isNull);
    });
  });

  group('SpecialCategoryProductPage Embedded Mode Tests', () {
    late MockSpecialCategoryProductsBloc mockSpecialBloc;
    late MockBannerBloc mockBannerBloc;
    late MockAuthBloc mockAuthBloc;
    late MockCartBloc mockCartBloc;

    setUp(() {
      mockSpecialBloc = MockSpecialCategoryProductsBloc();
      mockBannerBloc = MockBannerBloc();
      mockAuthBloc = MockAuthBloc();
      mockCartBloc = MockCartBloc();

      when(() => mockSpecialBloc.state).thenReturn(
        SpecialCategoryProductsState(
          categorySlug: 'air-conditioner',
          pagingState: PagingState<int, ProductEntity>(),
        ),
      );
      when(() => mockBannerBloc.state).thenReturn(const BannerState());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.unauthenticated());
      when(() => mockCartBloc.state).thenReturn(const CartState.initial());
    });

    Widget wrapWidget(Widget child) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, _) => MultiBlocProvider(
          providers: [
            BlocProvider<SpecialCategoryProductsBloc>.value(value: mockSpecialBloc),
            BlocProvider<BannerBloc>.value(value: mockBannerBloc),
            BlocProvider<AuthBloc>.value(value: mockAuthBloc),
            BlocProvider<CartBloc>.value(value: mockCartBloc),
          ],
          child: MaterialApp(
            home: Scaffold(body: child),
          ),
        ),
      );
    }

    testWidgets('Suppresses PickabooAppBar when isEmbedded is true', (tester) async {
      await tester.pumpWidget(
        wrapWidget(
          const SpecialCategoryProductPage(
            categorySlug: 'air-conditioner',
            categoryName: 'Air Conditioner',
            isEmbedded: true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(PickabooAppBar), findsNothing);
    });

    testWidgets('Renders PickabooAppBar when isEmbedded is false (standalone mode)', (tester) async {
      await tester.pumpWidget(
        wrapWidget(
          const SpecialCategoryProductPage(
            categorySlug: 'air-conditioner',
            categoryName: 'Air Conditioner',
            isEmbedded: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(PickabooAppBar), findsOneWidget);
    });
  });

  group('CategoryProductPage Embedded Mode Tests', () {
    late MockCategoryProductsBloc mockCategoryBloc;
    late MockCategoryBannerBloc mockBannerBloc;
    late MockAuthBloc mockAuthBloc;
    late MockCartBloc mockCartBloc;

    setUp(() {
      mockCategoryBloc = MockCategoryProductsBloc();
      mockBannerBloc = MockCategoryBannerBloc();
      mockAuthBloc = MockAuthBloc();
      mockCartBloc = MockCartBloc();

      when(() => mockCategoryBloc.state).thenReturn(
        CategoryProductsState(
          categoryKey: '123',
          pagingState: PagingState<int, ProductEntity>(),
        ),
      );
      when(() => mockBannerBloc.state).thenReturn(const CategoryBannerState());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.unauthenticated());
      when(() => mockCartBloc.state).thenReturn(const CartState.initial());
    });

    Widget wrapWidget(Widget child) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, _) => MultiBlocProvider(
          providers: [
            BlocProvider<CategoryProductsBloc>.value(value: mockCategoryBloc),
            BlocProvider<CategoryBannerBloc>.value(value: mockBannerBloc),
            BlocProvider<AuthBloc>.value(value: mockAuthBloc),
            BlocProvider<CartBloc>.value(value: mockCartBloc),
          ],
          child: MaterialApp(
            home: Scaffold(body: child),
          ),
        ),
      );
    }

    testWidgets('Suppresses PickabooAppBar when isEmbedded is true', (tester) async {
      await tester.pumpWidget(
        wrapWidget(
          const CategoryProductPage(
            categoryId: '123',
            categoryName: 'Kitchen Appliances',
            isEmbedded: true,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(PickabooAppBar), findsNothing);
    });

    testWidgets('Renders PickabooAppBar when isEmbedded is false (standalone mode)', (tester) async {
      await tester.pumpWidget(
        wrapWidget(
          const CategoryProductPage(
            categoryId: '123',
            categoryName: 'Kitchen Appliances',
            isEmbedded: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(PickabooAppBar), findsOneWidget);
    });
  });
}
