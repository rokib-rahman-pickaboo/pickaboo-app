// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_article_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SupportArticleResponse _$SupportArticleResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SupportArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$SupportArticleResponse {
  @JsonKey(name: "article_id")
  String? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "text")
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SupportArticleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportArticleResponseCopyWith<SupportArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportArticleResponseCopyWith<$Res> {
  factory $SupportArticleResponseCopyWith(
    SupportArticleResponse value,
    $Res Function(SupportArticleResponse) then,
  ) = _$SupportArticleResponseCopyWithImpl<$Res, SupportArticleResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  });
}

/// @nodoc
class _$SupportArticleResponseCopyWithImpl<
  $Res,
  $Val extends SupportArticleResponse
>
    implements $SupportArticleResponseCopyWith<$Res> {
  _$SupportArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = freezed,
    Object? name = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            articleId:
                freezed == articleId
                    ? _value.articleId
                    : articleId // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            text:
                freezed == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupportArticleResponseImplCopyWith<$Res>
    implements $SupportArticleResponseCopyWith<$Res> {
  factory _$$SupportArticleResponseImplCopyWith(
    _$SupportArticleResponseImpl value,
    $Res Function(_$SupportArticleResponseImpl) then,
  ) = __$$SupportArticleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "text") String? text,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  });
}

/// @nodoc
class __$$SupportArticleResponseImplCopyWithImpl<$Res>
    extends
        _$SupportArticleResponseCopyWithImpl<$Res, _$SupportArticleResponseImpl>
    implements _$$SupportArticleResponseImplCopyWith<$Res> {
  __$$SupportArticleResponseImplCopyWithImpl(
    _$SupportArticleResponseImpl _value,
    $Res Function(_$SupportArticleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = freezed,
    Object? name = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$SupportArticleResponseImpl(
        articleId:
            freezed == articleId
                ? _value.articleId
                : articleId // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        text:
            freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportArticleResponseImpl implements _SupportArticleResponse {
  const _$SupportArticleResponseImpl({
    @JsonKey(name: "article_id") this.articleId,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "text") this.text,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "updated_at") this.updatedAt,
  });

  factory _$SupportArticleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportArticleResponseImplFromJson(json);

  @override
  @JsonKey(name: "article_id")
  final String? articleId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "text")
  final String? text;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SupportArticleResponse(articleId: $articleId, name: $name, text: $text, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportArticleResponseImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, articleId, name, text, createdAt, updatedAt);

  /// Create a copy of SupportArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportArticleResponseImplCopyWith<_$SupportArticleResponseImpl>
  get copyWith =>
      __$$SupportArticleResponseImplCopyWithImpl<_$SupportArticleResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportArticleResponseImplToJson(this);
  }
}

abstract class _SupportArticleResponse implements SupportArticleResponse {
  const factory _SupportArticleResponse({
    @JsonKey(name: "article_id") final String? articleId,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "text") final String? text,
    @JsonKey(name: "created_at") final DateTime? createdAt,
    @JsonKey(name: "updated_at") final DateTime? updatedAt,
  }) = _$SupportArticleResponseImpl;

  factory _SupportArticleResponse.fromJson(Map<String, dynamic> json) =
      _$SupportArticleResponseImpl.fromJson;

  @override
  @JsonKey(name: "article_id")
  String? get articleId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "text")
  String? get text;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;

  /// Create a copy of SupportArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportArticleResponseImplCopyWith<_$SupportArticleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
