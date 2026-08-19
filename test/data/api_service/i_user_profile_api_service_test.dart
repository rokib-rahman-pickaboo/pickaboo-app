import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_user_profile_api_service.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late IUserProfileApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = IUserProfileApiService(mockDio);
  });

  group('IUserProfileApiService Performance Tests', () {
    test('getUserProfile performance', () async {
      // Arrange
      final responseData = {
        "id": 1,
        "email": "test@example.com",
        "firstname": "Test",
        "lastname": "User",
        "store_id": 1,
        "website_id": 1,
      };

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 70));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure(
        'API: getUserProfile',
        () {
          return apiService.getUserProfile();
        },
      );

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<UserResponse>());
        expect(r.email, 'test@example.com');
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
