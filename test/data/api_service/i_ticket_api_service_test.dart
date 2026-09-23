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
            "status": "processing_for_delivery",
            "grand_total": "3450.00",
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

      when(() => mockDio.get('/rest/V1/dcastalia-helpdesk/orderinfo'))
          .thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(path: '/rest/V1/dcastalia-helpdesk/orderinfo'),
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
        expect(r.orders.first.grandTotal, 3450.0);
        expect(r.issueTypes.length, 2);
        expect(r.issueTypes.first.name, 'Delivery Issue');
        expect(r.issueTypes.last.name, 'Customer Support');
      });

      // Verify that ONLY orderinfo was called, NEVER /orders/mine
      verify(() => mockDio.get('/rest/V1/dcastalia-helpdesk/orderinfo')).called(1);
      verifyNever(() => mockDio.get(
            '/rest/V1/orders/mine',
            queryParameters: any(named: 'queryParameters'),
          ));
    });

    test('getTicketOrders parses inverted 2D array (departments first, orders second)', () async {
      final responseData = [
        [
          {
            "department_id": "5",
            "name": "Payment Issue"
          }
        ],
        [
          {
            "entity_id": "5500",
            "increment_id": "1008299999",
            "grandtotal": 1500,
            "status": "complete"
          }
        ]
      ];

      when(() => mockDio.get('/rest/V1/dcastalia-helpdesk/orderinfo'))
          .thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(path: '/rest/V1/dcastalia-helpdesk/orderinfo'),
          data: responseData,
          statusCode: 200,
        );
      });

      final result = await apiService.getTicketOrders();

      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r.orders.length, 1);
        expect(r.orders.first.orderId, '5500');
        expect(r.orders.first.incrementId, '1008299999');
        expect(r.orders.first.grandTotal, 1500.0);
        expect(r.issueTypes.length, 1);
        expect(r.issueTypes.first.name, 'Payment Issue');
      });
    });

    test('getTicketOrders parses Map format with orders and departments', () async {
      final responseData = {
        "orders": [
          {
            "order_id": "101",
            "order_number": "ORD-101",
            "grand_total": 500.50,
            "status": "pending"
          }
        ],
        "departments": [
          {
            "id": "10",
            "name": "General Support"
          }
        ]
      };

      when(() => mockDio.get('/rest/V1/dcastalia-helpdesk/orderinfo'))
          .thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(path: '/rest/V1/dcastalia-helpdesk/orderinfo'),
          data: responseData,
          statusCode: 200,
        );
      });

      final result = await apiService.getTicketOrders();

      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r.orders.length, 1);
        expect(r.orders.first.orderId, '101');
        expect(r.orders.first.incrementId, 'ORD-101');
        expect(r.orders.first.grandTotal, 500.50);
        expect(r.issueTypes.length, 1);
        expect(r.issueTypes.first.name, 'General Support');
      });
    });

    test('getTicketOrders parses raw JSON string response', () async {
      const responseData = '[['
          '{"order_id": "202", "order_number": "ORD-202", "grand_total": 999}'
          '], ['
          '{"department_id": "3", "name": "Return Request"}'
          ']]';

      when(() => mockDio.get('/rest/V1/dcastalia-helpdesk/orderinfo'))
          .thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(path: '/rest/V1/dcastalia-helpdesk/orderinfo'),
          data: responseData,
          statusCode: 200,
        );
      });

      final result = await apiService.getTicketOrders();

      expect(result.isRight(), true);
      result.fold((l) => fail('Should be right'), (r) {
        expect(r.orders.length, 1);
        expect(r.orders.first.orderId, '202');
        expect(r.orders.first.incrementId, 'ORD-202');
        expect(r.issueTypes.length, 1);
        expect(r.issueTypes.first.name, 'Return Request');
      });
    });
  });

  tearDownAll(() {
    PerformanceMonitor.printReport();
  });
}
