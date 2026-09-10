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

    test('getTicketOrders parses 2D array of orders and issue types correctly', () async {
      final responseData = [
        [
          {
            "order_id": "3408",
            "order_number": "1008290762",
            "created_at": "2026-08-10 07:41:53",
            "status": "processing_for_delivery"
          }
        ],
        [
          {
            "department_id": "1",
            "name": "Delivery Issue"
          },
          {
            "department_id": "2",
            "name": "Customer Support"
          }
        ]
      ];

      when(() => mockDio.get(any())).thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 200,
        );
      });

      final result = await apiService.getTicketOrders();

      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r.orders.length, 1);
        expect(r.orders.first.orderId, '3408');
        expect(r.orders.first.incrementId, '1008290762');
        expect(r.issueTypes.length, 2);
        expect(r.issueTypes.first.name, 'Delivery Issue');
        expect(r.issueTypes.last.name, 'Customer Support');
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
