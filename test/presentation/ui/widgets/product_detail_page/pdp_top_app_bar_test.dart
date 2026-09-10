import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_top_app_bar.dart';

void main() {
  Widget createWidgetUnderTest({
    String title = 'iPhone 15 Pro Max',
    int cartCount = 0,
    VoidCallback? onBack,
    VoidCallback? onSearch,
    VoidCallback? onCart,
    bool isVisible = true,
    bool isScrolledPastHero = true,
    bool showBackButton = true,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              PdpTopAppBar(
                title: title,
                cartCount: cartCount,
                onBack: onBack,
                onSearch: onSearch,
                onCart: onCart,
                isVisible: isVisible,
                isScrolledPastHero: isScrolledPastHero,
                showBackButton: showBackButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  group('PdpTopAppBar Widget Tests', () {
    testWidgets('renders back, search, and cart buttons', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          onBack: () {},
          onSearch: () {},
          onCart: () {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('displays cart badge when cartCount > 0', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          cartCount: 3,
          onCart: () {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('does not display cart badge when cartCount == 0', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          cartCount: 0,
          onCart: () {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('0'), findsNothing);
    });

    testWidgets('invokes onBack callback on tap', (tester) async {
      bool backTapped = false;
      await tester.pumpWidget(
        createWidgetUnderTest(
          onBack: () => backTapped = true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
      expect(backTapped, isTrue);
    });

    testWidgets('invokes onSearch callback on tap', (tester) async {
      bool searchTapped = false;
      await tester.pumpWidget(
        createWidgetUnderTest(
          onSearch: () => searchTapped = true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search_rounded));
      expect(searchTapped, isTrue);
    });

    testWidgets('invokes onCart callback on tap', (tester) async {
      bool cartTapped = false;
      await tester.pumpWidget(
        createWidgetUnderTest(
          onCart: () => cartTapped = true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      expect(cartTapped, isTrue);
    });

    testWidgets('hides back button when showBackButton is false', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          showBackButton: false,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsNothing);
    });

    testWidgets('displays product title when visible', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          title: 'Samsung Galaxy S24 Ultra',
          isVisible: true,
          isScrolledPastHero: true,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Samsung Galaxy S24 Ultra'), findsOneWidget);
    });

    testWidgets('ignores touches and slides off-screen when isVisible is false', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          isVisible: false,
          isScrolledPastHero: false,
        ),
      );
      await tester.pumpAndSettle();

      final slide = tester.widget<AnimatedSlide>(find.byType(AnimatedSlide));
      expect(slide.offset, const Offset(0, -1.2));

      final ignorePointer = tester.widget<IgnorePointer>(
        find.descendant(
          of: find.byType(PdpTopAppBar),
          matching: find.byType(IgnorePointer),
        ).first,
      );
      expect(ignorePointer.ignoring, isTrue);
    });

    testWidgets('renders transparent background and hides title when isScrolledPastHero is false', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          title: 'Samsung Galaxy S24 Ultra',
          isVisible: true,
          isScrolledPastHero: false,
        ),
      );
      await tester.pumpAndSettle();

      final animatedContainer = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final decoration = animatedContainer.decoration as BoxDecoration;
      expect(decoration.color, Colors.transparent);

      // Title AnimatedOpacity should have opacity 0.0
      final opacityWidgets = tester.widgetList<AnimatedOpacity>(find.byType(AnimatedOpacity));
      final titleOpacity = opacityWidgets.first;
      expect(titleOpacity.opacity, 0.0);
    });

    testWidgets('renders white background and shows title when isScrolledPastHero is true', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(
          title: 'Samsung Galaxy S24 Ultra',
          isVisible: true,
          isScrolledPastHero: true,
        ),
      );
      await tester.pumpAndSettle();

      final animatedContainer = tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final decoration = animatedContainer.decoration as BoxDecoration;
      expect(decoration.color, isNot(Colors.transparent));

      // Title AnimatedOpacity should have opacity 1.0
      final opacityWidgets = tester.widgetList<AnimatedOpacity>(find.byType(AnimatedOpacity));
      final titleOpacity = opacityWidgets.first;
      expect(titleOpacity.opacity, 1.0);
    });
  });
}
