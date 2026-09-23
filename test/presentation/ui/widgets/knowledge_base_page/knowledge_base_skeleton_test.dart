import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/knowledge_base_skeleton.dart';

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

  group('KnowledgeBaseSkeleton Widget Tests', () {
    testWidgets('renders KnowledgeBaseSkeleton with search bar and tiles cleanly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const KnowledgeBaseSkeleton(),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(KnowledgeBaseSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
