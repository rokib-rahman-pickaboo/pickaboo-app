import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_card_skeleton.dart';
import 'package:pickaboo/presentation/ui/widgets/common/catalog_grid_skeleton.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/cart_page/cart_page_skeleton.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group('ProductCardSkeleton Widget Tests', () {
    testWidgets('renders atomic ProductCardSkeleton without errors or overflows',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Builder(
            builder: (context) => SizedBox(
              width: 170.w,
              height: 170.w / 0.60,
              child: const ProductCardSkeleton(),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(ProductCardSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('CatalogGridSkeleton Widget Tests', () {
    testWidgets('renders CatalogGridSkeleton in full page mode cleanly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const CatalogGridSkeleton(hasFeaturedRail: true),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(CatalogGridSkeleton), findsOneWidget);
      expect(find.byType(ProductCardSkeleton), findsWidgets);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders CatalogGridSkeleton.sliver in CustomScrollView',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const CustomScrollView(
            slivers: [
              CatalogGridSkeleton.sliver(),
            ],
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(CatalogGridSkeleton), findsOneWidget);
      expect(find.byType(ProductCardSkeleton), findsWidgets);
      expect(tester.takeException(), isNull);
    });
  });

  group('CartPageSkeleton Widget Tests', () {
    testWidgets('renders CartPageSkeleton with items and summary cleanly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const CartPageSkeleton(itemCount: 2),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(CartPageSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
