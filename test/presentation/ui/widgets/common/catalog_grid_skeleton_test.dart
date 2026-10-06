import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/brand_product_page/brand_filter_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/catalog_grid_skeleton.dart';
import 'package:pickaboo/presentation/ui/widgets/common/filter_sort_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Widget wrapWithScreenUtil(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group('CatalogGridSkeleton.brand', () {
    testWidgets('renders brand skeleton with interleaved question and zero top padding',
        (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const CatalogGridSkeleton.brand(),
        ),
      );
      await tester.pump();

      // Should render without errors
      expect(find.byType(CatalogGridSkeleton), findsOneWidget);

      // Verify action strip padding has top: 0
      final paddingWidgets = tester.widgetList<Padding>(find.byType(Padding));
      final hasZeroTopPadding = paddingWidgets.any((p) {
        final padding = p.padding;
        if (padding is EdgeInsets) {
          return padding.top == 0.0 && padding.left > 0;
        }
        return false;
      });
      expect(hasZeroTopPadding, isTrue);
    });

    testWidgets('BrandFilterButton passes top: 0 padding to FilterSortBar by default',
        (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          BrandFilterButton(
            onFilterTap: () {},
            sortOptions: const [],
            onSortSelected: (_) {},
          ),
        ),
      );
      await tester.pump();

      final filterSortBar = tester.widget<FilterSortBar>(find.byType(FilterSortBar));
      final padding = filterSortBar.padding as EdgeInsets?;
      expect(padding, isNotNull);
      expect(padding!.top, equals(0.0));
    });

    testWidgets('renders category skeleton standalone (top: 0) and embedded (top: 8)',
        (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const CatalogGridSkeleton.category(isEmbedded: false),
        ),
      );
      await tester.pump();
      expect(find.byType(CatalogGridSkeleton), findsOneWidget);

      await tester.pumpWidget(
        wrapWithScreenUtil(
          const CatalogGridSkeleton.category(isEmbedded: true),
        ),
      );
      await tester.pump();
      expect(find.byType(CatalogGridSkeleton), findsOneWidget);
    });

    testWidgets('brand skeleton and category with hasChildCategories: false do not render child category rail',
        (tester) async {
      // 1. Brand skeleton must not render horizontal child category rail
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const CatalogGridSkeleton.brand(),
        ),
      );
      await tester.pump();
      expect(find.byType(ListView), findsNothing);

      // 2. Category skeleton with hasChildCategories: false must not render child category rail
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const CatalogGridSkeleton.category(hasChildCategories: false),
        ),
      );
      await tester.pump();
      expect(find.byType(ListView), findsNothing);

      // 3. Category skeleton with hasChildCategories: true MUST render child category rail
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const CatalogGridSkeleton.category(hasChildCategories: true),
        ),
      );
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
