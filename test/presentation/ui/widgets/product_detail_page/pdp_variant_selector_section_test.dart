import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_variant_selector_section.dart';

ProductDetailEntity _createTestVariantProduct() {
  const matrix = VariantMatrixEntity(
    attributes: [
      VariantMatrixAttributeEntity(
        optionId: '93',
        optionName: 'Color',
        attributeCode: 'color',
        options: [
          VariantMatrixOptionEntity(optionValue: '1', optionText: 'Black'),
          VariantMatrixOptionEntity(optionValue: '2', optionText: 'White'),
        ],
      ),
      VariantMatrixAttributeEntity(
        optionId: '135',
        optionName: 'Size',
        attributeCode: 'size',
        options: [
          VariantMatrixOptionEntity(optionValue: '10', optionText: '40mm'),
          VariantMatrixOptionEntity(optionValue: '11', optionText: '44mm'),
          VariantMatrixOptionEntity(optionValue: '12', optionText: '42mm'),
        ],
      ),
    ],
    products: [
      VariantMatrixProductEntity(
        id: 101,
        stockAvailable: true,
        productPrice: 5990,
        productSpecialPrice: 5990,
        productDiscount: 0,
        emi: 0,
        clubPoints: 0,
        productImages: ['https://via.placeholder.com/400'],
        sku: 'WATCH-BLK-40',
        variantName: 'Black 40mm',
        selectedOptions: [
          VariantMatrixSelectedOptionEntity(
            optionId: '93',
            optionName: 'Color',
            attributeCode: 'color',
            optionValue: '1',
            optionText: 'Black',
          ),
          VariantMatrixSelectedOptionEntity(
            optionId: '135',
            optionName: 'Size',
            attributeCode: 'size',
            optionValue: '10',
            optionText: '40mm',
          ),
        ],
        isEnabled: true,
        salable: true,
      ),
      VariantMatrixProductEntity(
        id: 102,
        stockAvailable: true,
        productPrice: 5990,
        productSpecialPrice: 5990,
        productDiscount: 0,
        emi: 0,
        clubPoints: 0,
        productImages: ['https://via.placeholder.com/400'],
        sku: 'WATCH-BLK-42',
        variantName: 'Black 42mm',
        selectedOptions: [
          VariantMatrixSelectedOptionEntity(
            optionId: '93',
            optionName: 'Color',
            attributeCode: 'color',
            optionValue: '1',
            optionText: 'Black',
          ),
          VariantMatrixSelectedOptionEntity(
            optionId: '135',
            optionName: 'Size',
            attributeCode: 'size',
            optionValue: '12',
            optionText: '42mm',
          ),
        ],
        isEnabled: true,
        salable: true,
      ),
      VariantMatrixProductEntity(
        id: 103,
        stockAvailable: true,
        productPrice: 5990,
        productSpecialPrice: 5990,
        productDiscount: 0,
        emi: 0,
        clubPoints: 0,
        productImages: ['https://via.placeholder.com/400'],
        sku: 'WATCH-WHT-40',
        variantName: 'White 40mm',
        selectedOptions: [
          VariantMatrixSelectedOptionEntity(
            optionId: '93',
            optionName: 'Color',
            attributeCode: 'color',
            optionValue: '2',
            optionText: 'White',
          ),
          VariantMatrixSelectedOptionEntity(
            optionId: '135',
            optionName: 'Size',
            attributeCode: 'size',
            optionValue: '10',
            optionText: '40mm',
          ),
        ],
        isEnabled: true,
        salable: true,
      ),
      VariantMatrixProductEntity(
        id: 104,
        stockAvailable: true,
        productPrice: 5990,
        productSpecialPrice: 5990,
        productDiscount: 0,
        emi: 0,
        clubPoints: 0,
        productImages: ['https://via.placeholder.com/400'],
        sku: 'WATCH-WHT-44',
        variantName: 'White 44mm',
        selectedOptions: [
          VariantMatrixSelectedOptionEntity(
            optionId: '93',
            optionName: 'Color',
            attributeCode: 'color',
            optionValue: '2',
            optionText: 'White',
          ),
          VariantMatrixSelectedOptionEntity(
            optionId: '135',
            optionName: 'Size',
            attributeCode: 'size',
            optionValue: '11',
            optionText: '44mm',
          ),
        ],
        isEnabled: true,
        salable: true,
      ),
      VariantMatrixProductEntity(
        id: 105,
        stockAvailable: true,
        productPrice: 5990,
        productSpecialPrice: 5990,
        productDiscount: 0,
        emi: 0,
        clubPoints: 0,
        productImages: ['https://via.placeholder.com/400'],
        sku: 'WATCH-WHT-42',
        variantName: 'White 42mm',
        selectedOptions: [
          VariantMatrixSelectedOptionEntity(
            optionId: '93',
            optionName: 'Color',
            attributeCode: 'color',
            optionValue: '2',
            optionText: 'White',
          ),
          VariantMatrixSelectedOptionEntity(
            optionId: '135',
            optionName: 'Size',
            attributeCode: 'size',
            optionValue: '12',
            optionText: '42mm',
          ),
        ],
        isEnabled: true,
        salable: true,
      ),
    ],
  );

  return ProductDetailEntity(
    id: 1,
    sku: 'WATCH-BASE',
    slug: 'titan-watch',
    typeId: 'configurable',
    name: 'Titan Retrograde Watch',
    prodOfferPrice: 0,
    bestPrice: 0,
    freeDelivery: 1,
    categoryIds: const [],
    metaTitle: '',
    metaKeywords: '',
    metaDescription: '',
    images: const ['https://via.placeholder.com/400'],
    isWishlisted: false,
    isEligibleForReview: true,
    shareUrl: '',
    regularPrice: 8000,
    spacialPrice: 5990,
    discount: 25,
    stockAvailable: true,
    expressDelivery: 0,
    comingSoon: false,
    clubPoints: 0,
    brandId: '1',
    brand: 'Titan',
    soldByVendorUrlKey: '',
    soldBy: 'Pickaboo',
    offers: '',
    warranty: '',
    emi: 0,
    varient: const [],
    variantMatrix: matrix,
    extraOptions: const [],
    buysTogather: const [],
    productDetails: '',
    moreInformation: const [],
    ratingSummaryValue: 4.9,
    ratingSummary: 98,
    reviewsCount: 10,
    detailedRatings: const [],
    detailedSummary: const [],
    allReviewImages: const [],
    youtubeVideos: const [],
    reviewsCollection: const [],
    similarProducts: const [],
    youMayAlsoLike: const [],
    otherBrands: const [],
    recentlyViewedProducts: const [],
    cacheTime: DateTime(2026),
  );
}

void main() {
  Widget buildHarness({
    required ProductDetailEntity product,
    required List<ConfigurableItemOptionEntity> selectedVariants,
    required ValueChanged<List<ConfigurableItemOptionEntity>> onVariantsChanged,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: PdpVariantSelectorSection(
              product: product,
              selectedVariants: selectedVariants,
              onVariantsChanged: onVariantsChanged,
            ),
          ),
        ),
      ),
    );
  }

  group('PdpVariantSelectorSection - Matrix Filtering & Logic Tests', () {
    testWidgets('renders all options when no variant is selected', (tester) async {
      final product = _createTestVariantProduct();

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [],
          onVariantsChanged: (_) {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Black'), findsOneWidget);
      expect(find.text('White'), findsOneWidget);
      expect(find.text('40mm'), findsOneWidget);
      expect(find.text('44mm'), findsOneWidget);
      expect(find.text('42mm'), findsOneWidget);
    });

    testWidgets('filters size options when Black is selected (44mm is excluded)', (tester) async {
      final product = _createTestVariantProduct();

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [
            ConfigurableItemOptionEntity(optionId: '93', optionValue: '1'),
          ],
          onVariantsChanged: (_) {},
        ),
      );
      await tester.pumpAndSettle();

      // When Black is selected, header says "Black" and card says "Black" (2 total)
      expect(find.text('Black'), findsNWidgets(2));
      expect(find.text('White'), findsOneWidget);
      expect(find.text('40mm'), findsOneWidget);
      expect(find.text('42mm'), findsOneWidget);
      // 44mm is NOT available for Black in the matrix!
      expect(find.text('44mm'), findsNothing);
    });

    testWidgets('shows all sizes when White is selected (44mm is included)', (tester) async {
      final product = _createTestVariantProduct();

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [
            ConfigurableItemOptionEntity(optionId: '93', optionValue: '2'),
          ],
          onVariantsChanged: (_) {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Black'), findsOneWidget);
      // When White is selected, header says "White" and card says "White" (2 total)
      expect(find.text('White'), findsNWidgets(2));
      expect(find.text('40mm'), findsOneWidget);
      expect(find.text('44mm'), findsOneWidget);
      expect(find.text('42mm'), findsOneWidget);
    });

    testWidgets('filters color options when 44mm is selected (Black is excluded)', (tester) async {
      final product = _createTestVariantProduct();

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [
            ConfigurableItemOptionEntity(optionId: '135', optionValue: '11'),
          ],
          onVariantsChanged: (_) {},
        ),
      );
      await tester.pumpAndSettle();

      // Only White supports 44mm!
      expect(find.text('White'), findsOneWidget);
      expect(find.text('Black'), findsNothing);
      expect(find.text('40mm'), findsOneWidget);
      // When 44mm is selected, header says "44mm" and chip says "44mm" (2 total)
      expect(find.text('44mm'), findsNWidgets(2));
      expect(find.text('42mm'), findsOneWidget);
    });

    testWidgets('tapping an option triggers onVariantsChanged with selection', (tester) async {
      final product = _createTestVariantProduct();
      List<ConfigurableItemOptionEntity>? changed;

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [],
          onVariantsChanged: (v) => changed = v,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Black').last);
      await tester.pumpAndSettle();

      expect(changed, isNotNull);
      expect(changed!.length, 1);
      expect(changed!.first.optionId, '93');
      expect(changed!.first.optionValue, '1');
    });

    testWidgets('tapping an already selected option toggles it off', (tester) async {
      final product = _createTestVariantProduct();
      List<ConfigurableItemOptionEntity>? changed;

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [
            ConfigurableItemOptionEntity(optionId: '93', optionValue: '1'),
          ],
          onVariantsChanged: (v) => changed = v,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Black').last);
      await tester.pumpAndSettle();

      expect(changed, isNotNull);
      expect(changed!.isEmpty, isTrue);
    });

    testWidgets('renders checkmark icon badge when an option is selected', (tester) async {
      final product = _createTestVariantProduct();

      await tester.pumpWidget(
        buildHarness(
          product: product,
          selectedVariants: const [
            ConfigurableItemOptionEntity(optionId: '93', optionValue: '1'),
          ],
          onVariantsChanged: (_) {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
