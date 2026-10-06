import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/filter_sort_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Widget createTestWidget({
    int activeFilterCount = 0,
    String? activeSortLabel,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: FilterSortBar(
            viewModeKey: 'test_view_mode',
            onFilterTap: () {},
            sortOptions: const [
              FilterSortOption(title: 'Newest', value: 'newest'),
            ],
            onSortSelected: (_) {},
            activeFilterCount: activeFilterCount,
            activeSortLabel: activeSortLabel,
          ),
        ),
      ),
    );
  }

  group('FilterSortBar styling tests', () {
    testWidgets('Inactive state: Filter text and icon are navy, not blue, and no badge is shown',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(activeFilterCount: 0));
      await tester.pumpAndSettle();

      // Filter text should be present with AppColors.navy
      final filterText = tester.widget<Text>(find.text(AppStrings.filter));
      expect(filterText.style?.color, equals(AppColors.navy));

      // Filter icon should have AppColors.navy
      final filterIcon = tester.widget<Icon>(find.byIcon(Icons.tune_rounded));
      expect(filterIcon.color, equals(AppColors.navy));

      // No count badge should be present
      expect(find.text('1'), findsNothing);
      expect(find.text('0'), findsNothing);
    });

    testWidgets('Active state: Filter text, icon, and badge are blue, but border remains neutral',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(activeFilterCount: 3));
      await tester.pumpAndSettle();

      // Filter text should have AppColors.pickabooBlue
      final filterText = tester.widget<Text>(find.text(AppStrings.filter));
      expect(filterText.style?.color, equals(AppColors.pickabooBlue));

      // Filter icon should have AppColors.pickabooBlue
      final filterIcon = tester.widget<Icon>(find.byIcon(Icons.tune_rounded));
      expect(filterIcon.color, equals(AppColors.pickabooBlue));

      // Badge should be present with activeFilterCount '3'
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('Filter count badge: single digit is a circle, multi-digit is a pill',
        (WidgetTester tester) async {
      // 1. Single digit: should have BoxShape.circle
      await tester.pumpWidget(createTestWidget(activeFilterCount: 1));
      await tester.pumpAndSettle();

      final badgeFinder1 = find.ancestor(
        of: find.text('1'),
        matching: find.byType(Container),
      ).first;
      final badgeContainer1 = tester.widget<Container>(badgeFinder1);
      final decoration1 = badgeContainer1.decoration as BoxDecoration;
      expect(decoration1.shape, equals(BoxShape.circle));
      expect(decoration1.color, equals(AppColors.pickabooBlue));

      // 2. Multi-digit: should have pill shape
      await tester.pumpWidget(createTestWidget(activeFilterCount: 12));
      await tester.pumpAndSettle();

      final badgeFinder12 = find.ancestor(
        of: find.text('12'),
        matching: find.byType(Container),
      ).first;
      final badgeContainer12 = tester.widget<Container>(badgeFinder12);
      final decoration12 = badgeContainer12.decoration as BoxDecoration;
      expect(decoration12.shape, equals(BoxShape.rectangle));
      expect(decoration12.borderRadius, equals(AppRadius.kFull));
    });

    testWidgets('Sort button: toggles between navy and blue without changing border',
        (WidgetTester tester) async {
      // Unsorted
      await tester.pumpWidget(createTestWidget(activeSortLabel: null));
      await tester.pumpAndSettle();
      expect(tester.widget<Text>(find.text('Sort')).style?.color, equals(AppColors.navy));
      expect(tester.widget<Icon>(find.byIcon(Icons.swap_vert_rounded)).color, equals(AppColors.navy));

      // Sorted
      await tester.pumpWidget(createTestWidget(activeSortLabel: 'Oldest First'));
      await tester.pumpAndSettle();
      expect(tester.widget<Text>(find.text('Oldest First')).style?.color, equals(AppColors.pickabooBlue));
      expect(tester.widget<Icon>(find.byIcon(Icons.swap_vert_rounded)).color, equals(AppColors.pickabooBlue));
    });
  });
}
