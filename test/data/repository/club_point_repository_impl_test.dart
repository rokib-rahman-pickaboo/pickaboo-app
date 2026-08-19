import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/user_profile_api_service.dart';
import 'package:pickaboo/data/repository/club_point_repository_impl.dart';
import 'package:pickaboo/data/model/club_point/club_point_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockUserProfileApiService extends Mock implements UserProfileApiService {}

void main() {
  late ClubPointRepositoryImpl repository;
  late MockUserProfileApiService mockApiService;

  setUp(() {
    mockApiService = MockUserProfileApiService();
    repository = ClubPointRepositoryImpl(mockApiService);
  });

  group('ClubPointRepositoryImpl Performance Tests', () {
    test('getClubPoints performance', () async {
      // Arrange
      // Need dummy response that maps correctly
      final response = const ClubPointResponse(myPoints: 100);

      when(
        () => mockApiService.getClubPoints(
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 35));
        return Right(response);
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('getClubPoints', () {
        return repository.getClubPoints();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getClubPoints(page: 1, limit: 5)).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
