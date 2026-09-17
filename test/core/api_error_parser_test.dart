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
        equals('Please check your internet connection.'),
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

  group('ApiErrorParser technical & server crash protection', () {
    const magentoCrashTrace =
        'ReflectionException: Class "Magento\\Framework\\App\\Http\\Interceptor" does not exist in /var/www/html/vendor/magento/framework/Code/Reader/ClassReader.php:34\n'
        'Stack trace:\n'
        '#0 /var/www/html/vendor/magento/framework/Code/Reader/ClassReader.php(34): ReflectionClass->__construct()\n'
        '#1 /var/www/html/vendor/magento/framework/ObjectManager/Definition/Runtime.php(50): Magento\\Framework\\Code\\Reader\\ClassReader->getConstructor()\n'
        '#2 /var/www/html/vendor/magento/framework/ObjectManager/Factory/Dynamic/Developer.php(48): Magento\\Framework\\ObjectManager\\Definition\\Runtime->getParameters()\n'
        '#3 /var/www/html/vendor/magento/framework/ObjectManager/ObjectManager.php(59): Magento\\Framework\\ObjectManager\\Factory\\Dynamic\\Developer->create()\n'
        '#4 /var/www/html/vendor/magento/framework/App/Bootstrap.php: Magento\\Framework\\ObjectManager\\ObjectManager->create()\n'
        '#5 /var/www/html/pub/index.php(29): Magento\\Framework\\App\\Bootstrap->createApplication()\n'
        '#6 {main}';

    test('identifies raw Magento crash dump as technical crash', () {
      expect(ApiErrorParser.isTechnicalOrServerCrash(magentoCrashTrace), isTrue);
    });

    test('sanitizes raw Magento ReflectionException stack trace to fallback', () {
      const fallback =
          'Something went wrong while loading this product. Please try again in a moment.';
      final sanitized = ApiErrorParser.sanitize(
        magentoCrashTrace,
        fallback: fallback,
      );

      expect(sanitized, equals(fallback));
      expect(sanitized.contains('ReflectionException'), isFalse);
      expect(sanitized.contains('/var/www/'), isFalse);
      expect(sanitized.contains('Stack trace:'), isFalse);
      expect(sanitized.contains('Interceptor'), isFalse);
    });

    test('sanitizes DioException with crash string in response body', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/rest/V1/products/123'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/rest/V1/products/123'),
          statusCode: 500,
          data: magentoCrashTrace,
        ),
        type: DioExceptionType.badResponse,
      );

      final result = ApiErrorParser.parseDioError(
        dioException,
        defaultMessage: 'Something went wrong while loading this product. Please try again in a moment.',
      );

      expect(
        result.message,
        equals('Something went wrong while loading this product. Please try again in a moment.'),
      );
      expect(result.message!.contains('ReflectionException'), isFalse);
    });

    test('detects various server crash patterns', () {
      expect(ApiErrorParser.isTechnicalOrServerCrash('Fatal error: Uncaught TypeError: Argument 1'), isTrue);
      expect(ApiErrorParser.isTechnicalOrServerCrash('SQLSTATE[HY000]: General error: lock wait timeout exceeded'), isTrue);
      expect(ApiErrorParser.isTechnicalOrServerCrash('Class "App\\Services\\OrderService" not found in /var/www/pickaboo/order.php:12'), isTrue);
      expect(ApiErrorParser.isTechnicalOrServerCrash('Traceback (most recent call last): File "app.py", line 42'), isTrue);
      expect(ApiErrorParser.isTechnicalOrServerCrash('Error: Cannot find module in node_modules/express'), isTrue);
      expect(ApiErrorParser.isTechnicalOrServerCrash('ObjectManager failed to create Interceptor'), isTrue);
      expect(
        ApiErrorParser.isTechnicalOrServerCrash(
          "Invalid argument(s): 'shipment' is not one of the supported values: invoice, order",
        ),
        isTrue,
      );
      expect(
        ApiErrorParser.isTechnicalOrServerCrash(
          "FormatException: Invalid date format 2026-09-13 04:03:20 PM",
        ),
        isTrue,
      );
    });

    test('sanitizes ArgumentError and enum decoding errors to fallback', () {
      const fallback = 'Failed to load order details. Please try again.';
      final sanitized = ApiErrorParser.sanitize(
        "Invalid argument(s): 'shipment' is not one of the supported values: invoice, order",
        fallback: fallback,
      );
      expect(sanitized, equals(fallback));
    });

    test('allows legitimate user-facing error messages to pass through', () {
      expect(ApiErrorParser.isTechnicalOrServerCrash('Product is currently out of stock.'), isFalse);
      expect(ApiErrorParser.isTechnicalOrServerCrash('Please enter a valid phone number.'), isFalse);
      expect(ApiErrorParser.isTechnicalOrServerCrash('The coupon code is invalid or has expired.'), isFalse);
    });
  });
}
