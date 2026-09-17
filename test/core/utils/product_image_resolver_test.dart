import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';

void main() {
  group('ProductImageResolver', () {
    test('identifies Pickaboo and Magento placeholder URLs correctly', () {
      // Pickaboo default placeholder
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/placeholder/default/Pickaboo-plholder-thumb.png',
        ),
        isTrue,
      );

      // Magento placeholder patterns
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/placeholder/.jpg',
        ),
        isTrue,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/placeholder/.png',
        ),
        isTrue,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/magento_catalog/images/product/placeholder/something.jpg',
        ),
        isTrue,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://pickaboo.com/media/catalog/product/.jpg',
        ),
        isTrue,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(null),
        isTrue,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(''),
        isTrue,
      );

      // Valid product image URLs
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/f/_/f.png',
        ),
        isFalse,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/h/h/hh_3.png',
        ),
        isFalse,
      );
      expect(
        ProductImageResolver.isPlaceholderOrBroken(
          'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/f/t/ftkl18tv16td-8-5-25.jpg-base-image-second.jpg',
        ),
        isFalse,
      );
    });

    test('cacheImage stores and retrieves valid image URLs', () {
      const productId = 999991;
      const validUrl = 'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/test.png';

      ProductImageResolver.cacheImage(productId, validUrl);
      expect(ProductImageResolver.getCachedImage(productId), equals(validUrl));

      // Attempting to cache placeholder must be ignored
      ProductImageResolver.cacheImage(
        productId,
        'https://storage.googleapis.com/pickaboo-prod/media/catalog/product/placeholder/default/Pickaboo-plholder-thumb.png',
      );
      // Value should remain the valid URL
      expect(ProductImageResolver.getCachedImage(productId), equals(validUrl));
    });
  });
}
