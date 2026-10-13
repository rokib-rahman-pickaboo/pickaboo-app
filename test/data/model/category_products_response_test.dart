import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/data/model/category_products_response/category_products_response.dart';
import 'package:pickaboo/data/mapper/category_products_mapper/category_products_mapper.dart';

void main() {
  group('CategoryProductsResponse', () {
    test('safely parses when applied_filters and other list fields are empty strings', () {
      final json = <String, dynamic>{
        'category_id': 4550,
        'category_slug': 'unbeatable-deals-on-hisense',
        'category_name': 'Unbeatable Deals on Hisense',
        'meta_title': null,
        'meta_keywords': null,
        'meta_description': null,
        'image': '',
        'mobile_image': '',
        'banner': '',
        'filter_data': '',
        'featured_category': '',
        'featured_product_total': 0,
        'featured_products': '',
        'applied_filters': '',
        'total_cat_prods': 1,
        'cat_prods': [
          {
            'id': '106974',
            'product_name': 'Test Product',
            'sku': 'SKU123',
            'slug': 'test-product',
            'product_price': 1000,
          }
        ],
      };

      final response = CategoryProductsResponse.fromJson(json);
      expect(response.categoryId, 4550);
      expect(response.categorySlug, 'unbeatable-deals-on-hisense');
      expect(response.appliedFilters, isNull);
      expect(response.banner, isNull);
      expect(response.catProds, hasLength(1));

      final domain = response.toDomain();
      expect(domain.categoryId, 4550);
      expect(domain.products, hasLength(1));
      expect(domain.appliedFilters, isEmpty);
      expect(domain.banners, isEmpty);
    });

    test('safely parses standard responses with lists and string numbers', () {
      final json = <String, dynamic>{
        'category_id': '4550',
        'category_slug': 'unbeatable-deals-on-hisense',
        'category_name': 'Unbeatable Deals on Hisense',
        'banner': [
          {
            'id': '101',
            'image': 'https://example.com/banner.jpg',
            'mobile_image': 'https://example.com/mobile.jpg',
          }
        ],
        'applied_filters': [
          {
            'code': 'brand',
            'label': 'Brand',
            'value': 123,
            'value_label': 'Hisense',
          }
        ],
        'featured_product_total': '5',
        'total_cat_prods': '25',
        'cat_prods': [
          {
            'id': '106974',
            'product_name': 'Hisense TV',
            'sku': 'HIS123',
            'slug': 'hisense-tv',
            'product_price': 45000,
          }
        ],
      };

      final response = CategoryProductsResponse.fromJson(json);
      expect(response.categoryId, 4550);
      expect(response.totalCatProds, 25);
      expect(response.featuredProductTotal, 5);
      expect(response.banner, hasLength(1));
      expect(response.appliedFilters, hasLength(1));
      expect(response.appliedFilters![0].value, '123');
      expect(response.appliedFilters![0].valueLabel, 'Hisense');

      final domain = response.toDomain();
      expect(domain.categoryId, 4550);
      expect(domain.banners, hasLength(1));
      expect(domain.appliedFilters, hasLength(1));
      expect(domain.appliedFilters[0].value, '123');
      expect(domain.products, hasLength(1));
    });
  });
}
