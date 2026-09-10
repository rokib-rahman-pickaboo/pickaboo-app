import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/category_products/category_products_entity.dart';
import 'package:pickaboo/presentation/ui/pages/brand_product_page/bottom_sheet/brand_filter_bottom_sheet.dart';

void main() {
  const sampleAttribute = FilterAttributeEntity(
    filterName: 'Brand',
    filterCode: 'brand',
    specialForPhone: false,
    items: [
      FilterItemEntity(label: 'Apple', value: 'apple', count: 5),
      FilterItemEntity(label: 'Samsung', value: 'samsung', count: 8),
    ],
  );

  Widget makeTestWidget({
    Map<String, List<String>>? initialFilters,
    Function(Map<String, List<String>>)? onApply,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: BrandFilterBottomSheet(
            filterableAttributes: const [sampleAttribute],
            initialFilters: initialFilters,
            onApply: onApply ?? (_) {},
          ),
        ),
      ),
    );
  }

  group('Filter Bottom Sheet - Clear All Button Visibility', () {
    testWidgets('Clear All button is hidden when no filters are selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestWidget(initialFilters: {}));
      await tester.pumpAndSettle();

      expect(find.text('Filters'), findsOneWidget);
      expect(find.text('Clear All'), findsNothing);
    });

    testWidgets('Clear All button is visible when at least one filter is selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestWidget(
          initialFilters: {
            'brand': ['apple'],
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Filters'), findsOneWidget);
      expect(find.text('Clear All'), findsOneWidget);
    });

    testWidgets('Tapping Clear All clears filters and hides the Clear All button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        makeTestWidget(
          initialFilters: {
            'brand': ['apple'],
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Clear All'), findsOneWidget);

      await tester.tap(find.text('Clear All'));
      await tester.pumpAndSettle();

      expect(find.text('Clear All'), findsNothing);
    });

    testWidgets('Options list has no Dividers and alternates colors from bottom up',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestWidget());
      await tester.pumpAndSettle();

      // Ensure no Dividers exist in the bottom sheet options
      expect(find.byType(Divider), findsNothing);

      // Verify Apple (upper item) has pageBg and Samsung (last item) has white
      final appleFinder = find.ancestor(
        of: find.text('Apple'),
        matching: find.byType(Container),
      );
      final samsungFinder = find.ancestor(
        of: find.text('Samsung'),
        matching: find.byType(Container),
      );

      final appleContainer = tester.widget<Container>(appleFinder.first);
      final samsungContainer = tester.widget<Container>(samsungFinder.first);

      // Last item (Samsung, index 1 of 2) -> white
      expect(samsungContainer.color, AppColors.white);
      // Upper 1 item (Apple, index 0 of 2) -> pageBg
      expect(appleContainer.color, AppColors.pageBg);
    });
  });
}

