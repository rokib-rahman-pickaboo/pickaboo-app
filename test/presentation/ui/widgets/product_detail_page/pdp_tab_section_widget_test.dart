import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_tab_section_widget.dart';

class MockReviewBloc extends MockBloc<ReviewEvent, ReviewState> implements ReviewBloc {}

Widget createWidgetUnderTest(
  ProductDetailEntity product, {
  Key? key,
  ReviewBloc? reviewBloc,
}) {
  final bloc = reviewBloc ?? _createDefaultMockReviewBloc();
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: BlocProvider<ReviewBloc>.value(
            value: bloc,
            child: PdpTabSectionWidget(key: key, product: product),
          ),
        ),
      ),
    ),
  );
}

MockReviewBloc _createDefaultMockReviewBloc() {
  final bloc = MockReviewBloc();
  when(() => bloc.state).thenReturn(ReviewState(pagingState: PagingState()));
  return bloc;
}

ProductDetailEntity _dummyProduct({
  required List<MoreInformationEntity> moreInformation,
  int reviewsCount = 0,
  List<ReviewEntity> reviewsCollection = const [],
}) =>
    ProductDetailEntity(
      id: 101,
      sku: 'TV-101',
      slug: 'smart-4k-uhd-tv',
      typeId: 'simple',
      name: 'Smart 4K UHD TV',
      prodOfferPrice: 0,
      bestPrice: 0,
      freeDelivery: 0,
      categoryIds: const [],
      metaTitle: '',
      metaKeywords: '',
      metaDescription: '',
      images: const [],
      isWishlisted: false,
      isEligibleForReview: true,
      shareUrl: '',
      regularPrice: 50000,
      spacialPrice: 45000,
      discount: 10,
      stockAvailable: true,
      expressDelivery: 0,
      comingSoon: false,
      clubPoints: 0,
      brandId: '1',
      brand: 'Samsung',
      soldByVendorUrlKey: '',
      soldBy: 'Pickaboo',
      offers: '',
      warranty: '',
      emi: 0,
      varient: const [],
      extraOptions: const [],
      buysTogather: const [],
      productDetails: '',
      ratingSummaryValue: 5.0,
      ratingSummary: 100,
      reviewsCount: reviewsCount,
      detailedRatings: const [],
      detailedSummary: const [],
      allReviewImages: const [],
      reviewsCollection: reviewsCollection,
      similarProducts: const [],
      youMayAlsoLike: const [],
      otherBrands: const [],
      recentlyViewedProducts: const [],
      cacheTime: DateTime(2026),
      moreInformation: moreInformation,
    );

void main() {
  group('PdpTabSectionWidget Specification Redesign', () {
    testWidgets(
        'Renders specifications in unified container with zebra-striped alternating row colors',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final testProduct = _dummyProduct(
        moreInformation: const [
          MoreInformationEntity(
            groupLabel: 'General',
            attrList: [
              AttrListEntity(label: 'Feature', value: '4K'),
              AttrListEntity(
                label: 'Warranty Information',
                value: '5 Years Service Warranty Without Parts & Panele',
              ),
              AttrListEntity(label: 'Screen Size', value: '55 Inch'),
            ],
          ),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct));
      await tester.pumpAndSettle();

      // Check tab header
      expect(find.text('Specifications'), findsOneWidget);

      // Check labels and values
      expect(find.text('Feature'), findsOneWidget);
      expect(find.text('4K'), findsOneWidget);
      expect(find.text('Warranty Information'), findsOneWidget);
      expect(
        find.text('5 Years Service Warranty Without Parts & Panele'),
        findsOneWidget,
      );
      expect(find.text('Screen Size'), findsOneWidget);
      expect(find.text('55 Inch'), findsOneWidget);

      // Verify row containers have alternating colors (white, pageBg, white)
      final rowContainers = tester.widgetList<Container>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).color != null &&
              ((widget.decoration as BoxDecoration).color == AppColors.white ||
                  (widget.decoration as BoxDecoration).color ==
                      AppColors.pageBg) &&
              widget.child is Row,
        ),
      );

      expect(rowContainers.length, 3);
      final list = rowContainers.toList();
      expect((list[0].decoration as BoxDecoration).color, AppColors.white);
      expect((list[1].decoration as BoxDecoration).color, AppColors.pageBg);
      expect((list[2].decoration as BoxDecoration).color, AppColors.white);
    });

    testWidgets(
        'Renders group titles matching exact API response casing instead of uppercase',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final testProduct = _dummyProduct(
        moreInformation: const [
          MoreInformationEntity(
            groupLabel: 'General Information',
            attrList: [
              AttrListEntity(label: 'Brand', value: 'Sony'),
            ],
          ),
          MoreInformationEntity(
            groupLabel: 'Display & Connectivity',
            attrList: [
              AttrListEntity(label: 'Resolution', value: '4K UHD'),
            ],
          ),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct));
      await tester.pumpAndSettle();

      // Expect exact casing from API response
      expect(find.text('General Information'), findsOneWidget);
      expect(find.text('Display & Connectivity'), findsOneWidget);

      // Verify uppercase is NOT present
      expect(find.text('GENERAL INFORMATION'), findsNothing);
      expect(find.text('DISPLAY & CONNECTIVITY'), findsNothing);
    });

    testWidgets(
        'Includes is_featured == true attributes in Specifications tab and displays all groups continuously',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final testProduct = _dummyProduct(
        moreInformation: const [
          MoreInformationEntity(
            groupLabel: 'Featured Group Only',
            attrList: [
              AttrListEntity(
                label: 'Warranty Information',
                value: '3 Months Brand Warranty',
                isFeatured: true,
              ),
            ],
          ),
          MoreInformationEntity(
            groupLabel: 'General',
            attrList: [
              AttrListEntity(
                label: 'Highlight Spec',
                value: 'Top Spec Value',
                isFeatured: true,
              ),
              AttrListEntity(
                label: 'Brand',
                value: 'NOVA',
                isFeatured: false,
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct));
      await tester.pumpAndSettle();

      // Check that both group headers are rendered
      expect(find.text('Featured Group Only'), findsOneWidget);
      expect(find.text('General'), findsOneWidget);

      // Check that non-featured spec appears in Specifications tab
      expect(find.text('Brand'), findsOneWidget);
      expect(find.text('NOVA'), findsOneWidget);

      // Check that is_featured == true attributes ARE now included in Specifications tab
      expect(find.text('Warranty Information'), findsOneWidget);
      expect(find.text('3 Months Brand Warranty'), findsOneWidget);
      expect(find.text('Highlight Spec'), findsOneWidget);
      expect(find.text('Top Spec Value'), findsOneWidget);
    });

    testWidgets(
        'Displays View All button when specifications exceed threshold and toggles View Less on tap',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final testProduct = _dummyProduct(
        moreInformation: const [
          MoreInformationEntity(
            groupLabel: 'Long Spec Group',
            attrList: [
              AttrListEntity(label: 'Spec 1', value: 'Val 1'),
              AttrListEntity(label: 'Spec 2', value: 'Val 2'),
              AttrListEntity(label: 'Spec 3', value: 'Val 3'),
              AttrListEntity(label: 'Spec 4', value: 'Val 4'),
              AttrListEntity(label: 'Spec 5', value: 'Val 5'),
              AttrListEntity(label: 'Spec 6', value: 'Val 6'),
              AttrListEntity(label: 'Spec 7', value: 'Val 7'),
            ],
          ),
        ],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct));
      await tester.pumpAndSettle();

      // Should show View All button when total attrs > 5
      expect(find.text('View All'), findsOneWidget);
      expect(find.text('View Less'), findsNothing);

      // Tap View All
      await tester.tap(find.text('View All'));
      await tester.pumpAndSettle();

      // Should now show View Less
      expect(find.text('View Less'), findsOneWidget);
      expect(find.text('View All'), findsNothing);

      // Tap View Less
      await tester.tap(find.text('View Less'));
      await tester.pumpAndSettle();

      expect(find.text('View All'), findsOneWidget);
    });

    testWidgets(
        'selectTab programmatically switches active tab to Reviews tab',
        (WidgetTester tester) async {
      final tabKey = GlobalKey<PdpTabSectionWidgetState>();
      final testProduct = _dummyProduct(moreInformation: const []);

      await tester.pumpWidget(createWidgetUnderTest(testProduct, key: tabKey));
      await tester.pumpAndSettle();

      // Initially on Specifications tab
      expect(find.text('Customer Reviews (0)'), findsNothing);

      // Programmatically switch to tab index 2 (Reviews)
      tabKey.currentState?.selectTab(2);
      await tester.pumpAndSettle();

      // Now on Reviews tab
      expect(find.text('Customer Reviews (0)'), findsOneWidget);
    });

    testWidgets(
        'Reviews count 1383 is displayed consistently in tab header and All Reviews button',
        (WidgetTester tester) async {
      final tabKey = GlobalKey<PdpTabSectionWidgetState>();
      final dummyReview = ReviewEntity(
        reviewId: 'r1',
        postedOn: DateTime(2026, 1, 1),
        reviwerId: 'u1',
        reviwerName: 'John Doe',
        reviwerImage: '',
        reviwerRating: 5.0,
        title: 'Great product',
        detail: 'Loved it very much.',
        isRecommended: true,
        images: const [],
        likeCount: 0,
        dislikesCount: 0,
        doLike: false,
        doDislike: false,
      );

      final testProduct = _dummyProduct(
        moreInformation: const [],
        reviewsCount: 1383,
        reviewsCollection: [dummyReview],
      );

      await tester.pumpWidget(createWidgetUnderTest(testProduct, key: tabKey));
      await tester.pumpAndSettle();

      // Check tab header has 1383
      expect(find.text('Reviews (1383)'), findsOneWidget);

      // Switch to Reviews tab
      tabKey.currentState?.selectTab(2);
      await tester.pumpAndSettle();

      // Check All Reviews button displays (1383)
      expect(find.text('All Reviews (1383)'), findsOneWidget);
    });

    testWidgets(
        'Shows Skeletonizer loading state while reviews are loading and hides "No reviews yet"',
        (WidgetTester tester) async {
      final tabKey = GlobalKey<PdpTabSectionWidgetState>();
      final mockBloc = MockReviewBloc();

      when(() => mockBloc.state).thenReturn(
        ReviewState(
          pagingState: PagingState(isLoading: true),
        ),
      );

      final testProduct = _dummyProduct(
        moreInformation: const [],
        reviewsCount: 15,
        reviewsCollection: const [],
      );

      await tester.pumpWidget(
        createWidgetUnderTest(
          testProduct,
          key: tabKey,
          reviewBloc: mockBloc,
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      // Switch to Reviews tab
      tabKey.currentState?.selectTab(2);
      await tester.pump(const Duration(milliseconds: 100));

      // Should show Customer Reviews (15)
      expect(find.text('Customer Reviews (15)'), findsOneWidget);

      // Should show Skeletonizer loading skeleton
      expect(find.byKey(const ValueKey('pdp_reviews_loading_skeleton')), findsOneWidget);

      // Must NOT show "No reviews yet" while loading
      expect(find.text(AppStrings.pdpNoReviews), findsNothing);
    });
  });
}

