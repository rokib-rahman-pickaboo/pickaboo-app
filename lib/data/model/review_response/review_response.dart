import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

String? _toStringSafe(dynamic value) => value?.toString();

int? _toIntSafe(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return num.tryParse(value)?.toInt();
  return null;
}

double? _toDoubleSafe(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return num.tryParse(value)?.toDouble();
  return null;
}

bool? _toBoolSafe(dynamic value) {
  if (value == null) return null;
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final normalized = value.trim().toLowerCase();
    if (normalized.isEmpty) return null;
    return normalized == 'true' || normalized == '1' || normalized == 'yes';
  }
  return null;
}

List<String>? _toStringListSafe(dynamic value) {
  if (value is! List) return null;
  return value
      .where((e) => e != null)
      .map((e) => e.toString())
      .toList(growable: false);
}

DateTime? _toDateTimeSafe(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value);
  return null;
}

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    @JsonKey(name: "review_id", fromJson: _toStringSafe) String? reviewId,
    @JsonKey(name: "posted_on", fromJson: _toDateTimeSafe) DateTime? postedOn,
    @JsonKey(name: "reviwer_id", fromJson: _toStringSafe) String? reviwerId,
    @JsonKey(name: "reviwer_name", fromJson: _toStringSafe) String? reviwerName,
    @JsonKey(name: "reviwer_image", fromJson: _toStringSafe)
    String? reviwerImage,
    @JsonKey(name: "reviwer_rating", fromJson: _toDoubleSafe)
    double? reviwerRating,
    @JsonKey(name: "title", fromJson: _toStringSafe) String? title,
    @JsonKey(name: "detail", fromJson: _toStringSafe) String? detail,
    @JsonKey(name: "is_recommended", fromJson: _toStringSafe)
    String? isRecommended,
    @JsonKey(name: "images", fromJson: _toStringListSafe) List<String>? images,
    @JsonKey(name: "like_count", fromJson: _toIntSafe) int? likeCount,
    @JsonKey(name: "dislikes_count", fromJson: _toIntSafe) int? dislikesCount,
    @JsonKey(name: "do_like", fromJson: _toBoolSafe) bool? doLike,
    @JsonKey(name: "do_dislike", fromJson: _toBoolSafe) bool? doDislike,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}
