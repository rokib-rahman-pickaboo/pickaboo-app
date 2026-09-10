import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_key_highlights_widget.dart';

Widget createWidgetUnderTest(List<MoreInformationEntity> moreInformation) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 375,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PdpKeyHighlightsWidget(moreInformation: moreInformation),
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('PdpKeyHighlightsWidget', () {
    testWidgets('Renders Key Highlights section and items correctly',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      const moreInfo = [
        MoreInformationEntity(
          groupLabel: 'General',
          attrList: [
            AttrListEntity(label: 'Color', value: 'Black'),
            AttrListEntity(label: 'Feature', value: '4K'),
          ],
        ),
      ];

      await tester.pumpWidget(createWidgetUnderTest(moreInfo));
      await tester.pumpAndSettle();

      expect(find.text('Key Highlights'), findsOneWidget);
      expect(find.text('Color'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
      expect(find.text('Feature'), findsOneWidget);
      expect(find.text('4K'), findsOneWidget);
    });

    testWidgets(
        'Adjusts design by adding empty lines to single-line companion card when one card needs up to three lines',
        (WidgetTester tester) async {
      const testSize = Size(375, 812);
      tester.view.physicalSize = testSize;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      const moreInfo = [
        MoreInformationEntity(
          groupLabel: 'Specs',
          attrList: [
            AttrListEntity(label: 'Color', value: 'Black'),
            AttrListEntity(label: 'Feature', value: '4K'),
            AttrListEntity(label: 'Brand', value: 'Samsung'),
            AttrListEntity(
              label: 'Warranty Information',
              value: '5 Years Service Warranty Without Parts & Panel',
            ),
          ],
        ),
      ];

      await tester.pumpWidget(createWidgetUnderTest(moreInfo));
      await tester.pumpAndSettle();

      // Row 1 items are single line
      expect(find.text('Black'), findsOneWidget);
      expect(find.text('4K'), findsOneWidget);

      // In Row 2, 'Warranty Information' needs 3 lines, so 'Samsung' has 2 empty lines (\n\n) to match
      expect(find.text('Samsung\n\n'), findsOneWidget);
      expect(
        find.text('5 Years Service Warranty Without Parts & Panel'),
        findsOneWidget,
      );

      // Verify that both cards in Row 2 have the exact same height
      final samsungFinder = find.ancestor(
        of: find.text('Samsung\n\n'),
        matching: find.byType(Container),
      );
      final warrantyFinder = find.ancestor(
        of: find.text('5 Years Service Warranty Without Parts & Panel'),
        matching: find.byType(Container),
      );

      final samsungSize = tester.getSize(samsungFinder.first);
      final warrantySize = tester.getSize(warrantyFinder.first);

      expect(samsungSize.height, equals(warrantySize.height));
    });
  });
}
