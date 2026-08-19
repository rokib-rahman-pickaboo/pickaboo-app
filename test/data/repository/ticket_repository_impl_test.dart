import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/ticket_api_service.dart';
import 'package:pickaboo/data/mapper/ticket_mapper.dart';
import 'package:pickaboo/data/local_data_source/ticket_local_data_source.dart';
import 'package:pickaboo/data/repository/ticket_repository_impl.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockTicketApiService extends Mock implements TicketApiService {}

class MockTicketMapper extends Mock implements TicketMapper {}

class MockTicketLocalDataSource extends Mock implements TicketLocalDataSource {}

// Fakes
class FakeTicketResponse extends Fake implements TicketResponse {}

void main() {
  late TicketRepositoryImpl repository;
  late MockTicketApiService mockApiService;
  late MockTicketMapper mockMapper;
  late MockTicketLocalDataSource mockLocalDataSource;

  setUpAll(() {
    registerFallbackValue(FakeTicketResponse());
  });

  setUp(() {
    mockApiService = MockTicketApiService();
    mockMapper = MockTicketMapper();
    mockLocalDataSource = MockTicketLocalDataSource();
    repository = TicketRepositoryImpl(
      mockApiService,
      mockMapper,
      mockLocalDataSource,
    );
  });

  group('TicketRepositoryImpl Performance Tests', () {
    test('getTickets (Cache Hit) performance', () async {
      // Arrange
      final cachedTickets = [
        const TicketResponse(ticketId: '1', subject: 'Issue'),
      ];
      final entity = TicketEntity(
        ticketId: '1',
        ticketCode: 'TC1',
        subject: 'Issue',
        issueType: 'Type1',
        status: 'Open',
        department: 'Support',
        lastReplyName: 'Agent',
        lastReplyAt: '2025-01-01',
      );

      when(
        () => mockLocalDataSource.getTicketsIfValid(),
      ).thenAnswer((_) async => cachedTickets);

      when(
        () => mockMapper.mapTicketResponseToEntity(any()),
      ).thenReturn(entity);

      // Act & Measure
      final result = await PerformanceMonitor.measure('getTickets (Cache)', () {
        return repository.getTickets();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockLocalDataSource.getTicketsIfValid()).called(1);
      verifyNever(() => mockApiService.getTickets());
    });

    test('getTickets (API Hit) performance', () async {
      // Arrange
      final apiTickets = [
        const TicketResponse(ticketId: '2', subject: 'New Issue'),
      ];
      final entity = TicketEntity(
        ticketId: '2',
        ticketCode: 'TC2',
        subject: 'New Issue',
        issueType: 'Type2',
        status: 'Open',
        department: 'Sales',
        lastReplyName: 'Agent',
        lastReplyAt: '2025-01-02',
      );

      when(
        () => mockLocalDataSource.getTicketsIfValid(),
      ).thenAnswer((_) async => null); // Cache miss

      when(() => mockApiService.getTickets()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 90));
        return Right(apiTickets);
      });

      when(
        () => mockLocalDataSource.insertTickets(any()),
      ).thenAnswer((_) async => {});

      when(
        () => mockMapper.mapTicketResponseToEntity(any()),
      ).thenReturn(entity);

      // Act & Measure
      final result = await PerformanceMonitor.measure('getTickets (API)', () {
        return repository.getTickets();
      });

      // Assert
      expect(result.isRight(), true);
      verify(() => mockApiService.getTickets()).called(1);
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
