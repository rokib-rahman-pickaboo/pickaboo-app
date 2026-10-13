import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/data/mapper/category_mapper.dart';

void main() {
  group('CategoryResponse', () {
    test('safely parses categories and subcategories when id is integer', () {
      final jsonList = [
        {
          "id": 64,
          "slug": "air-conditioner",
          "name": "Air Conditioner",
          "is_special": "0",
          "icon": "https://cdn.pickaboo.com/media/catalog/category/ac-menu.png",
          "childs": [
            {
              "id": 3478,
              "slug": "haier-ac",
              "name": "Haier",
              "is_special": "0",
              "icon": "https://cdn.pickaboo.com/media/catalog/category/Haier.png"
            },
            {
              "id": 3479,
              "slug": "hisense-ac",
              "name": "Hisense",
              "is_special": 0,
              "icon": "https://cdn.pickaboo.com/media/catalog/category/Hisence.png"
            }
          ]
        },
        {
          "id": 171,
          "slug": "smartphone",
          "name": "Smartphones",
          "is_special": "0",
          "icon": "https://cdn.pickaboo.com/media/catalog/category/smartphone.png",
          "childs": ""
        }
      ];

      final categories = jsonList
          .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList();

      expect(categories, hasLength(2));
      expect(categories[0].id, '64');
      expect(categories[0].name, 'Air Conditioner');
      expect(categories[0].childs, hasLength(2));
      expect(categories[0].childs![0].id, '3478');
      expect(categories[0].childs![0].name, 'Haier');
      expect(categories[0].childs![1].id, '3479');
      expect(categories[0].childs![1].isSpecial, '0');

      // Category with childs: "" (empty string) safely returns null instead of crashing
      expect(categories[1].id, '171');
      expect(categories[1].childs, isNull);

      // Verify domain mapping
      final entities = categories.map((e) => e.toEntity()).toList();
      expect(entities[0].id, '64');
      expect(entities[0].children, hasLength(2));
      expect(entities[0].children[0].id, '3478');
      expect(entities[0].children[0].name, 'Haier');
      expect(entities[1].children, isEmpty);
    });

    test('safely parses legacy responses where id is already a String', () {
      final json = {
        "id": "64",
        "slug": "air-conditioner",
        "name": "Air Conditioner",
        "is_special": "1",
        "childs": [
          {
            "id": "3478",
            "slug": "haier-ac",
            "name": "Haier",
            "is_special": "0"
          }
        ]
      };

      final category = CategoryResponse.fromJson(json);
      expect(category.id, '64');
      expect(category.isSpecial, '1');
      expect(category.childs?.first.id, '3478');

      final entity = category.toEntity();
      expect(entity.id, '64');
      expect(entity.children.first.id, '3478');
    });
  });
}
