import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/domain/entity/demo/payment_models.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/price_summary_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/payment_review_page/delivery_options_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_delivery_location_selector.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapWithScreenUtil(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        home: Scaffold(body: child),
      ),
    );
  }

  group('PlacePickResultEntity serialization', () {
    test('toJson and fromJson preserves all fields', () {
      const entity = PlacePickResultEntity(
        placeId: 101,
        latitude: 23.7925,
        longitude: 90.4078,
        address: 'Banani, Dhaka',
        placeName: 'House 12, Road 11',
        house: '12',
        road: '11',
        area: 'Banani',
        subArea: 'Block D',
        city: 'Dhaka',
        subDistrict: 'Gulshan',
        district: 'Dhaka',
        division: 'Dhaka',
        union: 'Ward 19',
        country: 'Bangladesh',
        uCode: 'DHK123',
        postCode: 1213,
        pType: 'Residential',
        subType: 'Apartment',
        distanceWithinMeters: 50,
      );

      final json = entity.toJson();
      final restored = PlacePickResultEntity.fromJson(json);

      expect(restored.placeId, 101);
      expect(restored.latitude, 23.7925);
      expect(restored.longitude, 90.4078);
      expect(restored.address, 'Banani, Dhaka');
      expect(restored.placeName, 'House 12, Road 11');
      expect(restored.district, 'Dhaka');
      expect(restored.division, 'Dhaka');
      expect(restored.postCode, 1213);
      expect(restored.displayAddress, 'House 12, Road 11');
    });
  });

  group('PdpDeliveryLocationSelector', () {
    testWidgets('displays Standard Delivery when isExpress is false', (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          PdpDeliveryLocationSelector(
            selectedAddress: 'Agrabad, Chittagong',
            isExpress: false,
            onTap: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Delivery by 3-4 working days'), findsOneWidget);
    });

    testWidgets('displays Express Delivery when isExpress is true', (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          PdpDeliveryLocationSelector(
            selectedAddress: 'Gulshan, Dhaka',
            isExpress: true,
            onTap: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      final now = DateTime.now();
      if (now.weekday != DateTime.friday && now.hour < 12) {
        expect(find.text('Delivery by Today'), findsOneWidget);
      } else {
        expect(find.text('Delivery by Tomorrow'), findsOneWidget);
      }
    });
  });

  group('DeliveryOptionsWidget (Vertical List)', () {
    testWidgets('renders options in a Column without horizontal scroll', (tester) async {
      final methods = [
        DeliveryMethod(
          carrierCode: 'standard',
          methodCode: 'standard_delivery',
          carrierTitle: 'Regular Delivery',
          methodTitle: 'Delivered in 2-3 business days',
          amount: 60.0,
          isSelected: true,
        ),
        DeliveryMethod(
          carrierCode: 'express',
          methodCode: 'express_delivery',
          carrierTitle: 'Express Delivery',
          methodTitle: 'Delivered today or tomorrow',
          amount: 120.0,
          isSelected: false,
        ),
      ];

      await tester.pumpWidget(
        wrapWithScreenUtil(
          DeliveryOptionsWidget(
            methods: methods,
            onSameMethodSelected: (_) {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Delivery Options'), findsOneWidget);
      expect(find.text('Regular Delivery'), findsOneWidget);
      expect(find.text('Express Delivery'), findsOneWidget);
      expect(find.text('৳ 60'), findsOneWidget);
      expect(find.text('৳ 120'), findsOneWidget);

      // Verify it is NOT wrapped in a horizontal SingleChildScrollView
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is SingleChildScrollView &&
              widget.scrollDirection == Axis.horizontal,
        ),
        findsNothing,
      );
    });
  });

  group('PriceSummaryWidget Shipping Label', () {
    testWidgets('displays "Shipping and Handeling" instead of just "Shipping"', (tester) async {
      await tester.pumpWidget(
        wrapWithScreenUtil(
          const PriceSummaryWidget(
            subtotal: 1000,
            grandTotal: 1060,
            discountAmount: 0,
            shippingAmount: 60,
            discountTitle: '',
            clubPointDiscount: 0,
            itemsCount: 2,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Shipping and Handeling'), findsOneWidget);
      expect(find.text('Shipping'), findsNothing);
    });
  });
}
