import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/data/mapper/banner_mapper/banner_mapper.dart';
import 'package:pickaboo/data/model/banner_response/banner_response.dart';

void main() {
  Map<String, dynamic> bannerJson({
    required String isCategory,
    String isActive = 'Yes',
    String forHomepage = 'No',
    String identifier = 'category-banner-full',
    int categoryId = 0,
    Map<String, dynamic>? category,
    String link = 'some-product-slug',
    String? linkType,
    String title = 'Banner title',
  }) => {
    'entity_id': 11,
    'title': title,
    'image': 'a.jpg',
    'image_url': 'https://cdn/a.jpg',
    'responsive_image': '',
    'responsive_image_url': '',
    'link': link,
    'link_type': linkType,
    'is_active': isActive,
    'identifier': identifier,
    'category_id': categoryId,
    'is_category': isCategory,
    'sort_order': 1,
    'column_count': 1,
    'image_position': '',
    'for_homepage': forHomepage,
    'category': category,
  };

  group('is_category flag parsing', () {
    test('"Yes" maps to 1 / linksToCategory', () {
      final banner = BannerResponse.fromJson(
        bannerJson(isCategory: 'Yes'),
      ).toEntity();

      expect(banner.isCategory, 1);
      expect(banner.linksToCategory, isTrue);
    });

    test('"No" maps to 0', () {
      final banner = BannerResponse.fromJson(
        bannerJson(isCategory: 'No'),
      ).toEntity();

      expect(banner.isCategory, 0);
      expect(banner.linksToCategory, isFalse);
    });

    test('surface flags parse the same way', () {
      final banner = BannerResponse.fromJson(
        bannerJson(isCategory: 'Yes', isActive: 'Yes', forHomepage: 'No'),
      ).toEntity();

      // Category page takes is_active == 1 && for_homepage == 0.
      expect(banner.isActive, 1);
      expect(banner.forHomepage, 0);
    });
  });

  group('BannerEntity.tapTarget', () {
    test('category banner prefers category.id and category.name', () {
      final banner = BannerResponse.fromJson(
        bannerJson(
          isCategory: 'Yes',
          categoryId: 99,
          category: {'id': 42, 'name': 'Smartphones', 'slug': 'smartphones'},
        ),
      ).toEntity();

      final target = banner.tapTarget;
      expect(target.linkType, 'category');
      expect(target.link, '42');
      expect(target.name, 'Smartphones');
    });

    test('category banner falls back to category_id and banner title', () {
      final banner = BannerResponse.fromJson(
        bannerJson(isCategory: 'Yes', categoryId: 99, title: 'Eid Deals'),
      ).toEntity();

      final target = banner.tapTarget;
      expect(target.linkType, 'category');
      expect(target.link, '99');
      expect(target.name, 'Eid Deals');
    });

    test('non-category banner uses link and link_type', () {
      final banner = BannerResponse.fromJson(
        bannerJson(
          isCategory: 'No',
          link: 'iphone-15-pro',
          linkType: 'product',
        ),
      ).toEntity();

      final target = banner.tapTarget;
      expect(target.linkType, 'product');
      expect(target.link, 'iphone-15-pro');
    });

    test('non-category banner defaults link_type to product when null', () {
      final banner = BannerResponse.fromJson(
        bannerJson(isCategory: 'No', link: 'x'),
      ).toEntity();

      expect(banner.tapTarget.linkType, 'product');
    });
  });
}
