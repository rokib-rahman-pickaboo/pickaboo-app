import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/presentation/ui/nav_drawer/nav_drawer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapWithScreenUtil(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: child),
        ),
      ),
    );
  }

  const categoryA = CategoryEntity(
    id: '1',
    slug: 'smartphones',
    name: 'Smartphones',
    isSpecial: false,
    icon: '',
    children: [
      CategoryEntity(
        id: '11',
        slug: 'xiaomi',
        name: 'Xiaomi',
        isSpecial: false,
        icon: '',
        children: [],
      ),
      CategoryEntity(
        id: '12',
        slug: 'samsung-phone',
        name: 'Samsung Mobile',
        isSpecial: false,
        icon: '',
        children: [],
      ),
    ],
  );

  const categoryB = CategoryEntity(
    id: '2',
    slug: 'electronics',
    name: 'Electronics',
    isSpecial: false,
    icon: '',
    children: [
      CategoryEntity(
        id: '21',
        slug: 'televisions',
        name: 'Televisions',
        isSpecial: false,
        icon: '',
        children: [],
      ),
    ],
  );

  testWidgets('Accordion behavior: expanding one category collapses the previous one', (tester) async {
    CategoryEntity? tappedCategory;

    await tester.pumpWidget(
      wrapWithScreenUtil(
        DrawerShopForSection(
          categories: const [categoryA, categoryB],
          onCategoryTap: (cat) => tappedCategory = cat,
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Both categories are visible as headers
    expect(find.text('Smartphones'), findsOneWidget);
    expect(find.text('Electronics'), findsOneWidget);

    // Subcategories should NOT be visible initially
    expect(find.text('All in Smartphones'), findsNothing);
    expect(find.text('Xiaomi'), findsNothing);
    expect(find.text('All in Electronics'), findsNothing);
    expect(find.text('Televisions'), findsNothing);

    // Tap chevron for Smartphones (Category A)
    final categoryAFinder = find.byKey(const ValueKey('drawer_cat_1'));
    final chevronA = find.descendant(
      of: categoryAFinder,
      matching: find.byIcon(Icons.keyboard_arrow_down_rounded),
    );
    expect(chevronA, findsOneWidget);

    await tester.tap(chevronA);
    await tester.pumpAndSettle();

    // Category A subcategories should now be visible
    expect(find.text('All in Smartphones'), findsOneWidget);
    expect(find.text('Xiaomi'), findsOneWidget);
    expect(find.text('Samsung Mobile'), findsOneWidget);
    // Category B subcategories must still be hidden
    expect(find.text('All in Electronics'), findsNothing);
    expect(find.text('Televisions'), findsNothing);

    // Now tap chevron for Electronics (Category B)
    final categoryBFinder = find.byKey(const ValueKey('drawer_cat_2'));
    final chevronB = find.descendant(
      of: categoryBFinder,
      matching: find.byIcon(Icons.keyboard_arrow_down_rounded),
    );
    expect(chevronB, findsOneWidget);

    await tester.tap(chevronB);
    await tester.pumpAndSettle();

    // ACCORDION TEST:
    // Category B subcategories MUST now be visible!
    expect(find.text('All in Electronics'), findsOneWidget);
    expect(find.text('Televisions'), findsOneWidget);

    // AND Category A subcategories MUST now be collapsed / hidden!
    expect(find.text('All in Smartphones'), findsNothing);
    expect(find.text('Xiaomi'), findsNothing);
    expect(find.text('Samsung Mobile'), findsNothing);

    // Tapping Category B chevron again should collapse Category B
    await tester.tap(chevronB);
    await tester.pumpAndSettle();

    expect(find.text('All in Electronics'), findsNothing);
    expect(find.text('Televisions'), findsNothing);
    expect(find.text('All in Smartphones'), findsNothing);

    // Verify tapping on a category navigates
    await tester.tap(find.text('Smartphones'));
    expect(tappedCategory?.id, '1');
  });

  testWidgets('Nested accordion: expanding one child category collapses previous child within same parent', (tester) async {
    const nestedCategory = CategoryEntity(
      id: 'parent_1',
      slug: 'appliances',
      name: 'Appliances',
      isSpecial: false,
      icon: '',
      children: [
        CategoryEntity(
          id: 'child_1',
          slug: 'kitchen',
          name: 'Kitchen Appliances',
          isSpecial: false,
          icon: '',
          children: [
            CategoryEntity(
              id: 'sub_1',
              slug: 'blenders',
              name: 'Blenders',
              isSpecial: false,
              icon: '',
              children: [],
            ),
          ],
        ),
        CategoryEntity(
          id: 'child_2',
          slug: 'cooling',
          name: 'Cooling Appliances',
          isSpecial: false,
          icon: '',
          children: [
            CategoryEntity(
              id: 'sub_2',
              slug: 'ac',
              name: 'Air Conditioners',
              isSpecial: false,
              icon: '',
              children: [],
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(
      wrapWithScreenUtil(
        DrawerShopForSection(
          categories: const [nestedCategory],
          onCategoryTap: (_) {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Expand parent 'Appliances'
    final parentFinder = find.byKey(const ValueKey('drawer_cat_parent_1'));
    final parentChevron = find.descendant(
      of: parentFinder,
      matching: find.byIcon(Icons.keyboard_arrow_down_rounded),
    );
    await tester.tap(parentChevron);
    await tester.pumpAndSettle();

    expect(find.text('Kitchen Appliances'), findsOneWidget);
    expect(find.text('Cooling Appliances'), findsOneWidget);
    expect(find.text('Blenders'), findsNothing);
    expect(find.text('Air Conditioners'), findsNothing);

    // Expand child 1: Kitchen Appliances
    final child1Finder = find.byKey(const ValueKey('drawer_cat_child_1'));
    final child1Chevron = find.descendant(
      of: child1Finder,
      matching: find.byIcon(Icons.keyboard_arrow_down_rounded),
    );
    await tester.tap(child1Chevron);
    await tester.pumpAndSettle();

    expect(find.text('Blenders'), findsOneWidget);
    expect(find.text('Air Conditioners'), findsNothing);

    // Expand child 2: Cooling Appliances -> Kitchen Appliances must collapse
    final child2Finder = find.byKey(const ValueKey('drawer_cat_child_2'));
    final child2Chevron = find.descendant(
      of: child2Finder,
      matching: find.byIcon(Icons.keyboard_arrow_down_rounded),
    );
    await tester.tap(child2Chevron);
    await tester.pumpAndSettle();

    expect(find.text('Air Conditioners'), findsOneWidget);
    expect(find.text('Blenders'), findsNothing);
  });
}

