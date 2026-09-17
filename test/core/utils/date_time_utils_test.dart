import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';

void main() {
  group('parseServerDateTime tests', () {
    test('parses 12-hour AM/PM format from backend (user issue format)', () {
      final dt = parseServerDateTime('2026-09-13 04:03:20 PM');
      expect(dt, isNotNull);
      expect(dt!.year, equals(2026));
      expect(dt.month, equals(9));
      expect(dt.day, equals(13));
      expect(dt.hour, equals(16)); // 4 PM is 16
      expect(dt.minute, equals(3));
      expect(dt.second, equals(20));
    });

    test('parses 12-hour AM format from backend', () {
      final dt = parseServerDateTime('2026-09-13 04:03:20 AM');
      expect(dt, isNotNull);
      expect(dt!.hour, equals(4));
      expect(dt.minute, equals(3));
      expect(dt.second, equals(20));
    });

    test('parses 12-hour midnight and noon correctly', () {
      final noon = parseServerDateTime('2026-09-13 12:30:00 PM');
      expect(noon!.hour, equals(12));

      final midnight = parseServerDateTime('2026-09-13 12:30:00 AM');
      expect(midnight!.hour, equals(0));
    });

    test('parses single-digit hour with AM/PM', () {
      final dt = parseServerDateTime('2026-09-13 4:03:20 PM');
      expect(dt, isNotNull);
      expect(dt!.hour, equals(16));
    });

    test('parses time without seconds', () {
      final dt = parseServerDateTime('2026-09-13 04:03 PM');
      expect(dt, isNotNull);
      expect(dt!.hour, equals(16));
      expect(dt.minute, equals(3));
      expect(dt.second, equals(0));
    });

    test('parses lowercase am/pm', () {
      final dt = parseServerDateTime('2026-09-13 04:03:20 pm');
      expect(dt, isNotNull);
      expect(dt!.hour, equals(16));
    });

    test('parses slash separated date with AM/PM', () {
      final dt = parseServerDateTime('2026/09/13 04:03:20 PM');
      expect(dt, isNotNull);
      expect(dt!.year, equals(2026));
      expect(dt.month, equals(9));
      expect(dt.day, equals(13));
      expect(dt.hour, equals(16));
    });

    test('parses day-first date format', () {
      final dt = parseServerDateTime('13-09-2026 04:03:20 PM');
      expect(dt, isNotNull);
      expect(dt!.year, equals(2026));
      expect(dt.month, equals(9));
      expect(dt.day, equals(13));
      expect(dt.hour, equals(16));
    });

    test('parses standard ISO 8601 string', () {
      final dt = parseServerDateTime('2026-09-13T16:03:20.000Z');
      expect(dt, isNotNull);
      expect(dt!.year, equals(2026));
    });

    test('parses 24-hour SQL timestamp string', () {
      final dt = parseServerDateTime('2026-09-13 16:03:20');
      expect(dt, isNotNull);
    });

    test('handles null, empty, or invalid input safely without throwing', () {
      expect(parseServerDateTime(null), isNull);
      expect(parseServerDateTime(''), isNull);
      expect(parseServerDateTime('   '), isNull);
      expect(parseServerDateTime('invalid-date-string'), isNull);
    });
  });

  group('safeDateTimeFromJson tests', () {
    test('parses backend string without throwing FormatException', () {
      final result = safeDateTimeFromJson('2026-09-13 04:03:20 PM');
      expect(result, isNotNull);
      expect(result!.year, equals(2026));
      expect(result.hour, equals(16));
    });

    test('returns null for null or invalid without throwing FormatException', () {
      expect(safeDateTimeFromJson(null), isNull);
      expect(safeDateTimeFromJson('bad date'), isNull);
    });
  });
}
