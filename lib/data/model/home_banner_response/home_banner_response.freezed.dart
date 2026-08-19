// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_banner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeBannerResponse _$HomeBannerResponseFromJson(Map<String, dynamic> json) {
  return _HomeBannerResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeBannerResponse {
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "responsive_image")
  String? get responsiveImage => throw _privateConstructorUsedError;
  @JsonKey(name: "responsive_image_url")
  String? get responsiveImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "link_type")
  String? get linkType => throw _privateConstructorUsedError;
  @JsonKey(name: "link_value")
  String? get linkValue => throw _privateConstructorUsedError;
  @JsonKey(name: "resolved_link")
  String? get resolvedLink => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  String? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "identifier")
  String? get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: "category_id")
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_category")
  String? get isCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order")
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: "column_count")
  int? get columnCount => throw _privateConstructorUsedError;
  @JsonKey(name: "image_position")
  String? get imagePosition => throw _privateConstructorUsedError;
  @JsonKey(name: "for_homepage")
  String? get forHomepage => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  HomeBannerCategory? get category => throw _privateConstructorUsedError;

  /// Serializes this HomeBannerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeBannerResponseCopyWith<HomeBannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBannerResponseCopyWith<$Res> {
  factory $HomeBannerResponseCopyWith(
    HomeBannerResponse value,
    $Res Function(HomeBannerResponse) then,
  ) = _$HomeBannerResponseCopyWithImpl<$Res, HomeBannerResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "responsive_image") String? responsiveImage,
    @JsonKey(name: "responsive_image_url") String? responsiveImageUrl,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "resolved_link") String? resolvedLink,
    @JsonKey(name: "is_active") String? isActive,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "category_id") int? categoryId,
    @JsonKey(name: "is_category") String? isCategory,
    @JsonKey(name: "sort_order") int? sortOrder,
    @JsonKey(name: "column_count") int? columnCount,
    @JsonKey(name: "image_position") String? imagePosition,
    @JsonKey(name: "for_homepage") String? forHomepage,
    @JsonKey(name: "category") HomeBannerCategory? category,
  });

  $HomeBannerCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$HomeBannerResponseCopyWithImpl<$Res, $Val extends HomeBannerResponse>
    implements $HomeBannerResponseCopyWith<$Res> {
  _$HomeBannerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeBannerResponse
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
                        as HomeBannerCategory?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeBannerCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $HomeBannerCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeBannerResponseImplCopyWith<$Res>
    implements $HomeBannerResponseCopyWith<$Res> {
  factory _$$HomeBannerResponseImplCopyWith(
    _$HomeBannerResponseImpl value,
    $Res Function(_$HomeBannerResponseImpl) then,
  ) = __$$HomeBannerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "responsive_image") String? responsiveImage,
    @JsonKey(name: "responsive_image_url") String? responsiveImageUrl,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "resolved_link") String? resolvedLink,
    @JsonKey(name: "is_active") String? isActive,
    @JsonKey(name: "identifier") String? identifier,
    @JsonKey(name: "category_id") int? categoryId,
    @JsonKey(name: "is_category") String? isCategory,
    @JsonKey(name: "sort_order") int? sortOrder,
    @JsonKey(name: "column_count") int? columnCount,
    @JsonKey(name: "image_position") String? imagePosition,
    @JsonKey(name: "for_homepage") String? forHomepage,
    @JsonKey(name: "category") HomeBannerCategory? category,
  });

  @override
  $HomeBannerCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$HomeBannerResponseImplCopyWithImpl<$Res>
    extends _$HomeBannerResponseCopyWithImpl<$Res, _$HomeBannerResponseImpl>
    implements _$$HomeBannerResponseImplCopyWith<$Res> {
  __$$HomeBannerResponseImplCopyWithImpl(
    _$HomeBannerResponseImpl _value,
    $Res Function(_$HomeBannerResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeBannerResponse
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
      _$HomeBannerResponseImpl(
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
                    as HomeBannerCategory?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeBannerResponseImpl implements _HomeBannerResponse {
  const _$HomeBannerResponseImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "image") this.image,
    @JsonKey(name: "image_url") this.imageUrl,
    @JsonKey(name: "responsive_image") this.responsiveImage,
    @JsonKey(name: "responsive_image_url") this.responsiveImageUrl,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "link_type") this.linkType,
    @JsonKey(name: "link_value") this.linkValue,
    @JsonKey(name: "resolved_link") this.resolvedLink,
    @JsonKey(name: "is_active") this.isActive,
    @JsonKey(name: "identifier") this.identifier,
    @JsonKey(name: "category_id") this.categoryId,
    @JsonKey(name: "is_category") this.isCategory,
    @JsonKey(name: "sort_order") this.sortOrder,
    @JsonKey(name: "column_count") this.columnCount,
    @JsonKey(name: "image_position") this.imagePosition,
    @JsonKey(name: "for_homepage") this.forHomepage,
    @JsonKey(name: "category") this.category,
  });

  factory _$HomeBannerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeBannerResponseImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "responsive_image")
  final String? responsiveImage;
  @override
  @JsonKey(name: "responsive_image_url")
  final String? responsiveImageUrl;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "link_type")
  final String? linkType;
  @override
  @JsonKey(name: "link_value")
  final String? linkValue;
  @override
  @JsonKey(name: "resolved_link")
  final String? resolvedLink;
  @override
  @JsonKey(name: "is_active")
  final String? isActive;
  @override
  @JsonKey(name: "identifier")
  final String? identifier;
  @override
  @JsonKey(name: "category_id")
  final int? categoryId;
  @override
  @JsonKey(name: "is_category")
  final String? isCategory;
  @override
  @JsonKey(name: "sort_order")
  final int? sortOrder;
  @override
  @JsonKey(name: "column_count")
  final int? columnCount;
  @override
  @JsonKey(name: "image_position")
  final String? imagePosition;
  @override
  @JsonKey(name: "for_homepage")
  final String? forHomepage;
  @override
  @JsonKey(name: "category")
  final HomeBannerCategory? category;

  @override
  String toString() {
    return 'HomeBannerResponse(entityId: $entityId, title: $title, image: $image, imageUrl: $imageUrl, responsiveImage: $responsiveImage, responsiveImageUrl: $responsiveImageUrl, link: $link, linkType: $linkType, linkValue: $linkValue, resolvedLink: $resolvedLink, isActive: $isActive, identifier: $identifier, categoryId: $categoryId, isCategory: $isCategory, sortOrder: $sortOrder, columnCount: $columnCount, imagePosition: $imagePosition, forHomepage: $forHomepage, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBannerResponseImpl &&
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

  /// Create a copy of HomeBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeBannerResponseImplCopyWith<_$HomeBannerResponseImpl> get copyWith =>
      __$$HomeBannerResponseImplCopyWithImpl<_$HomeBannerResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeBannerResponseImplToJson(this);
  }
}

abstract class _HomeBannerResponse implements HomeBannerResponse {
  const factory _HomeBannerResponse({
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "image") final String? image,
    @JsonKey(name: "image_url") final String? imageUrl,
    @JsonKey(name: "responsive_image") final String? responsiveImage,
    @JsonKey(name: "responsive_image_url") final String? responsiveImageUrl,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "link_type") final String? linkType,
    @JsonKey(name: "link_value") final String? linkValue,
    @JsonKey(name: "resolved_link") final String? resolvedLink,
    @JsonKey(name: "is_active") final String? isActive,
    @JsonKey(name: "identifier") final String? identifier,
    @JsonKey(name: "category_id") final int? categoryId,
    @JsonKey(name: "is_category") final String? isCategory,
    @JsonKey(name: "sort_order") final int? sortOrder,
    @JsonKey(name: "column_count") final int? columnCount,
    @JsonKey(name: "image_position") final String? imagePosition,
    @JsonKey(name: "for_homepage") final String? forHomepage,
    @JsonKey(name: "category") final HomeBannerCategory? category,
  }) = _$HomeBannerResponseImpl;

  factory _HomeBannerResponse.fromJson(Map<String, dynamic> json) =
      _$HomeBannerResponseImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "responsive_image")
  String? get responsiveImage;
  @override
  @JsonKey(name: "responsive_image_url")
  String? get responsiveImageUrl;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "link_type")
  String? get linkType;
  @override
  @JsonKey(name: "link_value")
  String? get linkValue;
  @override
  @JsonKey(name: "resolved_link")
  String? get resolvedLink;
  @override
  @JsonKey(name: "is_active")
  String? get isActive;
  @override
  @JsonKey(name: "identifier")
  String? get identifier;
  @override
  @JsonKey(name: "category_id")
  int? get categoryId;
  @override
  @JsonKey(name: "is_category")
  String? get isCategory;
  @override
  @JsonKey(name: "sort_order")
  int? get sortOrder;
  @override
  @JsonKey(name: "column_count")
  int? get columnCount;
  @override
  @JsonKey(name: "image_position")
  String? get imagePosition;
  @override
  @JsonKey(name: "for_homepage")
  String? get forHomepage;
  @override
  @JsonKey(name: "category")
  HomeBannerCategory? get category;

  /// Create a copy of HomeBannerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeBannerResponseImplCopyWith<_$HomeBannerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeBannerCategory _$HomeBannerCategoryFromJson(Map<String, dynamic> json) {
  return _HomeBannerCategory.fromJson(json);
}

/// @nodoc
mixin _$HomeBannerCategory {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;

  /// Serializes this HomeBannerCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeBannerCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeBannerCategoryCopyWith<HomeBannerCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBannerCategoryCopyWith<$Res> {
  factory $HomeBannerCategoryCopyWith(
    HomeBannerCategory value,
    $Res Function(HomeBannerCategory) then,
  ) = _$HomeBannerCategoryCopyWithImpl<$Res, HomeBannerCategory>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  });
}

/// @nodoc
class _$HomeBannerCategoryCopyWithImpl<$Res, $Val extends HomeBannerCategory>
    implements $HomeBannerCategoryCopyWith<$Res> {
  _$HomeBannerCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeBannerCategory
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
abstract class _$$HomeBannerCategoryImplCopyWith<$Res>
    implements $HomeBannerCategoryCopyWith<$Res> {
  factory _$$HomeBannerCategoryImplCopyWith(
    _$HomeBannerCategoryImpl value,
    $Res Function(_$HomeBannerCategoryImpl) then,
  ) = __$$HomeBannerCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  });
}

/// @nodoc
class __$$HomeBannerCategoryImplCopyWithImpl<$Res>
    extends _$HomeBannerCategoryCopyWithImpl<$Res, _$HomeBannerCategoryImpl>
    implements _$$HomeBannerCategoryImplCopyWith<$Res> {
  __$$HomeBannerCategoryImplCopyWithImpl(
    _$HomeBannerCategoryImpl _value,
    $Res Function(_$HomeBannerCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeBannerCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(
      _$HomeBannerCategoryImpl(
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
class _$HomeBannerCategoryImpl implements _HomeBannerCategory {
  const _$HomeBannerCategoryImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "slug") this.slug,
  });

  factory _$HomeBannerCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeBannerCategoryImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "slug")
  final String? slug;

  @override
  String toString() {
    return 'HomeBannerCategory(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBannerCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  /// Create a copy of HomeBannerCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeBannerCategoryImplCopyWith<_$HomeBannerCategoryImpl> get copyWith =>
      __$$HomeBannerCategoryImplCopyWithImpl<_$HomeBannerCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeBannerCategoryImplToJson(this);
  }
}

abstract class _HomeBannerCategory implements HomeBannerCategory {
  const factory _HomeBannerCategory({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "slug") final String? slug,
  }) = _$HomeBannerCategoryImpl;

  factory _HomeBannerCategory.fromJson(Map<String, dynamic> json) =
      _$HomeBannerCategoryImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "slug")
  String? get slug;

  /// Create a copy of HomeBannerCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeBannerCategoryImplCopyWith<_$HomeBannerCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
