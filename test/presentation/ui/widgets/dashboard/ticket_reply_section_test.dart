import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_detail_page/ticket_reply_section.dart';

Widget createReplySectionUnderTest({
  required TextEditingController controller,
  required FocusNode focusNode,
  required List<File> files,
  required ValueChanged<List<File>> onFilesChanged,
  required VoidCallback onPostReply,
  bool isSubmitting = false,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: TicketReplySection(
            replyController: controller,
            replyFocusNode: focusNode,
            selectedFiles: files,
            onFilesChanged: onFilesChanged,
            onPostReply: onPostReply,
            isSubmitting: isSubmitting,
          ),
        ),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TicketReplySection & TicketAttachmentPicker', () {
    late TextEditingController controller;
    late FocusNode focusNode;

    setUp(() {
      controller = TextEditingController();
      focusNode = FocusNode();
    });

    tearDown(() {
      controller.dispose();
      focusNode.dispose();
    });

    testWidgets('Renders Post a Reply, text field, attachments card and submit button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createReplySectionUnderTest(
          controller: controller,
          focusNode: focusNode,
          files: [],
          onFilesChanged: (_) {},
          onPostReply: () {},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Post a Reply'), findsOneWidget);
      expect(find.text('Enter your message here'), findsOneWidget);
      expect(
        find.text('Attachments (jpg, jpeg, png, pdf) - Max 5 files'),
        findsOneWidget,
      );
      expect(
        find.text('Choose Files (5 slots remaining)'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.cloud_upload_outlined), findsOneWidget);
      expect(find.text('Submit Reply'), findsOneWidget);
    });

    testWidgets('Renders selected files preview and updates remaining slots',
        (WidgetTester tester) async {
      final sampleFiles = [
        File('/tmp/test_image.png'),
        File('/tmp/sample_doc.pdf'),
      ];

      await tester.pumpWidget(
        createReplySectionUnderTest(
          controller: controller,
          focusNode: focusNode,
          files: sampleFiles,
          onFilesChanged: (_) {},
          onPostReply: () {},
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text('Choose Files (3 slots remaining)'),
        findsOneWidget,
      );
      expect(find.text('test_image.png'), findsOneWidget);
      expect(find.text('sample_doc.pdf'), findsOneWidget);
      expect(find.byIcon(Icons.picture_as_pdf_rounded), findsOneWidget);
    });

    testWidgets('Triggers onFilesChanged when removing a file',
        (WidgetTester tester) async {
      final sampleFiles = [
        File('/tmp/test_image.png'),
        File('/tmp/sample_doc.pdf'),
      ];

      List<File>? updatedFiles;

      await tester.pumpWidget(
        createReplySectionUnderTest(
          controller: controller,
          focusNode: focusNode,
          files: sampleFiles,
          onFilesChanged: (files) => updatedFiles = files,
          onPostReply: () {},
        ),
      );
      await tester.pumpAndSettle();

      // Tap first close icon
      final closeIcons = find.byIcon(Icons.close_rounded);
      expect(closeIcons, findsNWidgets(2));

      await tester.tap(closeIcons.first);
      await tester.pumpAndSettle();

      expect(updatedFiles, isNotNull);
      expect(updatedFiles!.length, 1);
      expect(updatedFiles!.first.path, '/tmp/sample_doc.pdf');
    });

    testWidgets('Triggers onPostReply callback when Submit Reply is tapped',
        (WidgetTester tester) async {
      bool replySubmitted = false;

      await tester.pumpWidget(
        createReplySectionUnderTest(
          controller: controller,
          focusNode: focusNode,
          files: [],
          onFilesChanged: (_) {},
          onPostReply: () => replySubmitted = true,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Submit Reply'));
      await tester.pumpAndSettle();

      expect(replySubmitted, isTrue);
    });
  });
}
