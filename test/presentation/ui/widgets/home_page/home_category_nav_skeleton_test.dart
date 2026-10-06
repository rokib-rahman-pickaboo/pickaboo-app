import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/home_category_nav.dart';

void main() {
  Widget buildTestWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group('HomeCategoryNav Skeleton Tests', () {
    const testCategory = CategoryListEntity(
      id: '1',
      name: 'Smartphones',
      slug: 'smartphones',
      icon: 'https://example.com/phone.png',
      isSpecial: false,
    );

    const testCategoryWithoutIcon = CategoryListEntity(
      id: '2',
      name: 'Laptops',
      slug: 'laptops',
      icon: '',
      isSpecial: false,
    );

    testWidgets('does NOT render AppLoader.inline spinner in category items', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          HomeCategoryNav(
            categories: const [testCategory],
            selectedCategory: 'For You',
            onCategorySelected: (_) {},
            onViewAll: () {},
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      // Ensure no circular spinner AppLoader is shown
      expect(find.byType(AppLoader), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders skeleton shade for categories without icon', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          HomeCategoryNav(
            categories: const [testCategoryWithoutIcon],
            selectedCategory: 'For You',
            onCategorySelected: (_) {},
            onViewAll: () {},
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.text('Laptops'), findsOneWidget);
      expect(find.byType(AppLoader), findsNothing);
      expect(tester.takeException(), isNull);
    });
  });
}
