import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_skeleton_widget.dart';

Widget _buildTestableWidget(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, _) => MaterialApp(
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('PdpSkeletonWidget renders without preview data', (tester) async {
    await tester.pumpWidget(_buildTestableWidget(const PdpSkeletonWidget()));
    await tester.pump();

    // Verifies skeleton layout elements exist
    expect(find.byType(PdpSkeletonWidget), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
    expect(find.byIcon(Icons.share_outlined), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

    // Verifies fixed Trust Ribbon strip
    expect(find.text('100% Authentic'), findsOneWidget);
    expect(find.text('Easy Return'), findsOneWidget);
  });

  testWidgets('PdpSkeletonWidget hydrates productName and previewPrice instantly', (tester) async {
    await tester.pumpWidget(
      _buildTestableWidget(
        const PdpSkeletonWidget(
          productName: 'Samsung Galaxy S24 Ultra',
          previewPrice: '149,999',
        ),
      ),
    );
    await tester.pump();

    // Verify preview productName is displayed in title
    expect(find.textContaining('Samsung Galaxy S24 Ultra'), findsOneWidget);

    // Verify preview price is displayed
    expect(find.text('৳149,999'), findsOneWidget);

    // Verify clean loader indicator exists without extra text
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Loading product details...'), findsNothing);
  });

  testWidgets('PdpSkeletonWidget hydrates full ProductEntity preview with discount and express', (tester) async {
    const product = ProductEntity(
      id: '101',
      productName: 'Haier 1.5 Ton ZenGlow Air Conditioner',
      sku: 'HAIER-101',
      slug: 'haier-1-5-ton-zenglow',
      typeId: 'simple',
      stockAvailable: true,
      freeDelivery: true,
      productPrice: 71990,
      productSpecialPrice: 50990,
      productDiscount: 29,
      offers: '',
      rating: 5.0,
      clubPoint: 0,
      ratingCount: 1383,
      productImg: 'https://example.com/haier.jpg',
      emiAvailable: true,
      comingSoon: false,
      expressDelivery: true,
    );

    await tester.pumpWidget(
      _buildTestableWidget(
        const PdpSkeletonWidget(
          previewProduct: product,
        ),
      ),
    );
    await tester.pump();

    // Verify Title & In Stock
    expect(find.textContaining('Haier 1.5 Ton ZenGlow Air Conditioner'), findsOneWidget);
    expect(find.text('In Stock'), findsOneWidget);

    // Verify Brand
    expect(find.text('HAIER'), findsOneWidget);

    // Verify Price row (current price, strike regular price, discount badge)
    expect(find.text('৳50,990'), findsOneWidget);
    expect(find.text('৳71,990'), findsOneWidget);
    expect(find.text('-29%'), findsOneWidget);

    // Verify Savings text is omitted as requested
    expect(find.textContaining('You save'), findsNothing);

    // Verify Rating
    expect(find.text('5.0 '), findsOneWidget);
    expect(find.text('(1383)'), findsOneWidget);
  });

  testWidgets('PdpSkeletonWidget floating actions trigger callbacks', (tester) async {
    bool backPressed = false;
    bool searchPressed = false;
    bool cartPressed = false;
    bool favPressed = false;
    bool sharePressed = false;

    await tester.pumpWidget(
      _buildTestableWidget(
        PdpSkeletonWidget(
          cartCount: 3,
          isFavorite: true,
          onBack: () => backPressed = true,
          onSearch: () => searchPressed = true,
          onCart: () => cartPressed = true,
          onFavorite: () => favPressed = true,
          onShare: () => sharePressed = true,
        ),
      ),
    );
    await tester.pump();

    // Verify Cart badge
    expect(find.text('3'), findsOneWidget);

    // Verify Favorite icon is filled when isFavorite is true
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);

    // Tap back
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    expect(backPressed, isTrue);

    // Tap search
    await tester.tap(find.byIcon(Icons.search_rounded));
    expect(searchPressed, isTrue);

    // Tap cart
    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    expect(cartPressed, isTrue);

    // Tap favorite
    await tester.tap(find.byIcon(Icons.favorite_rounded));
    expect(favPressed, isTrue);

    // Tap share
    await tester.tap(find.byIcon(Icons.share_outlined));
    expect(sharePressed, isTrue);
  });
}
