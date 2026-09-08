import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/ui/pages/home_page/home_page.dart';

void main() {
  group('Category Ordering Alignment Tests', () {
    // Exact categories from /rest/V1/all-categories (Drawer menu order)
    final drawerCategories = [
      const CategoryEntity(
        id: '7',
        slug: 'electronics-appliances',
        name: 'Electronics & Appliances',
        isSpecial: false,
        icon: 'https://example.com/ea.png',
        children: [],
      ),
      const CategoryEntity(
        id: '171',
        slug: 'smartphone',
        name: 'Smartphones',
        isSpecial: false,
        icon: 'https://example.com/sp.png',
        children: [],
      ),
      const CategoryEntity(
        id: '29',
        slug: 'television',
        name: 'Televisions',
        isSpecial: false,
        icon: 'https://example.com/tv.png',
        children: [],
      ),
      const CategoryEntity(
        id: '4',
        slug: 'computer-pc',
        name: 'Computers',
        isSpecial: true,
        icon: 'https://example.com/pc.png',
        children: [],
      ),
      const CategoryEntity(
        id: '20',
        slug: 'computer-accessories',
        name: 'Computer Accessories',
        isSpecial: true,
        icon: 'https://example.com/ca.png',
        children: [],
      ),
      const CategoryEntity(
        id: '192',
        slug: 'feature-phone',
        name: 'Feature Phones',
        isSpecial: false,
        icon: 'https://example.com/fp.png',
        children: [],
      ),
      const CategoryEntity(
        id: '2416',
        slug: 'upto-25-offer',
        name: 'Upto 25% Offer',
        isSpecial: false,
        icon: 'https://example.com/offer.png',
        children: [],
      ),
    ];

    // Unordered categories returned by /rest/V1/new-homepageapi
    final unorderedHomeCategories = [
      const CategoryListEntity(
        id: '4',
        slug: 'computer-pc',
        name: 'Computers',
        isSpecial: true,
        icon: 'https://example.com/pc.png',
      ),
      const CategoryListEntity(
        id: '7',
        slug: 'electronics-appliances',
        name: 'Electronics & Appliances',
        isSpecial: false,
        icon: 'https://example.com/ea.png',
      ),
      const CategoryListEntity(
        id: '171',
        slug: 'smartphone',
        name: 'Smartphones',
        isSpecial: false,
        icon: 'https://example.com/sp.png',
      ),
      const CategoryListEntity(
        id: '2416',
        slug: 'upto-25-offer',
        name: 'Upto 25% Offer',
        isSpecial: false,
        icon: 'https://example.com/offer.png',
      ),
      const CategoryListEntity(
        id: '192',
        slug: 'feature-phone',
        name: 'Feature Phones',
        isSpecial: false,
        icon: 'https://example.com/fp.png',
      ),
      const CategoryListEntity(
        id: '20',
        slug: 'computer-accessories',
        name: 'Computer Accessories',
        isSpecial: true,
        icon: 'https://example.com/ca.png',
      ),
      const CategoryListEntity(
        id: '29',
        slug: 'television',
        name: 'Televisions',
        isSpecial: false,
        icon: 'https://example.com/tv.png',
      ),
    ];

    test('reorders homepage categories to match drawer categories order exactly', () {
      final sorted = alignCategoriesWithDrawerOrder(
        unorderedHomeCategories,
        drawerCategories,
      );

      expect(sorted.map((c) => c.name).toList(), [
        'Electronics & Appliances',
        'Smartphones',
        'Televisions',
        'Computers',
        'Computer Accessories',
        'Feature Phones',
        'Upto 25% Offer',
      ]);

      expect(sorted.map((c) => c.id).toList(), [
        '7',
        '171',
        '29',
        '4',
        '20',
        '192',
        '2416',
      ]);
    });

    test('returns original list when drawerCategories is null', () {
      final sorted = alignCategoriesWithDrawerOrder(
        unorderedHomeCategories,
        null,
      );

      expect(
        sorted.map((c) => c.id).toList(),
        unorderedHomeCategories.map((c) => c.id).toList(),
      );
    });

    test('returns original list when drawerCategories is empty', () {
      final sorted = alignCategoriesWithDrawerOrder(
        unorderedHomeCategories,
        [],
      );

      expect(
        sorted.map((c) => c.id).toList(),
        unorderedHomeCategories.map((c) => c.id).toList(),
      );
    });

    test('places unknown categories not in drawer at the end safely', () {
      final withExtra = [
        ...unorderedHomeCategories,
        const CategoryListEntity(
          id: '9999',
          slug: 'extra-category',
          name: 'Extra Category',
          isSpecial: false,
          icon: '',
        ),
      ];

      final sorted = alignCategoriesWithDrawerOrder(
        withExtra,
        drawerCategories,
      );

      expect(sorted.last.name, 'Extra Category');
      expect(sorted.length, 8);
      // All other categories are in order
      expect(sorted.take(7).map((c) => c.name).toList(), [
        'Electronics & Appliances',
        'Smartphones',
        'Televisions',
        'Computers',
        'Computer Accessories',
        'Feature Phones',
        'Upto 25% Offer',
      ]);
    });
  });
}
