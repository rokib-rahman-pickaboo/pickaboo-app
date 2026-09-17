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
  });
}
