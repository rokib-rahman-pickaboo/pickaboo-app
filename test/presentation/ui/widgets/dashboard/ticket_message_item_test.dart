import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_detail_page/ticket_message_item.dart';

Widget createMessageItemUnderTest({required TicketMessageEntity message}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: TicketMessageItem(message: message),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TicketMessageItem', () {
    testWidgets('Renders message sender, text and attachment items with download buttons',
        (WidgetTester tester) async {
      const sampleMessage = TicketMessageEntity(
        messageId: '1',
        replyer: 'Support Agent',
        body: 'Here is your invoice and product photo.',
        createdAt: '2026-09-17 10:30:00',
        attachments: [
          TicketAttachmentEntity(
            fileName: 'invoice.pdf',
            fileType: 'application/pdf',
            path: 'https://example.com/invoice.pdf',
          ),
          TicketAttachmentEntity(
            fileName: 'product_photo.jpg',
            fileType: 'image/jpeg',
            path: 'https://example.com/product_photo.jpg',
          ),
        ],
      );

      await tester.pumpWidget(createMessageItemUnderTest(message: sampleMessage));
      await tester.pumpAndSettle();

      expect(find.text('Support Agent'), findsOneWidget);
      expect(find.text('Here is your invoice and product photo.'), findsOneWidget);
      expect(find.text('invoice.pdf'), findsOneWidget);
      expect(find.text('product_photo.jpg'), findsOneWidget);
      expect(find.byIcon(Icons.picture_as_pdf_rounded), findsOneWidget);
      expect(find.byIcon(Icons.image_outlined), findsOneWidget);
      expect(find.byIcon(Icons.download_rounded), findsNWidgets(2));
    });

    testWidgets('Renders message with no attachments without attachment cards',
        (WidgetTester tester) async {
      const sampleMessage = TicketMessageEntity(
        messageId: '2',
        replyer: 'Customer',
        body: 'Just a text reply with no files.',
        createdAt: '2026-09-17 10:35:00',
        attachments: [],
      );

      await tester.pumpWidget(createMessageItemUnderTest(message: sampleMessage));
      await tester.pumpAndSettle();

      expect(find.text('Customer'), findsOneWidget);
      expect(find.text('Just a text reply with no files.'), findsOneWidget);
      expect(find.byIcon(Icons.download_rounded), findsNothing);
    });
  });
}
