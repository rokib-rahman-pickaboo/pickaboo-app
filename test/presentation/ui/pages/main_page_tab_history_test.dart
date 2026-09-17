import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';

void main() {
  group('MainPage Tab History & popTab Widget Tests', () {
    setUp(() {
      MainPage.tabHistory.clear();
      MainPage.tabHistory.add(0);
      MainPage.switchTab = null;
    });

    testWidgets('popTab returns to previous tab in tabHistory when length > 1',
        (WidgetTester tester) async {
      int? switchedToIndex;
      MainPage.switchTab = (index) => switchedToIndex = index;

      // User visits Home (0) -> Discover (1) -> Dashboard (3)
      MainPage.tabHistory.add(1);
      MainPage.tabHistory.add(3);

      expect(MainPage.tabHistory, [0, 1, 3]);

      late BuildContext capturedContext;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      // Pop from Dashboard (3) -> should switch to Discover (1)
      MainPage.popTab(capturedContext);
      expect(switchedToIndex, 1);
      expect(MainPage.tabHistory, [0, 1]);

      // Pop from Discover (1) -> should switch to Home (0)
      MainPage.popTab(capturedContext);
      expect(switchedToIndex, 0);
      expect(MainPage.tabHistory, [0]);
    });

    testWidgets('popTab falls back to Home (0) when tabHistory has only root tab',
        (WidgetTester tester) async {
      int? switchedToIndex;
      MainPage.switchTab = (index) => switchedToIndex = index;

      late BuildContext capturedContext;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      MainPage.popTab(capturedContext);
      expect(switchedToIndex, 0);
      expect(MainPage.tabHistory, [0]);
    });
  });
}
