import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

void main() {
  group('ApiErrorParser.sanitize', () {
    test('strips bracketed HTTP status codes', () {
      expect(
        ApiErrorParser.sanitize('Http status error [401]: Invalid credentials.'),
        equals('Invalid credentials.'),
      );
      expect(
        ApiErrorParser.sanitize('[404] Not Found'),
        equals('Something went wrong. Please try again.'),
      );
      expect(
        ApiErrorParser.sanitize('[500] Database error occurred'),
        equals('Database error occurred'),
      );
      expect(
        ApiErrorParser.sanitize('(301) Moved'),
        equals('Moved'),
      );
    });

    test('strips status code prefixes', () {
      expect(
        ApiErrorParser.sanitize('status code 401: Invalid mobile number'),
        equals('Invalid mobile number'),
      );
      expect(
        ApiErrorParser.sanitize('error code: 400: OTP has expired'),
        equals('OTP has expired'),
      );
    });

    test('strips standard HTTP status lines', () {
      expect(
        ApiErrorParser.sanitize('401 Unauthorized: Session is expired'),
        equals('Session is expired'),
      );
      expect(
        ApiErrorParser.sanitize('500 Internal Server Error'),
        equals('Something went wrong. Please try again.'),
      );
    });

    test('replaces HTML error pages with friendly message', () {
      const htmlPage = '<!DOCTYPE html><html><body>502 Bad Gateway</body></html>';
      expect(
        ApiErrorParser.sanitize(htmlPage),
        equals('Service is temporarily unavailable. Please try again later.'),
      );
    });

    test('parses JSON string with parameters', () {
      const jsonStr = '{"message": "%fieldName is required.", "parameters": {"fieldName": "OTP"}}';
      expect(
        ApiErrorParser.sanitize(jsonStr),
        equals('OTP is required.'),
      );
    });

    test('maps risk score / reCAPTCHA error to user-friendly message', () {
      expect(
        ApiErrorParser.sanitize('Risk score too low: 0.1'),
        equals('Security verification failed. Please wait a moment and try again.'),
      );
      expect(
        ApiErrorParser.sanitize('reCAPTCHA verification failed: score too low'),
        equals('Security verification failed. Please wait a moment and try again.'),
      );
      expect(
        ApiErrorParser.sanitize('Exception: Recaptcha not initialized'),
        equals('Security verification failed. Please wait a moment and try again.'),
      );
      expect(
        ApiErrorParser.sanitize('Verification failed: score too low'),
        equals('Security verification failed. Please wait a moment and try again.'),
      );
    });
  });

  group('ApiErrorParser.extractErrorMessage', () {
    test('extracts backend message with parameter interpolation from Map', () {
      final data = {
        'message': '%fieldName is a required field.',
        'parameters': {'fieldName': 'Mobile number'},
      };
      expect(
        ApiErrorParser.extractErrorMessage(data),
        equals('Mobile number is a required field.'),
      );
    });

    test('extracts error from ErrorResponse', () {
      const errorResponse = ErrorResponse(message: 'Invalid OTP code.');
      expect(
        ApiErrorParser.extractErrorMessage(errorResponse),
        equals('Invalid OTP code.'),
      );
    });

    test('parses DioException badResponse containing backend message', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/test'),
          statusCode: 400,
          data: {'message': 'The OTP you entered is incorrect.'},
        ),
        type: DioExceptionType.badResponse,
      );

      final message = ApiErrorParser.extractErrorMessage(dioException);
      expect(message, equals('The OTP you entered is incorrect.'));
    });

    test('parses DioException timeout into friendly message without status code', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/test'),
        type: DioExceptionType.connectionTimeout,
      );

      final message = ApiErrorParser.extractErrorMessage(dioException);
      expect(
        message,
        equals('Request timed out. Please check your internet connection and try again.'),
      );
    });

    test('parses DioException connection error into friendly message without status code', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/test'),
        type: DioExceptionType.connectionError,
      );

      final message = ApiErrorParser.extractErrorMessage(dioException);
      expect(
        message,
        equals('Unable to connect to server. Please check your internet connection.'),
      );
    });

    test('parses DioException 401 with no body using safe status fallback without number', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/test'),
          statusCode: 401,
          data: null,
        ),
        type: DioExceptionType.badResponse,
      );

      final message = ApiErrorParser.extractErrorMessage(dioException);
      expect(
        message,
        equals('The account sign-in was incorrect or your session has expired.'),
      );
    });
  });
}
