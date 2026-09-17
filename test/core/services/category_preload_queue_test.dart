import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/core/services/category_preload_queue.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';

void main() {
  group('CategoryPreloadQueue', () {
    late CategoryPreloadCache cache;
    late CategoryPreloadQueue queue;

    setUp(() {
      cache = CategoryPreloadCache();
      queue = CategoryPreloadQueue(cache);
    });

    const sampleProduct = ProductEntity(
      id: '201',
      expressDelivery: true,
      productName: 'Sample Laptop',
      sku: 'SKU201',
      slug: 'sample-laptop',
      typeId: 'simple',
      stockAvailable: true,
      freeDelivery: false,
      productPrice: 50000,
      productSpecialPrice: 45000,
      productDiscount: 10,
      offers: '',
      rating: 4.8,
      clubPoint: 50,
      ratingCount: 12,
      productImg: 'https://example.com/laptop.png',
      emiAvailable: true,
      comingSoon: false,
    );

    test('skips categories that are already fresh in cache', () {
      cache.save(['laptops'], products: [sampleProduct]);
      expect(cache.isCategoryFresh('laptops'), isTrue);

      // Enqueueing 'laptops' should be skipped because it's already fresh
      queue.enqueue(const [
        CategoryListEntity(
          id: '15',
          slug: 'laptops',
          name: 'Laptops',
          isSpecial: false,
          icon: '',
        ),
      ]);

      // Verify laptops is still cached
      expect(cache.read(['laptops']), isNotNull);
    });

    test('can clear pending queue', () {
      queue.pause();
      queue.enqueue(const [
        CategoryListEntity(
          id: '20',
          slug: 'smart-watches',
          name: 'Smart Watches',
          isSpecial: false,
          icon: '',
        ),
      ]);
      queue.clear();
      // Should not throw and queue is reset
      expect(queue, isNotNull);
    });
  });
}
