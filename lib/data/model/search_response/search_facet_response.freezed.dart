// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_facet_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SearchFacetResponse _$SearchFacetResponseFromJson(Map<String, dynamic> json) {
  return _SearchFacetResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchFacetResponse {
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_title')
  String? get defaultTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribute')
  String? get attribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'buckets')
  List<FacetBucketResponse>? get buckets => throw _privateConstructorUsedError;

  /// Serializes this SearchFacetResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchFacetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchFacetResponseCopyWith<SearchFacetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFacetResponseCopyWith<$Res> {
  factory $SearchFacetResponseCopyWith(
    SearchFacetResponse value,
    $Res Function(SearchFacetResponse) then,
  ) = _$SearchFacetResponseCopyWithImpl<$Res, SearchFacetResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'default_title') String? defaultTitle,
    @JsonKey(name: 'attribute') String? attribute,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'buckets') List<FacetBucketResponse>? buckets,
  });
}

/// @nodoc
class _$SearchFacetResponseCopyWithImpl<$Res, $Val extends SearchFacetResponse>
    implements $SearchFacetResponseCopyWith<$Res> {
  _$SearchFacetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchFacetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? defaultTitle = freezed,
    Object? attribute = freezed,
    Object? type = freezed,
    Object? buckets = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            defaultTitle:
                freezed == defaultTitle
                    ? _value.defaultTitle
                    : defaultTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            attribute:
                freezed == attribute
                    ? _value.attribute
                    : attribute // ignore: cast_nullable_to_non_nullable
                        as String?,
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String?,
            buckets:
                freezed == buckets
                    ? _value.buckets
                    : buckets // ignore: cast_nullable_to_non_nullable
                        as List<FacetBucketResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchFacetResponseImplCopyWith<$Res>
    implements $SearchFacetResponseCopyWith<$Res> {
  factory _$$SearchFacetResponseImplCopyWith(
    _$SearchFacetResponseImpl value,
    $Res Function(_$SearchFacetResponseImpl) then,
  ) = __$$SearchFacetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'default_title') String? defaultTitle,
    @JsonKey(name: 'attribute') String? attribute,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'buckets') List<FacetBucketResponse>? buckets,
  });
}

/// @nodoc
class __$$SearchFacetResponseImplCopyWithImpl<$Res>
    extends _$SearchFacetResponseCopyWithImpl<$Res, _$SearchFacetResponseImpl>
    implements _$$SearchFacetResponseImplCopyWith<$Res> {
  __$$SearchFacetResponseImplCopyWithImpl(
    _$SearchFacetResponseImpl _value,
    $Res Function(_$SearchFacetResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchFacetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? defaultTitle = freezed,
    Object? attribute = freezed,
    Object? type = freezed,
    Object? buckets = freezed,
  }) {
    return _then(
      _$SearchFacetResponseImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        defaultTitle:
            freezed == defaultTitle
                ? _value.defaultTitle
                : defaultTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        attribute:
            freezed == attribute
                ? _value.attribute
                : attribute // ignore: cast_nullable_to_non_nullable
                    as String?,
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String?,
        buckets:
            freezed == buckets
                ? _value._buckets
                : buckets // ignore: cast_nullable_to_non_nullable
                    as List<FacetBucketResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchFacetResponseImpl implements _SearchFacetResponse {
  const _$SearchFacetResponseImpl({
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'default_title') this.defaultTitle,
    @JsonKey(name: 'attribute') this.attribute,
    @JsonKey(name: 'type') this.type,
    @JsonKey(name: 'buckets') final List<FacetBucketResponse>? buckets,
  }) : _buckets = buckets;

  factory _$SearchFacetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchFacetResponseImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'default_title')
  final String? defaultTitle;
  @override
  @JsonKey(name: 'attribute')
  final String? attribute;
  @override
  @JsonKey(name: 'type')
  final String? type;
  final List<FacetBucketResponse>? _buckets;
  @override
  @JsonKey(name: 'buckets')
  List<FacetBucketResponse>? get buckets {
    final value = _buckets;
    if (value == null) return null;
    if (_buckets is EqualUnmodifiableListView) return _buckets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchFacetResponse(title: $title, defaultTitle: $defaultTitle, attribute: $attribute, type: $type, buckets: $buckets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFacetResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.defaultTitle, defaultTitle) ||
                other.defaultTitle == defaultTitle) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._buckets, _buckets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    defaultTitle,
    attribute,
    type,
    const DeepCollectionEquality().hash(_buckets),
  );

  /// Create a copy of SearchFacetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFacetResponseImplCopyWith<_$SearchFacetResponseImpl> get copyWith =>
      __$$SearchFacetResponseImplCopyWithImpl<_$SearchFacetResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchFacetResponseImplToJson(this);
  }
}

abstract class _SearchFacetResponse implements SearchFacetResponse {
  const factory _SearchFacetResponse({
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'default_title') final String? defaultTitle,
    @JsonKey(name: 'attribute') final String? attribute,
    @JsonKey(name: 'type') final String? type,
    @JsonKey(name: 'buckets') final List<FacetBucketResponse>? buckets,
  }) = _$SearchFacetResponseImpl;

  factory _SearchFacetResponse.fromJson(Map<String, dynamic> json) =
      _$SearchFacetResponseImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'default_title')
  String? get defaultTitle;
  @override
  @JsonKey(name: 'attribute')
  String? get attribute;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'buckets')
  List<FacetBucketResponse>? get buckets;

  /// Create a copy of SearchFacetResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFacetResponseImplCopyWith<_$SearchFacetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FacetBucketResponse _$FacetBucketResponseFromJson(Map<String, dynamic> json) {
  return _FacetBucketResponse.fromJson(json);
}

/// @nodoc
mixin _$FacetBucketResponse {
  @JsonKey(name: 'value')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this FacetBucketResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FacetBucketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacetBucketResponseCopyWith<FacetBucketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacetBucketResponseCopyWith<$Res> {
  factory $FacetBucketResponseCopyWith(
    FacetBucketResponse value,
    $Res Function(FacetBucketResponse) then,
  ) = _$FacetBucketResponseCopyWithImpl<$Res, FacetBucketResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'count') int? count,
  });
}

/// @nodoc
class _$FacetBucketResponseCopyWithImpl<$Res, $Val extends FacetBucketResponse>
    implements $FacetBucketResponseCopyWith<$Res> {
  _$FacetBucketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacetBucketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = freezed, Object? count = freezed}) {
    return _then(
      _value.copyWith(
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
            count:
                freezed == count
                    ? _value.count
                    : count // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacetBucketResponseImplCopyWith<$Res>
    implements $FacetBucketResponseCopyWith<$Res> {
  factory _$$FacetBucketResponseImplCopyWith(
    _$FacetBucketResponseImpl value,
    $Res Function(_$FacetBucketResponseImpl) then,
  ) = __$$FacetBucketResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'count') int? count,
  });
}

/// @nodoc
class __$$FacetBucketResponseImplCopyWithImpl<$Res>
    extends _$FacetBucketResponseCopyWithImpl<$Res, _$FacetBucketResponseImpl>
    implements _$$FacetBucketResponseImplCopyWith<$Res> {
  __$$FacetBucketResponseImplCopyWithImpl(
    _$FacetBucketResponseImpl _value,
    $Res Function(_$FacetBucketResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacetBucketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = freezed, Object? count = freezed}) {
    return _then(
      _$FacetBucketResponseImpl(
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
        count:
            freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FacetBucketResponseImpl implements _FacetBucketResponse {
  const _$FacetBucketResponseImpl({
    @JsonKey(name: 'value') this.value,
    @JsonKey(name: 'count') this.count,
  });

  factory _$FacetBucketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacetBucketResponseImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final String? value;
  @override
  @JsonKey(name: 'count')
  final int? count;

  @override
  String toString() {
    return 'FacetBucketResponse(value: $value, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacetBucketResponseImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, count);

  /// Create a copy of FacetBucketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacetBucketResponseImplCopyWith<_$FacetBucketResponseImpl> get copyWith =>
      __$$FacetBucketResponseImplCopyWithImpl<_$FacetBucketResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FacetBucketResponseImplToJson(this);
  }
}

abstract class _FacetBucketResponse implements FacetBucketResponse {
  const factory _FacetBucketResponse({
    @JsonKey(name: 'value') final String? value,
    @JsonKey(name: 'count') final int? count,
  }) = _$FacetBucketResponseImpl;

  factory _FacetBucketResponse.fromJson(Map<String, dynamic> json) =
      _$FacetBucketResponseImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  String? get value;
  @override
  @JsonKey(name: 'count')
  int? get count;

  /// Create a copy of FacetBucketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacetBucketResponseImplCopyWith<_$FacetBucketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
