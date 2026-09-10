import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/cms_content_bottom_sheet.dart';

void main() {
  testWidgets('CmsContentBottomSheet wraps content without forcing 50% height', (tester) async {
    const cmsBlock = CmsBlockEntity(
      id: 1,
      identifier: 'pickaboo_verified',
      title: 'Pickaboo Assured',
      content: '<p>Authentic Products Destination: We will assure only genuine new products.</p>',
      active: true,
      creationTime: '',
      updateTime: '',
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          home: Scaffold(
            body: CmsContentBottomSheet(cmsBlock: cmsBlock),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Pickaboo Assured'), findsOneWidget);
    expect(find.textContaining('Authentic Products Destination'), findsOneWidget);

    final containerFinder = find.byType(Container).first;
    final size = tester.getSize(containerFinder);
    
    // Total screen height is 600 in default tester. 50% would be 300.
    // Content should wrap naturally and be well below 300.
    expect(size.height, lessThan(300));
  });
}
