import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/category_lookup_helper.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';

void main() {
  group('CategoryLookupHelper', () {
    const televisionSubcategories = [
      CategoryEntity(
        id: '291',
        slug: 'samsung-tv',
        name: 'Samsung',
        isSpecial: false,
        icon: 'https://example.com/samsung.png',
        children: [],
      ),
      CategoryEntity(
        id: '292',
        slug: 'haier-tv',
        name: 'Haier',
        isSpecial: false,
        icon: 'https://example.com/haier.png',
        children: [],
      ),
      CategoryEntity(
        id: '293',
        slug: 'sony-tv',
        name: 'Sony',
        isSpecial: false,
        icon: 'https://example.com/sony.png',
        children: [],
      ),
    ];

    const mockCategories = [
      CategoryEntity(
        id: '1',
        slug: 'electronics',
        name: 'Electronics & Appliances',
        isSpecial: false,
        icon: 'https://example.com/ea.png',
        children: [
          CategoryEntity(
            id: '29',
            slug: 'television',
            name: 'Televisions',
            isSpecial: false,
            icon: 'https://example.com/tv.png',
            children: televisionSubcategories,
          ),
        ],
      ),
      CategoryEntity(
        id: '2',
        slug: 'smartphones',
        name: 'Smartphones',
        isSpecial: false,
        icon: 'https://example.com/phones.png',
        children: [
          CategoryEntity(
            id: '201',
            slug: 'apple',
            name: 'Apple',
            isSpecial: false,
            icon: '',
            children: [],
          ),
        ],
      ),
    ];

    test('finds Television when searched by singular "Television" and tree has "Televisions"', () {
      final match = CategoryLookupHelper.findCategory(
        mockCategories,
        categoryName: 'Television',
      );

      expect(match, isNotNull);
      expect(match!.id, '29');
      expect(match.name, 'Televisions');
      expect(match.children.length, 3);
      expect(match.children.map((c) => c.name), containsAll(['Samsung', 'Haier', 'Sony']));
    });

    test('finds Television when searched by slug "television"', () {
      final match = CategoryLookupHelper.findCategory(
        mockCategories,
        categorySlug: 'television',
      );

      expect(match, isNotNull);
      expect(match!.id, '29');
      expect(match.children.length, 3);
    });

    test('finds Television when searched by id "29"', () {
      final match = CategoryLookupHelper.findCategory(
        mockCategories,
        categoryId: '29',
      );

      expect(match, isNotNull);
      expect(match!.name, 'Televisions');
      expect(match.children.length, 3);
    });

    test('finds deeply nested category at any depth', () {
      final match = CategoryLookupHelper.findCategory(
        mockCategories,
        categoryName: 'Sony',
      );

      expect(match, isNotNull);
      expect(match!.id, '293');
      expect(match.name, 'Sony');
    });

    test('normalizes and stems plurals to singular correctly', () {
      expect(CategoryLookupHelper.stemAndNormalize('Televisions'), 'television');
      expect(CategoryLookupHelper.stemAndNormalize('Television'), 'television');
      expect(CategoryLookupHelper.stemAndNormalize('Smartphones'), 'smartphone');
      expect(CategoryLookupHelper.stemAndNormalize('Smartphone'), 'smartphone');
      expect(CategoryLookupHelper.stemAndNormalize('Computer Accessories'), 'computeraccessory');
      expect(CategoryLookupHelper.stemAndNormalize('Accessories'), 'accessory');
    });

    test('returns null when category does not exist in tree', () {
      final match = CategoryLookupHelper.findCategory(
        mockCategories,
        categoryName: 'NonExistentCategory',
      );

      expect(match, isNull);
    });

    test('findParentCategory correctly locates parent category node', () {
      final parentOfSony = CategoryLookupHelper.findParentCategory(
        mockCategories,
        categoryName: 'Sony',
      );
      expect(parentOfSony, isNotNull);
      expect(parentOfSony!.name, 'Televisions');

      final parentOfTv = CategoryLookupHelper.findParentCategory(
        mockCategories,
        categoryName: 'Televisions',
      );
      expect(parentOfTv, isNotNull);
      expect(parentOfTv!.name, 'Electronics & Appliances');

      final parentOfRoot = CategoryLookupHelper.findParentCategory(
        mockCategories,
        categoryName: 'Electronics & Appliances',
      );
      expect(parentOfRoot, isNull);
    });

    test('resolveCategoryIcon returns category icon if present, else falls back to parent icon', () {
      // Category with its own icon
      final sony = CategoryLookupHelper.findCategory(mockCategories, categoryName: 'Sony');
      expect(CategoryLookupHelper.resolveCategoryIcon(mockCategories, sony), 'https://example.com/sony.png');

      // Category with empty icon falls back to parent (Smartphones -> https://example.com/phones.png)
      final apple = CategoryLookupHelper.findCategory(mockCategories, categoryName: 'Apple');
      expect(CategoryLookupHelper.resolveCategoryIcon(mockCategories, apple), 'https://example.com/phones.png');
    });

    test('canonicalIcon resolves smartphones icon when icon is empty', () {
      expect(
        CategoryLookupHelper.canonicalIcon('', id: '171', slug: 'smartphone', name: 'Smartphones'),
        'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg',
      );
    });

    test('resolveCategoryIcon falls back to canonical category icon when category icon is empty from API', () {
      const emptySmartphonesCategory = CategoryEntity(
        id: '171',
        slug: 'smartphone',
        name: 'Smartphones',
        isSpecial: false,
        icon: '',
        children: [
          CategoryEntity(
            id: '3757',
            slug: '5g-smartphone',
            name: '5G Smartphone',
            isSpecial: false,
            icon: '',
            children: [],
          ),
        ],
      );

      final icon = CategoryLookupHelper.resolveCategoryIcon(
        [emptySmartphonesCategory],
        emptySmartphonesCategory,
      );
      expect(icon, 'https://cdntest.pickaboo.com/media/catalog/category/Category-Smartphones.jpg');
    });
  });
}
