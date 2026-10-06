import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/knowledge_base_page/knowledge_base_details_skeleton.dart';

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

  group('KnowledgeBaseDetailsSkeleton Tests', () {
    testWidgets('renders KnowledgeBaseDetailsSkeleton correctly', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(const KnowledgeBaseDetailsSkeleton()),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(KnowledgeBaseDetailsSkeleton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
