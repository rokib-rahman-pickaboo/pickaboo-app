import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/i_auth_api_service.dart';
import 'package:pickaboo/data/model/auth/login_request/login_request.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late IAuthApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = IAuthApiService(mockDio);
  });

  group('IAuthApiService Performance Tests', () {
    test('checkCustomer performance', () async {
      // Arrange
      const phone = "01700000000";
      final responseData = {"status": "success", "message": "User exists"};

      when(
        () => mockDio.post(
          ApiEndpoints.checkCustomerUrl,
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 40));
        return Response(
          requestOptions: RequestOptions(path: ApiEndpoints.checkCustomerUrl),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('API: checkCustomer', () {
        return apiService.checkCustomer(phone: phone);
      });

      // Assert
      expect(result.isRight(), true);
      verify(
        () => mockDio.post(
          ApiEndpoints.checkCustomerUrl,
          data: any(named: 'data'),
        ),
      ).called(1);
    });

    test('login performance', () async {
      // Arrange
      final request = LoginRequest(mobile: '01700000000', password: 'pass');
      const token = "jwt_token_string";

      when(
        () => mockDio.post(
          ApiEndpoints.loginUrl,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 80));
        return Response(
          requestOptions: RequestOptions(path: ApiEndpoints.loginUrl),
          data: token,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('API: login', () {
        return apiService.login(request);
      });

      // Assert
      expect(result.isRight(), true);
      verify(
        () => mockDio.post(
          ApiEndpoints.loginUrl,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
