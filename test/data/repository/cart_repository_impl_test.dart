import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/cart_api_service.dart';
import 'package:pickaboo/data/api_service/checkout_api_service.dart';
import 'package:pickaboo/data/repository/cart_repository_impl.dart';
import 'package:pickaboo/data/model/cart/cart_response/cart_response.dart';
import 'package:pickaboo/data/model/cart/cart_item_response/cart_item_response.dart';
import 'package:pickaboo/data/model/cart/add_cart_item_request/add_cart_item_request.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockCartApiService extends Mock implements CartApiService {}

class MockCheckoutApiService extends Mock implements CheckoutApiService {}

// Fakes
class FakeAddCartItemRequest extends Fake implements AddCartItemRequest {}

void main() {
  late CartRepositoryImpl repository;
  late MockCartApiService mockCartApiService;
  late MockCheckoutApiService mockCheckoutApiService;

  setUpAll(() {
    registerFallbackValue(FakeAddCartItemRequest());
  });

  setUp(() {
    mockCartApiService = MockCartApiService();
    mockCheckoutApiService = MockCheckoutApiService();
    repository = CartRepositoryImpl(mockCartApiService, mockCheckoutApiService);
  });

  group('CartRepositoryImpl Performance Tests', () {
    test('getBasicCart performance', () async {
      // Arrange
      final response = CartResponse(id: 1, items: [], isActive: true);

      when(() => mockCartApiService.getBasicCart()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 75));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('getBasicCart', () {
        return repository.getBasicCart();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockCartApiService.getBasicCart()).called(1);
    });

    test('addItem performance', () async {
      // Arrange
      const sku = 'SKU123';
      const qty = 1;
      const quoteId = '1';
      final response = CartItemResponse(
        itemId: 123,
        sku: sku,
        qty: qty,
        name: 'Product',
        price: 100,
      );

      when(
        () => mockCartApiService.addItem(request: any(named: 'request')),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 120));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('addItem', () {
        return repository.addItem(sku: sku, qty: qty, quoteId: quoteId);
      });

      // Assert
      expect(result.isRight(), true);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
