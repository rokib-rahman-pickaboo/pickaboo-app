import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';

void main() {
  group('fromIdentifier — real admin identifiers', () {
    test('category page', () {
      expect(
        BannerDisplayPolicyX.fromIdentifier('default-category-banner-full-top'),
        BannerDisplayPolicy.full,
      );
      expect(
        BannerDisplayPolicyX.fromIdentifier(
          'default-category-banner-list-center',
        ),
        BannerDisplayPolicy.normal,
      );
      // Multi-column stays padded even though it is a row.
      expect(
        BannerDisplayPolicyX.fromIdentifier(
          'custom-category-banner-three-col-bottom',
        ),
        BannerDisplayPolicy.normal,
      );
    });

    test('home page behaviour is unchanged', () {
      expect(
        BannerDisplayPolicyX.fromIdentifier('home-banner-right'),
        BannerDisplayPolicy.full,
      );
      expect(
        BannerDisplayPolicyX.fromIdentifier('home-banner-xl'),
        BannerDisplayPolicy.normal,
      );
      expect(
        BannerDisplayPolicyX.fromIdentifier('home-banner-hero-top'),
        BannerDisplayPolicy.normal,
      );
      expect(
        BannerDisplayPolicyX.fromIdentifier('compare-banner-full'),
        BannerDisplayPolicy.full,
      );
    });

    test('normalizes case and separators', () {
      expect(
        BannerDisplayPolicyX.fromIdentifier(' Default_Category_Banner_Full_Top '),
        BannerDisplayPolicy.full,
      );
    });

    test('unknown identifiers fall back to normal', () {
      expect(
        BannerDisplayPolicyX.fromIdentifier('promo-strip'),
        BannerDisplayPolicy.normal,
      );
      expect(
        BannerDisplayPolicyX.fromIdentifier(''),
        BannerDisplayPolicy.normal,
      );
    });
  });

  group('columnsForIdentifier', () {
    test('layout token wins wherever it sits in the identifier', () {
      expect(
        BannerDisplayPolicyX.columnsForIdentifier(
          'custom-category-banner-three-col-bottom',
        ),
        3,
      );
      expect(
        BannerDisplayPolicyX.columnsForIdentifier('home-banner-two-col'),
        2,
      );
      expect(
        BannerDisplayPolicyX.columnsForIdentifier('compare-banner-two-col'),
        2,
      );
      expect(
        BannerDisplayPolicyX.columnsForIdentifier('home-banner-three-col'),
        3,
      );
    });

    test('single column by default', () {
      expect(
        BannerDisplayPolicyX.columnsForIdentifier(
          'default-category-banner-full-top',
        ),
        1,
      );
      expect(
        BannerDisplayPolicyX.isMultiColumn('default-category-banner-list-center'),
        isFalse,
      );
    });
  });

  group('slotForIdentifier', () {
    test('parses the position token', () {
      expect(
        BannerDisplayPolicyX.slotForIdentifier(
          'default-category-banner-full-top',
        ),
        BannerSlot.top,
      );
      expect(
        BannerDisplayPolicyX.slotForIdentifier(
          'default-category-banner-list-center',
        ),
        BannerSlot.center,
      );
      expect(
        BannerDisplayPolicyX.slotForIdentifier(
          'custom-category-banner-three-col-bottom',
        ),
        BannerSlot.bottom,
      );
    });

    test('"bottom" is not mistaken for "top"', () {
      expect(
        BannerDisplayPolicyX.slotForIdentifier('some-banner-bottom'),
        BannerSlot.bottom,
      );
    });

    test('unpositioned identifiers default to center', () {
      expect(
        BannerDisplayPolicyX.slotForIdentifier('home-banner-two-col'),
        BannerSlot.center,
      );
    });

    test('render order is top → center → bottom', () {
      expect(BannerSlot.values, [
        BannerSlot.top,
        BannerSlot.center,
        BannerSlot.bottom,
      ]);
    });
  });
}
