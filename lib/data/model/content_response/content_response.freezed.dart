// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContentResponse _$ContentResponseFromJson(Map<String, dynamic> json) {
  return _ContentResponse.fromJson(json);
}

/// @nodoc
mixin _$ContentResponse {
  @JsonKey(name: "page_id")
  String? get pageId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "page_layout")
  String? get pageLayout => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_keywords")
  String? get metaKeywords => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_description")
  String? get metaDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "identifier")
  String? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: "content_heading")
  String? get contentHeading => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time")
  DateTime? get creationTime => throw _privateConstructorUsedError;
  @JsonKey(name: "update_time")
  DateTime? get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  String? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order")
  String? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: "meta_title")
  String? get metaTitle => throw _privateConstructorUsedError;

  /// Serializes this ContentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentResponseCopyWith<ContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResponseCopyWith<$Res> {
  factory $ContentResponseCopyWith(
    ContentResponse value,
    $Res Function(ContentResponse) then,
  ) = _$ContentResponseCopyWithImpl<$Res, ContentResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "page_id") String? pageId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "page_layout") String? pageLayout,
    @JsonKey(name: "meta_keywords") String? metaKeywords,
    @JsonKey(name: "meta_description") String? metaDescription,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "content_heading") String? contentHeading,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "creation_time") DateTime? creationTime,
    @JsonKey(name: "update_time") DateTime? updateTime,
    @JsonKey(name: "is_active") String? isActive,
    @JsonKey(name: "sort_order") String? sortOrder,
    @JsonKey(name: "meta_title") String? metaTitle,
  });
}

/// @nodoc
class _$ContentResponseCopyWithImpl<$Res, $Val extends ContentResponse>
    implements $ContentResponseCopyWith<$Res> {
  _$ContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageId = freezed,
    Object? title = freezed,
    Object? pageLayout = freezed,
    Object? metaKeywords = freezed,
    Object? metaDescription = freezed,
    Object? identifier = freezed,
    Object? contentHeading = freezed,
    Object? content = freezed,
    Object? creationTime = freezed,
    Object? updateTime = freezed,
    Object? isActive = freezed,
    Object? sortOrder = freezed,
    Object? metaTitle = freezed,
  }) {
    return _then(
      _value.copyWith(
            pageId:
                freezed == pageId
                    ? _value.pageId
                    : pageId // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            pageLayout:
                freezed == pageLayout
                    ? _value.pageLayout
                    : pageLayout // ignore: cast_nullable_to_non_nullable
                        as String?,
            metaKeywords:
                freezed == metaKeywords
                    ? _value.metaKeywords
                    : metaKeywords // ignore: cast_nullable_to_non_nullable
                        as String?,
            metaDescription:
                freezed == metaDescription
                    ? _value.metaDescription
                    : metaDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            identifier:
                freezed == identifier
                    ? _value.identifier
                    : identifier // ignore: cast_nullable_to_non_nullable
                        as String?,
            contentHeading:
                freezed == contentHeading
                    ? _value.contentHeading
                    : contentHeading // ignore: cast_nullable_to_non_nullable
                        as String?,
            content:
                freezed == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String?,
            creationTime:
                freezed == creationTime
                    ? _value.creationTime
                    : creationTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updateTime:
                freezed == updateTime
                    ? _value.updateTime
                    : updateTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            isActive:
                freezed == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as String?,
            sortOrder:
                freezed == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as String?,
            metaTitle:
                freezed == metaTitle
                    ? _value.metaTitle
                    : metaTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContentResponseImplCopyWith<$Res>
    implements $ContentResponseCopyWith<$Res> {
  factory _$$ContentResponseImplCopyWith(
    _$ContentResponseImpl value,
    $Res Function(_$ContentResponseImpl) then,
  ) = __$$ContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "page_id") String? pageId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "page_layout") String? pageLayout,
    @JsonKey(name: "meta_keywords") String? metaKeywords,
    @JsonKey(name: "meta_description") String? metaDescription,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "content_heading") String? contentHeading,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "creation_time") DateTime? creationTime,
    @JsonKey(name: "update_time") DateTime? updateTime,
    @JsonKey(name: "is_active") String? isActive,
    @JsonKey(name: "sort_order") String? sortOrder,
    @JsonKey(name: "meta_title") String? metaTitle,
  });
}

/// @nodoc
class __$$ContentResponseImplCopyWithImpl<$Res>
    extends _$ContentResponseCopyWithImpl<$Res, _$ContentResponseImpl>
    implements _$$ContentResponseImplCopyWith<$Res> {
  __$$ContentResponseImplCopyWithImpl(
    _$ContentResponseImpl _value,
    $Res Function(_$ContentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageId = freezed,
    Object? title = freezed,
    Object? pageLayout = freezed,
    Object? metaKeywords = freezed,
    Object? metaDescription = freezed,
    Object? identifier = freezed,
    Object? contentHeading = freezed,
    Object? content = freezed,
    Object? creationTime = freezed,
    Object? updateTime = freezed,
    Object? isActive = freezed,
    Object? sortOrder = freezed,
    Object? metaTitle = freezed,
  }) {
    return _then(
      _$ContentResponseImpl(
        pageId:
            freezed == pageId
                ? _value.pageId
                : pageId // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        pageLayout:
            freezed == pageLayout
                ? _value.pageLayout
                : pageLayout // ignore: cast_nullable_to_non_nullable
                    as String?,
        metaKeywords:
            freezed == metaKeywords
                ? _value.metaKeywords
                : metaKeywords // ignore: cast_nullable_to_non_nullable
                    as String?,
        metaDescription:
            freezed == metaDescription
                ? _value.metaDescription
                : metaDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        identifier:
            freezed == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                    as String?,
        contentHeading:
            freezed == contentHeading
                ? _value.contentHeading
                : contentHeading // ignore: cast_nullable_to_non_nullable
                    as String?,
        content:
            freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String?,
        creationTime:
            freezed == creationTime
                ? _value.creationTime
                : creationTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updateTime:
            freezed == updateTime
                ? _value.updateTime
                : updateTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        isActive:
            freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as String?,
        sortOrder:
            freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as String?,
        metaTitle:
            freezed == metaTitle
                ? _value.metaTitle
                : metaTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentResponseImpl implements _ContentResponse {
  const _$ContentResponseImpl({
    @JsonKey(name: "page_id") this.pageId,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "page_layout") this.pageLayout,
    @JsonKey(name: "meta_keywords") this.metaKeywords,
    @JsonKey(name: "meta_description") this.metaDescription,
    @JsonKey(name: "identifier") this.identifier,
    @JsonKey(name: "content_heading") this.contentHeading,
    @JsonKey(name: "content") this.content,
    @JsonKey(name: "creation_time") this.creationTime,
    @JsonKey(name: "update_time") this.updateTime,
    @JsonKey(name: "is_active") this.isActive,
    @JsonKey(name: "sort_order") this.sortOrder,
    @JsonKey(name: "meta_title") this.metaTitle,
  });

  factory _$ContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentResponseImplFromJson(json);

  @override
  @JsonKey(name: "page_id")
  final String? pageId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "page_layout")
  final String? pageLayout;
  @override
  @JsonKey(name: "meta_keywords")
  final String? metaKeywords;
  @override
  @JsonKey(name: "meta_description")
  final String? metaDescription;
  @override
  @JsonKey(name: "identifier")
  final String? identifier;
  @override
  @JsonKey(name: "content_heading")
  final String? contentHeading;
  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "creation_time")
  final DateTime? creationTime;
  @override
  @JsonKey(name: "update_time")
  final DateTime? updateTime;
  @override
  @JsonKey(name: "is_active")
  final String? isActive;
  @override
  @JsonKey(name: "sort_order")
  final String? sortOrder;
  @override
  @JsonKey(name: "meta_title")
  final String? metaTitle;

  @override
  String toString() {
    return 'ContentResponse(pageId: $pageId, title: $title, pageLayout: $pageLayout, metaKeywords: $metaKeywords, metaDescription: $metaDescription, identifier: $identifier, contentHeading: $contentHeading, content: $content, creationTime: $creationTime, updateTime: $updateTime, isActive: $isActive, sortOrder: $sortOrder, metaTitle: $metaTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentResponseImpl &&
            (identical(other.pageId, pageId) || other.pageId == pageId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.pageLayout, pageLayout) ||
                other.pageLayout == pageLayout) &&
            (identical(other.metaKeywords, metaKeywords) ||
                other.metaKeywords == metaKeywords) &&
            (identical(other.metaDescription, metaDescription) ||
                other.metaDescription == metaDescription) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.contentHeading, contentHeading) ||
                other.contentHeading == contentHeading) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pageId,
    title,
    pageLayout,
    metaKeywords,
    metaDescription,
    identifier,
    contentHeading,
    content,
    creationTime,
    updateTime,
    isActive,
    sortOrder,
    metaTitle,
  );

  /// Create a copy of ContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentResponseImplCopyWith<_$ContentResponseImpl> get copyWith =>
      __$$ContentResponseImplCopyWithImpl<_$ContentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentResponseImplToJson(this);
  }
}

abstract class _ContentResponse implements ContentResponse {
  const factory _ContentResponse({
    @JsonKey(name: "page_id") final String? pageId,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "page_layout") final String? pageLayout,
    @JsonKey(name: "meta_keywords") final String? metaKeywords,
    @JsonKey(name: "meta_description") final String? metaDescription,
    @JsonKey(name: "identifier") final String? identifier,
    @JsonKey(name: "content_heading") final String? contentHeading,
    @JsonKey(name: "content") final String? content,
    @JsonKey(name: "creation_time") final DateTime? creationTime,
    @JsonKey(name: "update_time") final DateTime? updateTime,
    @JsonKey(name: "is_active") final String? isActive,
    @JsonKey(name: "sort_order") final String? sortOrder,
    @JsonKey(name: "meta_title") final String? metaTitle,
  }) = _$ContentResponseImpl;

  factory _ContentResponse.fromJson(Map<String, dynamic> json) =
      _$ContentResponseImpl.fromJson;

  @override
  @JsonKey(name: "page_id")
  String? get pageId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "page_layout")
  String? get pageLayout;
  @override
  @JsonKey(name: "meta_keywords")
  String? get metaKeywords;
  @override
  @JsonKey(name: "meta_description")
  String? get metaDescription;
  @override
  @JsonKey(name: "identifier")
  String? get identifier;
  @override
  @JsonKey(name: "content_heading")
  String? get contentHeading;
  @override
  @JsonKey(name: "content")
  String? get content;
  @override
  @JsonKey(name: "creation_time")
  DateTime? get creationTime;
  @override
  @JsonKey(name: "update_time")
  DateTime? get updateTime;
  @override
  @JsonKey(name: "is_active")
  String? get isActive;
  @override
  @JsonKey(name: "sort_order")
  String? get sortOrder;
  @override
  @JsonKey(name: "meta_title")
  String? get metaTitle;

  /// Create a copy of ContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentResponseImplCopyWith<_$ContentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
