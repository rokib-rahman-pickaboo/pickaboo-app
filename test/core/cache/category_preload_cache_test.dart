import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';

void main() {
  group('CategoryPreloadCache', () {
    late CategoryPreloadCache cache;

    setUp(() {
      cache = CategoryPreloadCache();
    });

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

    test('saves and retrieves products by multiple keys', () {
      cache.save(
        ['cat:18', 'laptops', 'Laptops'],
        products: [sampleProduct],
      );

      final byId = cache.read(['cat:18']);
      expect(byId, isNotNull);
      expect(byId!.products.length, equals(1));
      expect(byId.products.first.id, equals('101'));

      final bySlug = cache.read(['laptops']);
      expect(bySlug, isNotNull);
      expect(bySlug!.products.first.productName, equals('Sample Phone'));

      final byName = cache.read(['Laptops']);
      expect(byName, isNotNull);

      final missing = cache.read(['unknown_cat']);
      expect(missing, isNull);
    });

    test('clears cache entries properly', () {
      cache.save(['test_key'], products: [sampleProduct]);
      expect(cache.read(['test_key']), isNotNull);

      cache.clear('test_key');
      expect(cache.read(['test_key']), isNull);
    });

    test('isCategoryFresh correctly identifies fresh vs missing entries', () {
      expect(cache.isCategoryFresh('phones'), isFalse);

      cache.save(['phones'], products: [sampleProduct]);
      expect(cache.isCategoryFresh('phones'), isTrue);
      expect(cache.isCategoryFresh('unknown'), isFalse);
    });

    test('seedFromHomeFeed seeds preview products from category sections', () {
      const homeFeed = HomeContentEntity(
        categoryList: [
          CategoryListEntity(
            id: '10',
            slug: 'smartphones',
            name: 'Smartphones',
            isSpecial: false,
            icon: '',
          ),
        ],
        mainSlider: [],
        commonLinkSlider: [],
        categorySlider: [],
        categoryProducts: [
          CategoryProductEntity(
            categoryId: '10',
            categorySlug: 'smartphones',
            categoryName: 'Smartphones',
            isHome: true,
            isTodaysSpecial: false,
            isLaunchingSoon: false,
            isBrand: false,
            isFeatured: false,
            isBanner: false,
            homeBlockBg: '',
            isFlashHourCat: false,
            background: '',
            image: '',
            isSpecial: false,
            products: [sampleProduct],
          ),
        ],
        justForYou: JustForYouEntity(
          total: 1,
          list: [sampleProduct],
        ),
      );

      cache.seedFromHomeFeed(homeFeed);

      final byId = cache.read(['10']);
      expect(byId, isNotNull);
      expect(byId!.products.first.id, equals('101'));

      final byPrefixedId = cache.read(['cat:10']);
      expect(byPrefixedId, isNotNull);

      final bySlug = cache.read(['smartphones']);
      expect(bySlug, isNotNull);

      final byName = cache.read(['Smartphones']);
      expect(byName, isNotNull);
    });

    test('enforces maxEntries LRU bound', () {
      for (int i = 0; i < 30; i++) {
        cache.save(['cat_$i'], products: [sampleProduct]);
      }

      // The earliest entries (e.g. cat_0, cat_1...) should have been evicted
      expect(cache.read(['cat_0']), isNull);
      expect(cache.read(['cat_1']), isNull);
      expect(cache.read(['cat_4']), isNull);

      // Recent entries should remain
      expect(cache.read(['cat_29']), isNotNull);
      expect(cache.read(['cat_28']), isNotNull);
    });
  });
}
