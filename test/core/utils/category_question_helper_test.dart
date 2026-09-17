import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/category_question_helper.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';

void main() {
  group('CategoryQuestionHelper - Skip Single-Option Questions', () {
    test('extractQuestions skips price when price has only 1 option', () {
      final attributes = [
        const FilterAttributeEntity(
          filterName: 'Price',
          filterCode: 'price',
          specialForPhone: false,
          items: [
            FilterItemEntity(
              label: '30 - 922990',
              value: '30-922990',
              count: 100,
            ),
          ],
        ),
        const FilterAttributeEntity(
          filterName: 'Brand',
          filterCode: 'manufacturer',
          specialForPhone: false,
          items: [
            FilterItemEntity(label: 'Samsung', value: '1', count: 10),
            FilterItemEntity(label: 'LG', value: '2', count: 5),
          ],
        ),
        const FilterAttributeEntity(
          filterName: 'Color',
          filterCode: 'color',
          specialForPhone: false,
          items: [
            FilterItemEntity(label: 'Black', value: 'b', count: 8),
            FilterItemEntity(label: 'Silver', value: 's', count: 4),
          ],
        ),
      ];

      final questions = CategoryQuestionHelper.extractQuestions(
        attributes: attributes,
        categorySlug: 'electronics-appliances',
        maxQuestions: 3,
      );

      // Price had only 1 option, so it MUST be skipped
      expect(questions.any((q) => q.filterCode == 'price'), isFalse);

      // Brand and Color have multiple options, so they should be selected
      expect(questions.any((q) => q.filterCode == 'manufacturer'), isTrue);
      expect(questions.any((q) => q.filterCode == 'color'), isTrue);
      expect(questions.first.filterCode, equals('manufacturer'));
    });

    test('extractQuestions includes price when price has multiple options', () {
      final attributes = [
        const FilterAttributeEntity(
          filterName: 'Price',
          filterCode: 'price',
          specialForPhone: false,
          items: [
            FilterItemEntity(
              label: '1,000 - 5,000',
              value: '1000-5000',
              count: 20,
            ),
            FilterItemEntity(
              label: '5,000 - 10,000',
              value: '5000-10000',
              count: 15,
            ),
          ],
        ),
        const FilterAttributeEntity(
          filterName: 'Brand',
          filterCode: 'manufacturer',
          specialForPhone: false,
          items: [
            FilterItemEntity(label: 'Sony', value: '1', count: 10),
            FilterItemEntity(label: 'Panasonic', value: '2', count: 5),
          ],
        ),
      ];

      final questions = CategoryQuestionHelper.extractQuestions(
        attributes: attributes,
        categorySlug: 'television',
        maxQuestions: 3,
      );

      expect(questions.first.filterCode, equals('price'));
      expect(questions.first.items.length, equals(2));
    });

    test('extractQuestions skips any question that has only 1 option', () {
      final attributes = [
        const FilterAttributeEntity(
          filterName: 'Operating System',
          filterCode: 'os',
          specialForPhone: false,
          items: [
            FilterItemEntity(label: 'Android', value: 'a', count: 12),
          ],
        ),
        const FilterAttributeEntity(
          filterName: 'RAM',
          filterCode: 'ram',
          specialForPhone: false,
          items: [
            FilterItemEntity(label: '4GB', value: '4', count: 5),
            FilterItemEntity(label: '8GB', value: '8', count: 7),
          ],
        ),
      ];

      final questions = CategoryQuestionHelper.extractQuestions(
        attributes: attributes,
        categorySlug: 'smartphones',
        maxQuestions: 3,
      );

      expect(questions.length, equals(1));
      expect(questions.first.filterCode, equals('ram'));
    });

    test('pruneQuestionOptions returns empty items when question has <= 1 option initially', () {
      const singleOptionQuestion = FilterAttributeEntity(
        filterName: 'Price',
        filterCode: 'price',
        specialForPhone: false,
        items: [
          FilterItemEntity(label: '30 - 922990', value: '30-922990', count: 10),
        ],
      );

      final pruned = CategoryQuestionHelper.pruneQuestionOptions(
        question: singleOptionQuestion,
        currentProducts: const [],
      );

      expect(pruned.items, isEmpty);
    });

    test('pruneQuestionOptions returns empty items if dynamic pruning leaves <= 1 option', () {
      const question = FilterAttributeEntity(
        filterName: 'Brand',
        filterCode: 'manufacturer',
        specialForPhone: false,
        items: [
          FilterItemEntity(label: 'Samsung', value: '1', count: 5),
          FilterItemEntity(label: 'LG', value: '2', count: 5),
        ],
      );

      // Server attributes show only Samsung remains
      final serverAttrs = [
        const FilterAttributeEntity(
          filterName: 'Brand',
          filterCode: 'manufacturer',
          specialForPhone: false,
          items: [
            FilterItemEntity(label: 'Samsung', value: '1', count: 5),
          ],
        ),
      ];

      final pruned = CategoryQuestionHelper.pruneQuestionOptions(
        question: question,
        currentProducts: const [],
        currentServerAttributes: serverAttrs,
      );

      // Since only 1 option remains after pruning, it should be cleared (empty items)
      expect(pruned.items, isEmpty);
    });
  });
}
