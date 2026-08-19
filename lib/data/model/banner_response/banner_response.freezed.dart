// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) {
  return _BannerResponse.fromJson(json);
}

/// @nodoc
mixin _$BannerResponse {
  @JsonKey(name: "entity_id", fromJson: _toIntSafe)
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "title", fromJson: _toStringSafe)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "image", fromJson: _toStringSafe)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url", fromJson: _toStringSafe)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
  String? get responsiveImage => throw _privateConstructorUsedError;
  @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
  String? get responsiveImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "link", fromJson: _toStringSafe)
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "link_type", fromJson: _toStringSafe)
  String? get linkType => throw _privateConstructorUsedError;
  @JsonKey(name: "link_value", fromJson: _toStringSafe)
  String? get linkValue => throw _privateConstructorUsedError;
  @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
  String? get resolvedLink => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active", fromJson: _toStringSafe)
  String? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "identifier", fromJson: _toStringSafe)
  String? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_category", fromJson: _toStringSafe)
  String? get isCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order", fromJson: _toIntSafe)
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: "column_count", fromJson: _toIntSafe)
  int? get columnCount => throw _privateConstructorUsedError;
  @JsonKey(name: "image_position", fromJson: _toStringSafe)
  String? get imagePosition => throw _privateConstructorUsedError;
  @JsonKey(name: "for_homepage", fromJson: _toStringSafe)
  String? get forHomepage => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  Category? get category => throw _privateConstructorUsedError;

  /// Serializes this BannerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerResponseCopyWith<BannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerResponseCopyWith<$Res> {
  factory $BannerResponseCopyWith(
    BannerResponse value,
    $Res Function(BannerResponse) then,
  ) = _$BannerResponseCopyWithImpl<$Res, BannerResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id", fromJson: _toIntSafe) int? entityId,
    @JsonKey(name: "title", fromJson: _toStringSafe) String? title,
    @JsonKey(name: "image", fromJson: _toStringSafe) String? image,
    @JsonKey(name: "image_url", fromJson: _toStringSafe) String? imageUrl,
    @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
    String? responsiveImage,
    @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
    String? responsiveImageUrl,
    @JsonKey(name: "link", fromJson: _toStringSafe) String? link,
    @JsonKey(name: "link_type", fromJson: _toStringSafe) String? linkType,
    @JsonKey(name: "link_value", fromJson: _toStringSafe) String? linkValue,
    @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
    String? resolvedLink,
    @JsonKey(name: "is_active", fromJson: _toStringSafe) String? isActive,
    @JsonKey(name: "identifier", fromJson: _toStringSafe) String? identifier,
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "is_category", fromJson: _toStringSafe) String? isCategory,
    @JsonKey(name: "sort_order", fromJson: _toIntSafe) int? sortOrder,
    @JsonKey(name: "column_count", fromJson: _toIntSafe) int? columnCount,
    @JsonKey(name: "image_position", fromJson: _toStringSafe)
    String? imagePosition,
    @JsonKey(name: "for_homepage", fromJson: _toStringSafe) String? forHomepage,
    @JsonKey(name: "category") Category? category,
  });

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$BannerResponseCopyWithImpl<$Res, $Val extends BannerResponse>
    implements $BannerResponseCopyWith<$Res> {
  _$BannerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? responsiveImage = freezed,
    Object? responsiveImageUrl = freezed,
    Object? link = freezed,
    Object? linkType = freezed,
    Object? linkValue = freezed,
    Object? resolvedLink = freezed,
    Object? isActive = freezed,
    Object? identifier = freezed,
    Object? categoryId = freezed,
    Object? isCategory = freezed,
    Object? sortOrder = freezed,
    Object? columnCount = freezed,
    Object? imagePosition = freezed,
    Object? forHomepage = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _value.copyWith(
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            responsiveImage:
                freezed == responsiveImage
                    ? _value.responsiveImage
                    : responsiveImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            responsiveImageUrl:
                freezed == responsiveImageUrl
                    ? _value.responsiveImageUrl
                    : responsiveImageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            link:
                freezed == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String?,
            linkType:
                freezed == linkType
                    ? _value.linkType
                    : linkType // ignore: cast_nullable_to_non_nullable
                        as String?,
            linkValue:
                freezed == linkValue
                    ? _value.linkValue
                    : linkValue // ignore: cast_nullable_to_non_nullable
                        as String?,
            resolvedLink:
                freezed == resolvedLink
                    ? _value.resolvedLink
                    : resolvedLink // ignore: cast_nullable_to_non_nullable
                        as String?,
            isActive:
                freezed == isActive
                    ? _value.isActive
                    : isActive // ignore: cast_nullable_to_non_nullable
                        as String?,
            identifier:
                freezed == identifier
                    ? _value.identifier
                    : identifier // ignore: cast_nullable_to_non_nullable
                        as String?,
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as int?,
            isCategory:
                freezed == isCategory
                    ? _value.isCategory
                    : isCategory // ignore: cast_nullable_to_non_nullable
                        as String?,
            sortOrder:
                freezed == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as int?,
            columnCount:
                freezed == columnCount
                    ? _value.columnCount
                    : columnCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            imagePosition:
                freezed == imagePosition
                    ? _value.imagePosition
                    : imagePosition // ignore: cast_nullable_to_non_nullable
                        as String?,
            forHomepage:
                freezed == forHomepage
                    ? _value.forHomepage
                    : forHomepage // ignore: cast_nullable_to_non_nullable
                        as String?,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category?,
          )
          as $Val,
    );
  }

  /// Create a copy of BannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BannerResponseImplCopyWith<$Res>
    implements $BannerResponseCopyWith<$Res> {
  factory _$$BannerResponseImplCopyWith(
    _$BannerResponseImpl value,
    $Res Function(_$BannerResponseImpl) then,
  ) = __$$BannerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id", fromJson: _toIntSafe) int? entityId,
    @JsonKey(name: "title", fromJson: _toStringSafe) String? title,
    @JsonKey(name: "image", fromJson: _toStringSafe) String? image,
    @JsonKey(name: "image_url", fromJson: _toStringSafe) String? imageUrl,
    @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
    String? responsiveImage,
    @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
    String? responsiveImageUrl,
    @JsonKey(name: "link", fromJson: _toStringSafe) String? link,
    @JsonKey(name: "link_type", fromJson: _toStringSafe) String? linkType,
    @JsonKey(name: "link_value", fromJson: _toStringSafe) String? linkValue,
    @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
    String? resolvedLink,
    @JsonKey(name: "is_active", fromJson: _toStringSafe) String? isActive,
    @JsonKey(name: "identifier", fromJson: _toStringSafe) String? identifier,
    @JsonKey(name: "category_id", fromJson: _toIntSafe) int? categoryId,
    @JsonKey(name: "is_category", fromJson: _toStringSafe) String? isCategory,
    @JsonKey(name: "sort_order", fromJson: _toIntSafe) int? sortOrder,
    @JsonKey(name: "column_count", fromJson: _toIntSafe) int? columnCount,
    @JsonKey(name: "image_position", fromJson: _toStringSafe)
    String? imagePosition,
    @JsonKey(name: "for_homepage", fromJson: _toStringSafe) String? forHomepage,
    @JsonKey(name: "category") Category? category,
  });

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$BannerResponseImplCopyWithImpl<$Res>
    extends _$BannerResponseCopyWithImpl<$Res, _$BannerResponseImpl>
    implements _$$BannerResponseImplCopyWith<$Res> {
  __$$BannerResponseImplCopyWithImpl(
    _$BannerResponseImpl _value,
    $Res Function(_$BannerResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? responsiveImage = freezed,
    Object? responsiveImageUrl = freezed,
    Object? link = freezed,
    Object? linkType = freezed,
    Object? linkValue = freezed,
    Object? resolvedLink = freezed,
    Object? isActive = freezed,
    Object? identifier = freezed,
    Object? categoryId = freezed,
    Object? isCategory = freezed,
    Object? sortOrder = freezed,
    Object? columnCount = freezed,
    Object? imagePosition = freezed,
    Object? forHomepage = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _$BannerResponseImpl(
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        responsiveImage:
            freezed == responsiveImage
                ? _value.responsiveImage
                : responsiveImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        responsiveImageUrl:
            freezed == responsiveImageUrl
                ? _value.responsiveImageUrl
                : responsiveImageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        link:
            freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String?,
        linkType:
            freezed == linkType
                ? _value.linkType
                : linkType // ignore: cast_nullable_to_non_nullable
                    as String?,
        linkValue:
            freezed == linkValue
                ? _value.linkValue
                : linkValue // ignore: cast_nullable_to_non_nullable
                    as String?,
        resolvedLink:
            freezed == resolvedLink
                ? _value.resolvedLink
                : resolvedLink // ignore: cast_nullable_to_non_nullable
                    as String?,
        isActive:
            freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                    as String?,
        identifier:
            freezed == identifier
                ? _value.identifier
                : identifier // ignore: cast_nullable_to_non_nullable
                    as String?,
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as int?,
        isCategory:
            freezed == isCategory
                ? _value.isCategory
                : isCategory // ignore: cast_nullable_to_non_nullable
                    as String?,
        sortOrder:
            freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as int?,
        columnCount:
            freezed == columnCount
                ? _value.columnCount
                : columnCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        imagePosition:
            freezed == imagePosition
                ? _value.imagePosition
                : imagePosition // ignore: cast_nullable_to_non_nullable
                    as String?,
        forHomepage:
            freezed == forHomepage
                ? _value.forHomepage
                : forHomepage // ignore: cast_nullable_to_non_nullable
                    as String?,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerResponseImpl implements _BannerResponse {
  const _$BannerResponseImpl({
    @JsonKey(name: "entity_id", fromJson: _toIntSafe) this.entityId,
    @JsonKey(name: "title", fromJson: _toStringSafe) this.title,
    @JsonKey(name: "image", fromJson: _toStringSafe) this.image,
    @JsonKey(name: "image_url", fromJson: _toStringSafe) this.imageUrl,
    @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
    this.responsiveImage,
    @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
    this.responsiveImageUrl,
    @JsonKey(name: "link", fromJson: _toStringSafe) this.link,
    @JsonKey(name: "link_type", fromJson: _toStringSafe) this.linkType,
    @JsonKey(name: "link_value", fromJson: _toStringSafe) this.linkValue,
    @JsonKey(name: "resolved_link", fromJson: _toStringSafe) this.resolvedLink,
    @JsonKey(name: "is_active", fromJson: _toStringSafe) this.isActive,
    @JsonKey(name: "identifier", fromJson: _toStringSafe) this.identifier,
    @JsonKey(name: "category_id", fromJson: _toIntSafe) this.categoryId,
    @JsonKey(name: "is_category", fromJson: _toStringSafe) this.isCategory,
    @JsonKey(name: "sort_order", fromJson: _toIntSafe) this.sortOrder,
    @JsonKey(name: "column_count", fromJson: _toIntSafe) this.columnCount,
    @JsonKey(name: "image_position", fromJson: _toStringSafe)
    this.imagePosition,
    @JsonKey(name: "for_homepage", fromJson: _toStringSafe) this.forHomepage,
    @JsonKey(name: "category") this.category,
  });

  factory _$BannerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerResponseImplFromJson(json);

  @override
  @JsonKey(name: "entity_id", fromJson: _toIntSafe)
  final int? entityId;
  @override
  @JsonKey(name: "title", fromJson: _toStringSafe)
  final String? title;
  @override
  @JsonKey(name: "image", fromJson: _toStringSafe)
  final String? image;
  @override
  @JsonKey(name: "image_url", fromJson: _toStringSafe)
  final String? imageUrl;
  @override
  @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
  final String? responsiveImage;
  @override
  @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
  final String? responsiveImageUrl;
  @override
  @JsonKey(name: "link", fromJson: _toStringSafe)
  final String? link;
  @override
  @JsonKey(name: "link_type", fromJson: _toStringSafe)
  final String? linkType;
  @override
  @JsonKey(name: "link_value", fromJson: _toStringSafe)
  final String? linkValue;
  @override
  @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
  final String? resolvedLink;
  @override
  @JsonKey(name: "is_active", fromJson: _toStringSafe)
  final String? isActive;
  @override
  @JsonKey(name: "identifier", fromJson: _toStringSafe)
  final String? identifier;
  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  final int? categoryId;
  @override
  @JsonKey(name: "is_category", fromJson: _toStringSafe)
  final String? isCategory;
  @override
  @JsonKey(name: "sort_order", fromJson: _toIntSafe)
  final int? sortOrder;
  @override
  @JsonKey(name: "column_count", fromJson: _toIntSafe)
  final int? columnCount;
  @override
  @JsonKey(name: "image_position", fromJson: _toStringSafe)
  final String? imagePosition;
  @override
  @JsonKey(name: "for_homepage", fromJson: _toStringSafe)
  final String? forHomepage;
  @override
  @JsonKey(name: "category")
  final Category? category;

  @override
  String toString() {
    return 'BannerResponse(entityId: $entityId, title: $title, image: $image, imageUrl: $imageUrl, responsiveImage: $responsiveImage, responsiveImageUrl: $responsiveImageUrl, link: $link, linkType: $linkType, linkValue: $linkValue, resolvedLink: $resolvedLink, isActive: $isActive, identifier: $identifier, categoryId: $categoryId, isCategory: $isCategory, sortOrder: $sortOrder, columnCount: $columnCount, imagePosition: $imagePosition, forHomepage: $forHomepage, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerResponseImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.responsiveImage, responsiveImage) ||
                other.responsiveImage == responsiveImage) &&
            (identical(other.responsiveImageUrl, responsiveImageUrl) ||
                other.responsiveImageUrl == responsiveImageUrl) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.linkValue, linkValue) ||
                other.linkValue == linkValue) &&
            (identical(other.resolvedLink, resolvedLink) ||
                other.resolvedLink == resolvedLink) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isCategory, isCategory) ||
                other.isCategory == isCategory) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.columnCount, columnCount) ||
                other.columnCount == columnCount) &&
            (identical(other.imagePosition, imagePosition) ||
                other.imagePosition == imagePosition) &&
            (identical(other.forHomepage, forHomepage) ||
                other.forHomepage == forHomepage) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    entityId,
    title,
    image,
    imageUrl,
    responsiveImage,
    responsiveImageUrl,
    link,
    linkType,
    linkValue,
    resolvedLink,
    isActive,
    identifier,
    categoryId,
    isCategory,
    sortOrder,
    columnCount,
    imagePosition,
    forHomepage,
    category,
  ]);

  /// Create a copy of BannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerResponseImplCopyWith<_$BannerResponseImpl> get copyWith =>
      __$$BannerResponseImplCopyWithImpl<_$BannerResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerResponseImplToJson(this);
  }
}

abstract class _BannerResponse implements BannerResponse {
  const factory _BannerResponse({
    @JsonKey(name: "entity_id", fromJson: _toIntSafe) final int? entityId,
    @JsonKey(name: "title", fromJson: _toStringSafe) final String? title,
    @JsonKey(name: "image", fromJson: _toStringSafe) final String? image,
    @JsonKey(name: "image_url", fromJson: _toStringSafe) final String? imageUrl,
    @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
    final String? responsiveImage,
    @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
    final String? responsiveImageUrl,
    @JsonKey(name: "link", fromJson: _toStringSafe) final String? link,
    @JsonKey(name: "link_type", fromJson: _toStringSafe) final String? linkType,
    @JsonKey(name: "link_value", fromJson: _toStringSafe)
    final String? linkValue,
    @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
    final String? resolvedLink,
    @JsonKey(name: "is_active", fromJson: _toStringSafe) final String? isActive,
    @JsonKey(name: "identifier", fromJson: _toStringSafe)
    final String? identifier,
    @JsonKey(name: "category_id", fromJson: _toIntSafe) final int? categoryId,
    @JsonKey(name: "is_category", fromJson: _toStringSafe)
    final String? isCategory,
    @JsonKey(name: "sort_order", fromJson: _toIntSafe) final int? sortOrder,
    @JsonKey(name: "column_count", fromJson: _toIntSafe) final int? columnCount,
    @JsonKey(name: "image_position", fromJson: _toStringSafe)
    final String? imagePosition,
    @JsonKey(name: "for_homepage", fromJson: _toStringSafe)
    final String? forHomepage,
    @JsonKey(name: "category") final Category? category,
  }) = _$BannerResponseImpl;

  factory _BannerResponse.fromJson(Map<String, dynamic> json) =
      _$BannerResponseImpl.fromJson;

  @override
  @JsonKey(name: "entity_id", fromJson: _toIntSafe)
  int? get entityId;
  @override
  @JsonKey(name: "title", fromJson: _toStringSafe)
  String? get title;
  @override
  @JsonKey(name: "image", fromJson: _toStringSafe)
  String? get image;
  @override
  @JsonKey(name: "image_url", fromJson: _toStringSafe)
  String? get imageUrl;
  @override
  @JsonKey(name: "responsive_image", fromJson: _toStringSafe)
  String? get responsiveImage;
  @override
  @JsonKey(name: "responsive_image_url", fromJson: _toStringSafe)
  String? get responsiveImageUrl;
  @override
  @JsonKey(name: "link", fromJson: _toStringSafe)
  String? get link;
  @override
  @JsonKey(name: "link_type", fromJson: _toStringSafe)
  String? get linkType;
  @override
  @JsonKey(name: "link_value", fromJson: _toStringSafe)
  String? get linkValue;
  @override
  @JsonKey(name: "resolved_link", fromJson: _toStringSafe)
  String? get resolvedLink;
  @override
  @JsonKey(name: "is_active", fromJson: _toStringSafe)
  String? get isActive;
  @override
  @JsonKey(name: "identifier", fromJson: _toStringSafe)
  String? get identifier;
  @override
  @JsonKey(name: "category_id", fromJson: _toIntSafe)
  int? get categoryId;
  @override
  @JsonKey(name: "is_category", fromJson: _toStringSafe)
  String? get isCategory;
  @override
  @JsonKey(name: "sort_order", fromJson: _toIntSafe)
  int? get sortOrder;
  @override
  @JsonKey(name: "column_count", fromJson: _toIntSafe)
  int? get columnCount;
  @override
  @JsonKey(name: "image_position", fromJson: _toStringSafe)
  String? get imagePosition;
  @override
  @JsonKey(name: "for_homepage", fromJson: _toStringSafe)
  String? get forHomepage;
  @override
  @JsonKey(name: "category")
  Category? get category;

  /// Create a copy of BannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerResponseImplCopyWith<_$BannerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: "id", fromJson: _toIntSafe)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name", fromJson: _toStringSafe)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug", fromJson: _toStringSafe)
  String? get slug => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({
    @JsonKey(name: "id", fromJson: _toIntSafe) int? id,
    @JsonKey(name: "name", fromJson: _toStringSafe) String? name,
    @JsonKey(name: "slug", fromJson: _toStringSafe) String? slug,
  });
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            slug:
                freezed == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
    _$CategoryImpl value,
    $Res Function(_$CategoryImpl) then,
  ) = __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id", fromJson: _toIntSafe) int? id,
    @JsonKey(name: "name", fromJson: _toStringSafe) String? name,
    @JsonKey(name: "slug", fromJson: _toStringSafe) String? slug,
  });
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
    _$CategoryImpl _value,
    $Res Function(_$CategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(
      _$CategoryImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        slug:
            freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl({
    @JsonKey(name: "id", fromJson: _toIntSafe) this.id,
    @JsonKey(name: "name", fromJson: _toStringSafe) this.name,
    @JsonKey(name: "slug", fromJson: _toStringSafe) this.slug,
  });

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: "id", fromJson: _toIntSafe)
  final int? id;
  @override
  @JsonKey(name: "name", fromJson: _toStringSafe)
  final String? name;
  @override
  @JsonKey(name: "slug", fromJson: _toStringSafe)
  final String? slug;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category({
    @JsonKey(name: "id", fromJson: _toIntSafe) final int? id,
    @JsonKey(name: "name", fromJson: _toStringSafe) final String? name,
    @JsonKey(name: "slug", fromJson: _toStringSafe) final String? slug,
  }) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: "id", fromJson: _toIntSafe)
  int? get id;
  @override
  @JsonKey(name: "name", fromJson: _toStringSafe)
  String? get name;
  @override
  @JsonKey(name: "slug", fromJson: _toStringSafe)
  String? get slug;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
