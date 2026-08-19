import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/i_ticket_api_service.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';
import '../../utils/performance_monitor.dart';

// Mocks
class MockDio extends Mock implements Dio {}

void main() {
  late ITicketApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiService = ITicketApiService(mockDio);
  });

  group('ITicketApiService Performance Tests', () {
    test('getTickets performance', () async {
      // Arrange
      // Using dynamic map to simulate JSON response, Strings for IDs/codes
      final responseData = [
        {
          "ticket_id": "1",
          "ticket_code": "TCK-123",
          "subject": "Issue with Order",
          "issue_type": "Order",
          "last_reply_name": "Admin",
          "last_reply_at": "2023-10-01",
          "Status": "Open",
          "Department": "Support",
        },
      ];

      when(() => mockDio.get(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 70));
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      // Act & Measure
      final result = await PerformanceMonitor.measure('API: getTickets', () {
        return apiService.getTickets();
      });

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r, isA<List<TicketResponse>>());
        expect(r.length, 1);
        expect(r.first.ticketCode, 'TCK-123');
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
