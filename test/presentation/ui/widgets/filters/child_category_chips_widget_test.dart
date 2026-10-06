import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/filters/child_category_chips_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

  group('ChildCategoryChipsWidget Fallback Icon Tests', () {
    const subcatWithIcon = CategoryEntity(
      id: '101',
      slug: 'xiaomi',
      name: 'Xiaomi',
      isSpecial: false,
      icon: 'https://example.com/xiaomi.png',
      children: [],
    );

    const subcatWithoutIcon = CategoryEntity(
      id: '102',
      slug: 'realme',
      name: 'Realme',
      isSpecial: false,
      icon: '',
      children: [],
    );

    testWidgets('renders subcategory icon when subcategory has an icon', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          ChildCategoryChipsWidget(
            childCategories: const [subcatWithIcon],
            onChildSelected: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Xiaomi'), findsOneWidget);
      final appImage = tester.widget<AppImage>(find.byType(AppImage));
      expect(appImage.imageUrl, 'https://example.com/xiaomi.png');
    });

    testWidgets('renders subtle skeleton shade when subcategory icon is empty', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          ChildCategoryChipsWidget(
            childCategories: const [subcatWithoutIcon],
            onChildSelected: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Realme'), findsOneWidget);
      // Does NOT render AppImage with category icon
      expect(find.byType(AppImage), findsNothing);
      // Renders skeleton shade Container
      final container = find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color != null,
      );
      expect(container, findsWidgets);
      // Ensures no continuous Skeletonizer blinking/shimmering when icon is empty
      expect(find.byType(Skeletonizer), findsNothing);
    });

    testWidgets('triggers onChildSelected callback on tap', (tester) async {
      CategoryEntity? selected;
      await tester.pumpWidget(
        buildTestWidget(
          ChildCategoryChipsWidget(
            childCategories: const [subcatWithIcon],
            parentCategoryIcon: 'https://example.com/parent.png',
            onChildSelected: (cat) => selected = cat,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Xiaomi'));
      expect(selected?.id, '101');
    });
  });
}
