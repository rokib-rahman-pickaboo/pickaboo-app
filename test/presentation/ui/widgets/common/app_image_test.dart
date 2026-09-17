import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// AppImage sizes its placeholder and error states with `.r` / `.sp`, which
/// throw a LateInitializationError unless ScreenUtil has been initialized.
/// Pumping a bare MaterialApp is therefore not enough.
Future<void> _pumpAppImage(WidgetTester tester, Widget child) {
  return tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => MaterialApp(home: Scaffold(body: child)),
    ),
  );
}

void main() {
  group('AppImage Widget Tests', () {
    testWidgets('should render CachedNetworkImage when valid URL is provided', (
      WidgetTester tester,
    ) async {
      const testUrl = 'https://example.com/image.jpg';

      await _pumpAppImage(tester, const AppImage(imageUrl: testUrl));

      expect(find.byType(CachedNetworkImage), findsOneWidget);
      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(networkImage.imageUrl, testUrl);
    });

    testWidgets('should format protocol-relative URLs correctly', (
      WidgetTester tester,
    ) async {
      const testUrl = '//example.com/image.jpg';
      const expectedUrl = 'https://example.com/image.jpg';

      await _pumpAppImage(tester, const AppImage(imageUrl: testUrl));

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(networkImage.imageUrl, expectedUrl);
    });

    testWidgets('should format relative URLs by prepending base URL', (
      WidgetTester tester,
    ) async {
      const testUrl = 'media/product/123.jpg';
      // Derived from the configured environment rather than hard-coded: the
      // default build is staging (gcpadmin), not production (www).
      final expectedUrl = '${ApiEndpoints.baseUrl}/media/product/123.jpg';

      await _pumpAppImage(tester, const AppImage(imageUrl: testUrl));

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(networkImage.imageUrl, expectedUrl);
    });

    testWidgets('should show error widget when URL is null or empty', (
      WidgetTester tester,
    ) async {
      await _pumpAppImage(tester, const AppImage(imageUrl: null));

      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);

      await _pumpAppImage(tester, const AppImage(imageUrl: ''));

      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
    });

    testWidgets('should render custom placeholder while loading', (
      WidgetTester tester,
    ) async {
      const testUrl = 'https://example.com/image.jpg';
      const placeholderKey = Key('custom_placeholder');

      await _pumpAppImage(
        tester,
        const AppImage(
          imageUrl: testUrl,
          placeholder: SizedBox(key: placeholderKey),
        ),
      );

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );

      // We can manually trigger the placeholder builder if needed,
      // but standard behavior is enough to verify it's passed.
      expect(networkImage.placeholder, isNotNull);
    });

    testWidgets('should show a static (non-animated) loading placeholder', (
      WidgetTester tester,
    ) async {
      const testUrl = 'https://example.com/image.jpg';

      await _pumpAppImage(tester, const AppImage(imageUrl: testUrl));

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );

      // Build the placeholder
      final BuildContext context = tester.element(find.byType(AppImage));
      final placeholder = networkImage.placeholder!(context, testUrl);

      // The shimmer was removed for performance: a grid of loading cards each
      // ran its own animation, repainting the viewport every frame. The
      // placeholder is now a plain sized block.
      expect(placeholder, isA<LayoutBuilder>());
    });

    testWidgets(
      'should show error widget when URL is null or empty (manual=false)',
      (WidgetTester tester) async {
        await _pumpAppImage(tester, const AppImage(imageUrl: null));

        expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
        // Refresh icon should NOT be there because manual is false for
        // null/empty URLs.
        expect(find.byIcon(Icons.refresh), findsNothing);

        await _pumpAppImage(tester, const AppImage(imageUrl: ''));

        expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
        expect(find.byIcon(Icons.refresh), findsNothing);
      },
    );

    testWidgets('should respect provided dimensions', (
      WidgetTester tester,
    ) async {
      const testUrl = 'https://example.com/image.jpg';
      const width = 150.0;
      const height = 100.0;

      await _pumpAppImage(
        tester,
        const AppImage(imageUrl: testUrl, width: width, height: height),
      );

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(networkImage.width, width);
      expect(networkImage.height, height);
    });

    testWidgets('should default filterQuality to FilterQuality.medium', (
      WidgetTester tester,
    ) async {
      const testUrl = 'https://example.com/image.jpg';

      await _pumpAppImage(tester, const AppImage(imageUrl: testUrl));

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(networkImage.filterQuality, FilterQuality.medium);
    });

    testWidgets('should respect custom filterQuality and constrainHeightInMemCache', (
      WidgetTester tester,
    ) async {
      const testUrl = 'https://example.com/image.jpg';

      await _pumpAppImage(
        tester,
        const AppImage(
          imageUrl: testUrl,
          width: 300,
          height: 200,
          filterQuality: FilterQuality.high,
          constrainHeightInMemCache: false,
        ),
      );

      final networkImage = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(networkImage.filterQuality, FilterQuality.high);
      expect(networkImage.memCacheWidth, isNotNull);
      expect(networkImage.memCacheHeight, isNull);
    });
  });
}
