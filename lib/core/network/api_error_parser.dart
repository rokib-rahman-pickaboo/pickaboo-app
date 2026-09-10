import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

/// Centralized utility for extracting, formatting, and sanitizing error messages
/// from backend API responses, ensuring the user always sees clean backend-supplied text
/// while strictly preventing raw HTTP status codes (like 301, 401, 404, 500, etc.) from being shown.
class ApiErrorParser {
  ApiErrorParser._();

  /// Extracts a clean, user-friendly error message from any dynamic error object or DioException.
  static String extractErrorMessage(
    dynamic error, {
    String defaultMessage = 'Something went wrong. Please try again.',
  }) {
    if (error == null) return defaultMessage;

    if (error is DioException) {
      return parseDioError(error, defaultMessage: defaultMessage).message ??
          defaultMessage;
    }

    if (error is ErrorResponse) {
      return sanitize(error.message, fallback: defaultMessage);
    }

    if (error is Map<String, dynamic>) {
      return _formatErrorMap(error, defaultMessage: defaultMessage);
    }

    return sanitize(error.toString(), fallback: defaultMessage);
  }

  /// Parses a [DioException] into an [ErrorResponse] with a sanitized, friendly message.
  static ErrorResponse parseDioError(
    DioException err, {
    String defaultMessage = 'Something went wrong. Please try again.',
  }) {
    // 1. Try extracting message from response data
    if (err.type == DioExceptionType.badResponse && err.response != null) {
      final data = err.response?.data;

      if (data is Map<String, dynamic>) {
        final msg = _formatErrorMap(data, defaultMessage: defaultMessage);
        return ErrorResponse(
          success: false,
          message: msg,
        );
      }

      if (data is String) {
        final trimmed = data.trim();
        if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
          try {
            final decoded = json.decode(trimmed);
            if (decoded is Map<String, dynamic>) {
              final msg = _formatErrorMap(decoded, defaultMessage: defaultMessage);
              return ErrorResponse(
                success: false,
                message: msg,
              );
            }
          } catch (_) {}
        }

        // Check if data is an HTML error page (e.g. 502 Bad Gateway)
        if (trimmed.contains('<html') ||
            trimmed.contains('<!DOCTYPE') ||
            trimmed.contains('<body')) {
          return ErrorResponse(
            success: false,
            message: _fallbackForStatusCode(err.response?.statusCode, defaultMessage),
          );
        }

        final sanitizedStr = sanitize(trimmed, fallback: defaultMessage);
        return ErrorResponse(
          success: false,
          message: sanitizedStr,
        );
      }
    }

    // 2. Check network / timeout issues
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ErrorResponse(
          success: false,
          message: 'Request timed out. Please check your internet connection and try again.',
        );
      case DioExceptionType.connectionError:
        return const ErrorResponse(
          success: false,
          message: 'Unable to connect to server. Please check your internet connection.',
        );
      case DioExceptionType.cancel:
        return const ErrorResponse(
          success: false,
          message: 'Request was cancelled.',
        );
      case DioExceptionType.badCertificate:
        return const ErrorResponse(
          success: false,
          message: 'Secure connection could not be established.',
        );
      case DioExceptionType.unknown:
        final msg = err.message ?? '';
        if (msg.toLowerCase().contains('socket') ||
            msg.toLowerCase().contains('host lookup') ||
            msg.toLowerCase().contains('network')) {
          return const ErrorResponse(
            success: false,
            message: 'Network issue encountered. Please check your internet connection.',
          );
        }
        break;
      default:
        break;
    }

    // 3. Fallback based on HTTP status code if no body message available
    final statusCode = err.response?.statusCode;
    return ErrorResponse(
      success: false,
      message: _fallbackForStatusCode(statusCode, defaultMessage),
    );
  }

  /// Formats a backend JSON error map, handling Magento's `%placeholder` parameters.
  static String _formatErrorMap(
    Map<String, dynamic> data, {
    required String defaultMessage,
  }) {
    // Check common message keys
    var rawMessage = data['message']?.toString() ??
        data['error']?.toString() ??
        data['detail']?.toString() ??
        data['msg']?.toString() ??
        data['errorMessage']?.toString();

    // Check parameters placeholder interpolation (e.g. "%fieldName" is required)
    final parameters = data['parameters'];
    if (rawMessage != null && parameters is Map) {
      parameters.forEach((key, value) {
        rawMessage = rawMessage!.replaceAll('%$key', value.toString());
      });
    } else if (rawMessage != null && parameters is List) {
      for (var i = 0; i < parameters.length; i++) {
        rawMessage = rawMessage!.replaceAll('%${i + 1}', parameters[i].toString());
      }
    }

    if (rawMessage != null && rawMessage!.trim().isNotEmpty) {
      return sanitize(rawMessage, fallback: defaultMessage);
    }

    return defaultMessage;
  }

  /// Sanitizes any error message by stripping raw HTTP status codes (301, 400, 401, 404, 500, etc.)
  /// and low-level technical exception wrappers.
  static String sanitize(
    String? raw, {
    String fallback = 'Something went wrong. Please try again.',
  }) {
    if (raw == null || raw.trim().isEmpty) return fallback;

    var msg = raw.trim();

    // Remove wrapping quotes
    if ((msg.startsWith('"') && msg.endsWith('"')) ||
        (msg.startsWith("'") && msg.endsWith("'"))) {
      if (msg.length >= 2) {
        msg = msg.substring(1, msg.length - 1).trim();
      }
    }

    // Check if message is JSON string
    if (msg.startsWith('{') && msg.endsWith('}')) {
      try {
        final decoded = json.decode(msg);
        if (decoded is Map<String, dynamic>) {
          return _formatErrorMap(decoded, defaultMessage: fallback);
        }
      } catch (_) {}
    }

    // Check HTML
    if (msg.contains('<html') || msg.contains('<!DOCTYPE') || msg.contains('<body')) {
      return 'Service is temporarily unavailable. Please try again later.';
    }

    // Strip DioException / technical prefixes
    msg = msg.replaceAll(RegExp(r'^DioException(\s*\[.*?\])?:\s*', caseSensitive: false), '');
    msg = msg.replaceAll(RegExp(r'^Exception:\s*', caseSensitive: false), '');
    msg = msg.replaceAll(RegExp(r'^Http status error\s*(\[\d+\])?:\s*', caseSensitive: false), '');
    msg = msg.replaceAll(RegExp(r'^Http status error\s*\[\d+\]\s*', caseSensitive: false), '');
    msg = msg.replaceAll(RegExp(r'^Error:\s*', caseSensitive: false), '');

    // Strip status lines like "401 Unauthorized", "[404] Not Found", "500 Internal Server Error"
    msg = msg.replaceAll(
      RegExp(
        r'(\[|\()?\s*[1-5]\d{2}\s*(\]|\))?\s*(Unauthorized|Forbidden|Not Found|Bad Request|Internal Server Error|Bad Gateway|Service Unavailable)\b',
        caseSensitive: false,
      ),
      '',
    );

    // Strip bracketed or parenthesized HTTP status codes (e.g., [401], (401), [301], [500])
    msg = msg.replaceAll(RegExp(r'\[\s*[1-5]\d{2}\s*\]'), '');
    msg = msg.replaceAll(RegExp(r'\(\s*[1-5]\d{2}\s*\)'), '');

    // Strip textual status code declarations like "status code 401", "error code: 401", "http code 404"
    msg = msg.replaceAll(
      RegExp(r'\b(status|error|http|response)?\s*code:?\s*[1-5]\d{2}\b', caseSensitive: false),
      '',
    );

    // Clean up double spaces and leading punctuation left behind
    msg = msg.replaceAll(RegExp(r'\s{2,}'), ' ').trim();
    msg = msg.replaceAll(RegExp(r'^[-:;,]\s*'), '').trim();

    // Check if what remains is just a bare HTTP error phrase
    final lower = msg.toLowerCase();
    if (lower == 'unauthorized' ||
        lower == 'forbidden' ||
        lower == 'not found' ||
        lower == 'bad request' ||
        lower == 'internal server error' ||
        lower == 'bad gateway' ||
        lower == 'service unavailable') {
      return fallback;
    }

    // Map internal reCAPTCHA / risk score messages to user-friendly copy
    if (lower.contains('risk score') ||
        lower.contains('recaptcha') ||
        lower.contains('score too low')) {
      return 'Security verification failed. Please wait a moment and try again.';
    }

    // Map raw PHP / Magento internal stack traces to a user-friendly message
    if (lower.contains('type error occurred when creating object') ||
        lower.contains('abstractfactory.php') ||
        lower.contains('interceptor.php') ||
        lower.contains('argument #') ||
        lower.contains('uncaught typeerror') ||
        lower.contains('fatal error')) {
      return 'Service is temporarily unavailable. Please try again later.';
    }

    // If message was completely wiped or is only symbols, return fallback
    if (msg.isEmpty || RegExp(r'^[^a-zA-Z0-9]+$').hasMatch(msg)) {
      return fallback;
    }

    return msg;
  }

  static String _fallbackForStatusCode(int? statusCode, String defaultMessage) {
    if (statusCode == null) return defaultMessage;
    switch (statusCode) {
      case 401:
        return 'The account sign-in was incorrect or your session has expired.';
      case 403:
        return 'Access is restricted. Please try again later.';
      case 404:
        return 'The requested information was not found.';
      case 409:
        return 'A conflict occurred. Please verify your details.';
      case 422:
      case 400:
        return 'Invalid input provided. Please verify your details.';
      case 429:
        return 'Too many requests. Please wait a moment and try again.';
      case 500:
      case 502:
      case 503:
      case 504:
        return 'Service is temporarily unavailable. Please try again later.';
      default:
        return defaultMessage;
    }
  }
}
