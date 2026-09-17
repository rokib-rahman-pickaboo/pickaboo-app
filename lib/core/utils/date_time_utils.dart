import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

/// Top-level deserializer function for `@JsonKey(fromJson: safeDateTimeFromJson)`.
DateTime? safeDateTimeFromJson(Object? json) => parseServerDateTime(json);

/// Top-level serializer function for `@JsonKey(toJson: safeDateTimeToJson)`.
String? safeDateTimeToJson(DateTime? date) => date?.toIso8601String();

/// Universal JsonConverter for Freezed / JsonSerializable models to prevent
/// FormatException crashes when backend changes datetime formatting (e.g. AM/PM).
class SafeDateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const SafeDateTimeConverter();

  @override
  DateTime? fromJson(Object? json) => parseServerDateTime(json);

  @override
  Object? toJson(DateTime? value) => value?.toIso8601String();
}

/// Parses server datetime strings robustly across multiple formats:
/// - ISO 8601: e.g. "2026-09-13T16:03:20Z", "2026-09-13 16:03:20"
/// - 12-hour AM/PM: e.g. "2026-09-13 04:03:20 PM", "2026-09-13 04:03:20 AM", "2026-09-13 4:03 PM"
/// - Date only: e.g. "2026-09-13"
/// - Slash/hyphen variations: "dd-MM-yyyy", "yyyy/MM/dd", "dd/MM/yyyy"
/// - Timestamps: Unix epoch milliseconds
DateTime? parseServerDateTime(dynamic raw) {
  if (raw == null) return null;
  if (raw is DateTime) return raw.toLocal();
  if (raw is int) return DateTime.fromMillisecondsSinceEpoch(raw).toLocal();

  final str = raw.toString().trim();
  if (str.isEmpty) return null;

  // 1. Try standard ISO-8601 parser first
  final isoParsed = DateTime.tryParse(str);
  if (isoParsed != null) {
    if (isoParsed.isUtc) return isoParsed.toLocal();
    // For ISO dates without timezone indicator, Magento stores in UTC:
    if (!str.endsWith('Z') &&
        !str.contains('+') &&
        !RegExp(r'-\d{2}:\d{2}$').hasMatch(str)) {
      return DateTime.utc(
        isoParsed.year,
        isoParsed.month,
        isoParsed.day,
        isoParsed.hour,
        isoParsed.minute,
        isoParsed.second,
        isoParsed.millisecond,
      ).toLocal();
    }
    return isoParsed.toLocal();
  }

  // 2. Pattern 1: yyyy-MM-dd or yyyy/MM/dd with optional time and AM/PM
  // e.g. "2026-09-13 04:03:20 PM", "2026-09-13 4:03 PM", "2026/09/13 04:03:20 PM"
  final ymdMatch = RegExp(
    r'^(\d{4})[-/](\d{1,2})[-/](\d{1,2})(?:[\sT]+(\d{1,2}):(\d{1,2})(?::(\d{1,2}))?(?:\.\d+)?)?\s*(AM|PM|am|pm)?$',
  ).firstMatch(str);

  if (ymdMatch != null) {
    final year = int.parse(ymdMatch.group(1)!);
    final month = int.parse(ymdMatch.group(2)!);
    final day = int.parse(ymdMatch.group(3)!);
    var hour = ymdMatch.group(4) != null ? int.parse(ymdMatch.group(4)!) : 0;
    final minute = ymdMatch.group(5) != null ? int.parse(ymdMatch.group(5)!) : 0;
    final second = ymdMatch.group(6) != null ? int.parse(ymdMatch.group(6)!) : 0;
    final ampm = ymdMatch.group(7)?.toUpperCase();

    if (ampm == 'PM' && hour < 12) {
      hour += 12;
    } else if (ampm == 'AM' && hour == 12) {
      hour = 0;
    }

    return DateTime(year, month, day, hour, minute, second);
  }

  // 3. Pattern 2: dd-MM-yyyy or dd/MM/yyyy with optional time and AM/PM
  // e.g. "13-09-2026 04:03:20 PM", "13/09/2026 04:03 PM"
  final dmyMatch = RegExp(
    r'^(\d{1,2})[-/](\d{1,2})[-/](\d{4})(?:[\sT]+(\d{1,2}):(\d{1,2})(?::(\d{1,2}))?(?:\.\d+)?)?\s*(AM|PM|am|pm)?$',
  ).firstMatch(str);

  if (dmyMatch != null) {
    final day = int.parse(dmyMatch.group(1)!);
    final month = int.parse(dmyMatch.group(2)!);
    final year = int.parse(dmyMatch.group(3)!);
    var hour = dmyMatch.group(4) != null ? int.parse(dmyMatch.group(4)!) : 0;
    final minute = dmyMatch.group(5) != null ? int.parse(dmyMatch.group(5)!) : 0;
    final second = dmyMatch.group(6) != null ? int.parse(dmyMatch.group(6)!) : 0;
    final ampm = dmyMatch.group(7)?.toUpperCase();

    if (ampm == 'PM' && hour < 12) {
      hour += 12;
    } else if (ampm == 'AM' && hour == 12) {
      hour = 0;
    }

    return DateTime(year, month, day, hour, minute, second);
  }

  // 4. Fallback to DateFormat parsing for textual months
  final fallbackFormats = [
    'MMM dd, yyyy - hh:mm a',
    'dd MMMM yyyy, hh:mm a',
    'MMM dd, yyyy hh:mm:ss a',
    'MM/dd/yyyy hh:mm:ss a',
    'MM/dd/yyyy h:mm:ss a',
    'MM/dd/yyyy hh:mm a',
    'MM/dd/yyyy h:mm a',
  ];
  for (final pattern in fallbackFormats) {
    try {
      return DateFormat(pattern).parseLoose(str);
    } catch (_) {}
  }

  return null;
}

