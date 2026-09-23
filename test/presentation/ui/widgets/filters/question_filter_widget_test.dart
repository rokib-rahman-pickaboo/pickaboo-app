import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/filters/question_filter_widget.dart';

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

  group('QuestionFilterWidget - Single Option Guard', () {
    testWidgets('renders nothing (SizedBox.shrink) when options has only 1 item', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          QuestionFilterWidget(
            questionTitle: 'Which budget are you looking for?',
            options: const ['30 - 922990'],
            selectedOption: null,
            onOptionSelected: (_) {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Which budget are you looking for?'), findsNothing);
      expect(find.text('30 - 922990'), findsNothing);
    });

    testWidgets('renders nothing when options is empty', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          QuestionFilterWidget(
            questionTitle: 'Which budget are you looking for?',
            options: const [],
            selectedOption: null,
            onOptionSelected: (_) {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Which budget are you looking for?'), findsNothing);
    });

    testWidgets('renders question title and options when options has >= 2 items', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          QuestionFilterWidget(
            questionTitle: 'Choose your preferred Brand',
            options: const ['Samsung', 'Apple', 'Xiaomi'],
            selectedOption: null,
            onOptionSelected: (_) {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Choose your preferred Brand'), findsOneWidget);
      expect(find.text('Samsung'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Xiaomi'), findsOneWidget);
    });

    testWidgets('shows right arrow when options overflow, and reveals left arrow after scrolling', (tester) async {
      String? selected;
      final manyOptions = List.generate(20, (i) => 'Brand $i');

      await tester.pumpWidget(
        buildTestWidget(
          QuestionFilterWidget(
            questionTitle: 'Choose your preferred Brand',
            options: manyOptions,
            selectedOption: selected,
            onOptionSelected: (val) => selected = val,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Right arrow should be visible (opacity 1.0)
      final rightArrowFinder = find.byIcon(Icons.chevron_right_rounded);
      expect(rightArrowFinder, findsOneWidget);

      final leftArrowFinder = find.byIcon(Icons.chevron_left_rounded);
      expect(leftArrowFinder, findsOneWidget);

      // Left arrow AnimatedOpacity should be 0.0 initially
      final leftOpacity = tester.widget<AnimatedOpacity>(
        find.ancestor(of: leftArrowFinder, matching: find.byType(AnimatedOpacity)),
      );
      expect(leftOpacity.opacity, equals(0.0));

      final rightOpacity = tester.widget<AnimatedOpacity>(
        find.ancestor(of: rightArrowFinder, matching: find.byType(AnimatedOpacity)),
      );
      expect(rightOpacity.opacity, equals(1.0));

      // Tap right arrow to scroll
      await tester.tap(rightArrowFinder);
      await tester.pumpAndSettle();

      // Now left arrow should be visible (opacity 1.0)
      final leftOpacityAfterScroll = tester.widget<AnimatedOpacity>(
        find.ancestor(of: leftArrowFinder, matching: find.byType(AnimatedOpacity)),
      );
      expect(leftOpacityAfterScroll.opacity, equals(1.0));
    });

    testWidgets('tapping an option invokes onOptionSelected, and reset button clears selection', (tester) async {
      String? selected;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return buildTestWidget(
              QuestionFilterWidget(
                questionTitle: 'Choose your preferred Brand',
                options: const ['Samsung', 'Apple', 'Xiaomi'],
                selectedOption: selected,
                onOptionSelected: (val) {
                  setState(() {
                    selected = val;
                  });
                },
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();

      // Initially no RESET button
      expect(find.text('RESET'), findsNothing);

      // Tap Samsung
      await tester.tap(find.text('Samsung'));
      await tester.pumpAndSettle();

      expect(selected, equals('Samsung'));
      expect(find.text('RESET'), findsOneWidget);

      // Tap RESET
      await tester.tap(find.text('RESET'));
      await tester.pumpAndSettle();

      expect(selected, isNull);
      expect(find.text('RESET'), findsNothing);
    });
  });
}
