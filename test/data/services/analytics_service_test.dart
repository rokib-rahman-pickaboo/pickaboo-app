import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late MockAnalyticsService mockAnalytics;

  setUp(() {
    mockAnalytics = MockAnalyticsService();
  });

  test('logAddToCart accepts required and optional parameters matching DC implementation', () async {
    when(() => mockAnalytics.logAddToCart(
          id: any(named: 'id'),
          name: any(named: 'name'),
          price: any(named: 'price'),
          quantity: any(named: 'quantity'),
          categoryId: any(named: 'categoryId'),
          brand: any(named: 'brand'),
          brandId: any(named: 'brandId'),
        )).thenAnswer((_) async {});

    await mockAnalytics.logAddToCart(
      id: '80627',
      name: 'realme narzo 30A 4GB/64GB JM-Almond',
      price: 12330.0,
      quantity: 1,
      categoryId: '123',
      brand: 'realme',
      brandId: '456',
    );

    verify(() => mockAnalytics.logAddToCart(
          id: '80627',
          name: 'realme narzo 30A 4GB/64GB JM-Almond',
          price: 12330.0,
          quantity: 1,
          categoryId: '123',
          brand: 'realme',
          brandId: '456',
        )).called(1);
  });

  test('logAddToCart is backwards compatible with only required parameters', () async {
    when(() => mockAnalytics.logAddToCart(
          id: any(named: 'id'),
          name: any(named: 'name'),
          price: any(named: 'price'),
          quantity: any(named: 'quantity'),
        )).thenAnswer((_) async {});

    await mockAnalytics.logAddToCart(
      id: '80627',
      name: 'realme narzo 30A',
      price: 12330.0,
      quantity: 1,
    );

    verify(() => mockAnalytics.logAddToCart(
          id: '80627',
          name: 'realme narzo 30A',
          price: 12330.0,
          quantity: 1,
        )).called(1);
  });

  test('logViewItem accepts brand, brandId, and categoryId matching DC implementation', () async {
    when(() => mockAnalytics.logViewItem(
          id: any(named: 'id'),
          name: any(named: 'name'),
          price: any(named: 'price'),
          category: any(named: 'category'),
          categoryId: any(named: 'categoryId'),
          brand: any(named: 'brand'),
          brandId: any(named: 'brandId'),
        )).thenAnswer((_) async {});

    await mockAnalytics.logViewItem(
      id: '80627',
      name: 'realme narzo 30A 4GB/64GB JM-Almond',
      price: 12330.0,
      category: 'Smartphones',
      categoryId: '123',
      brand: 'realme',
      brandId: '456',
    );

    verify(() => mockAnalytics.logViewItem(
          id: '80627',
          name: 'realme narzo 30A 4GB/64GB JM-Almond',
          price: 12330.0,
          category: 'Smartphones',
          categoryId: '123',
          brand: 'realme',
          brandId: '456',
        )).called(1);
  });

  test('logViewCategory accepts categoryId and categoryName', () async {
    when(() => mockAnalytics.logViewCategory(
          categoryId: any(named: 'categoryId'),
          categoryName: any(named: 'categoryName'),
        )).thenAnswer((_) async {});

    await mockAnalytics.logViewCategory(
      categoryId: '123',
      categoryName: 'Smartphones',
    );

    verify(() => mockAnalytics.logViewCategory(
          categoryId: '123',
          categoryName: 'Smartphones',
        )).called(1);
  });

  test('logSearch accepts searchString', () async {
    when(() => mockAnalytics.logSearch(
          searchString: any(named: 'searchString'),
        )).thenAnswer((_) async {});

    await mockAnalytics.logSearch(searchString: 'realme');

    verify(() => mockAnalytics.logSearch(searchString: 'realme')).called(1);
  });
}
