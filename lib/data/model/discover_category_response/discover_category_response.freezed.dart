// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiscoverCategoryResponse _$DiscoverCategoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DiscoverCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$DiscoverCategoryResponse {
  @JsonKey(name: "items")
  List<DiscoverCategoryItem>? get items => throw _privateConstructorUsedError;

  /// Serializes this DiscoverCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscoverCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverCategoryResponseCopyWith<DiscoverCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverCategoryResponseCopyWith<$Res> {
  factory $DiscoverCategoryResponseCopyWith(
    DiscoverCategoryResponse value,
    $Res Function(DiscoverCategoryResponse) then,
  ) = _$DiscoverCategoryResponseCopyWithImpl<$Res, DiscoverCategoryResponse>;
  @useResult
  $Res call({@JsonKey(name: "items") List<DiscoverCategoryItem>? items});
}

/// @nodoc
class _$DiscoverCategoryResponseCopyWithImpl<
  $Res,
  $Val extends DiscoverCategoryResponse
>
    implements $DiscoverCategoryResponseCopyWith<$Res> {
  _$DiscoverCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = freezed}) {
    return _then(
      _value.copyWith(
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<DiscoverCategoryItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiscoverCategoryResponseImplCopyWith<$Res>
    implements $DiscoverCategoryResponseCopyWith<$Res> {
  factory _$$DiscoverCategoryResponseImplCopyWith(
    _$DiscoverCategoryResponseImpl value,
    $Res Function(_$DiscoverCategoryResponseImpl) then,
  ) = __$$DiscoverCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "items") List<DiscoverCategoryItem>? items});
}

/// @nodoc
class __$$DiscoverCategoryResponseImplCopyWithImpl<$Res>
    extends
        _$DiscoverCategoryResponseCopyWithImpl<
          $Res,
          _$DiscoverCategoryResponseImpl
        >
    implements _$$DiscoverCategoryResponseImplCopyWith<$Res> {
  __$$DiscoverCategoryResponseImplCopyWithImpl(
    _$DiscoverCategoryResponseImpl _value,
    $Res Function(_$DiscoverCategoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscoverCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = freezed}) {
    return _then(
      _$DiscoverCategoryResponseImpl(
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<DiscoverCategoryItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscoverCategoryResponseImpl implements _DiscoverCategoryResponse {
  const _$DiscoverCategoryResponseImpl({
    @JsonKey(name: "items") final List<DiscoverCategoryItem>? items,
  }) : _items = items;

  factory _$DiscoverCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscoverCategoryResponseImplFromJson(json);

  final List<DiscoverCategoryItem>? _items;
  @override
  @JsonKey(name: "items")
  List<DiscoverCategoryItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiscoverCategoryResponse(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverCategoryResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of DiscoverCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverCategoryResponseImplCopyWith<_$DiscoverCategoryResponseImpl>
  get copyWith => __$$DiscoverCategoryResponseImplCopyWithImpl<
    _$DiscoverCategoryResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscoverCategoryResponseImplToJson(this);
  }
}

abstract class _DiscoverCategoryResponse implements DiscoverCategoryResponse {
  const factory _DiscoverCategoryResponse({
    @JsonKey(name: "items") final List<DiscoverCategoryItem>? items,
  }) = _$DiscoverCategoryResponseImpl;

  factory _DiscoverCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$DiscoverCategoryResponseImpl.fromJson;

  @override
  @JsonKey(name: "items")
  List<DiscoverCategoryItem>? get items;

  /// Create a copy of DiscoverCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoverCategoryResponseImplCopyWith<_$DiscoverCategoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DiscoverCategoryItem _$DiscoverCategoryItemFromJson(Map<String, dynamic> json) {
  return _DiscoverCategoryItem.fromJson(json);
}

/// @nodoc
mixin _$DiscoverCategoryItem {
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "menu_name")
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: "logo_url")
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  Category? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "banners")
  List<Banner>? get banners => throw _privateConstructorUsedError;
  @JsonKey(name: "subsections")
  List<Subsection>? get subsections => throw _privateConstructorUsedError;

  /// Serializes this DiscoverCategoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscoverCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverCategoryItemCopyWith<DiscoverCategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverCategoryItemCopyWith<$Res> {
  factory $DiscoverCategoryItemCopyWith(
    DiscoverCategoryItem value,
    $Res Function(DiscoverCategoryItem) then,
  ) = _$DiscoverCategoryItemCopyWithImpl<$Res, DiscoverCategoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "menu_name") String? menuName,
    @JsonKey(name: "logo_url") String? logoUrl,
    @JsonKey(name: "category") Category? category,
    @JsonKey(name: "banners") List<Banner>? banners,
    @JsonKey(name: "subsections") List<Subsection>? subsections,
  });

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$DiscoverCategoryItemCopyWithImpl<
  $Res,
  $Val extends DiscoverCategoryItem
>
    implements $DiscoverCategoryItemCopyWith<$Res> {
  _$DiscoverCategoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? menuName = freezed,
    Object? logoUrl = freezed,
    Object? category = freezed,
    Object? banners = freezed,
    Object? subsections = freezed,
  }) {
    return _then(
      _value.copyWith(
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            menuName:
                freezed == menuName
                    ? _value.menuName
                    : menuName // ignore: cast_nullable_to_non_nullable
                        as String?,
            logoUrl:
                freezed == logoUrl
                    ? _value.logoUrl
                    : logoUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category?,
            banners:
                freezed == banners
                    ? _value.banners
                    : banners // ignore: cast_nullable_to_non_nullable
                        as List<Banner>?,
            subsections:
                freezed == subsections
                    ? _value.subsections
                    : subsections // ignore: cast_nullable_to_non_nullable
                        as List<Subsection>?,
          )
          as $Val,
    );
  }

  /// Create a copy of DiscoverCategoryItem
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
abstract class _$$DiscoverCategoryItemImplCopyWith<$Res>
    implements $DiscoverCategoryItemCopyWith<$Res> {
  factory _$$DiscoverCategoryItemImplCopyWith(
    _$DiscoverCategoryItemImpl value,
    $Res Function(_$DiscoverCategoryItemImpl) then,
  ) = __$$DiscoverCategoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "menu_name") String? menuName,
    @JsonKey(name: "logo_url") String? logoUrl,
    @JsonKey(name: "category") Category? category,
    @JsonKey(name: "banners") List<Banner>? banners,
    @JsonKey(name: "subsections") List<Subsection>? subsections,
  });

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$DiscoverCategoryItemImplCopyWithImpl<$Res>
    extends _$DiscoverCategoryItemCopyWithImpl<$Res, _$DiscoverCategoryItemImpl>
    implements _$$DiscoverCategoryItemImplCopyWith<$Res> {
  __$$DiscoverCategoryItemImplCopyWithImpl(
    _$DiscoverCategoryItemImpl _value,
    $Res Function(_$DiscoverCategoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscoverCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? menuName = freezed,
    Object? logoUrl = freezed,
    Object? category = freezed,
    Object? banners = freezed,
    Object? subsections = freezed,
  }) {
    return _then(
      _$DiscoverCategoryItemImpl(
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        menuName:
            freezed == menuName
                ? _value.menuName
                : menuName // ignore: cast_nullable_to_non_nullable
                    as String?,
        logoUrl:
            freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category?,
        banners:
            freezed == banners
                ? _value._banners
                : banners // ignore: cast_nullable_to_non_nullable
                    as List<Banner>?,
        subsections:
            freezed == subsections
                ? _value._subsections
                : subsections // ignore: cast_nullable_to_non_nullable
                    as List<Subsection>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscoverCategoryItemImpl implements _DiscoverCategoryItem {
  const _$DiscoverCategoryItemImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "menu_name") this.menuName,
    @JsonKey(name: "logo_url") this.logoUrl,
    @JsonKey(name: "category") this.category,
    @JsonKey(name: "banners") final List<Banner>? banners,
    @JsonKey(name: "subsections") final List<Subsection>? subsections,
  }) : _banners = banners,
       _subsections = subsections;

  factory _$DiscoverCategoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscoverCategoryItemImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "menu_name")
  final String? menuName;
  @override
  @JsonKey(name: "logo_url")
  final String? logoUrl;
  @override
  @JsonKey(name: "category")
  final Category? category;
  final List<Banner>? _banners;
  @override
  @JsonKey(name: "banners")
  List<Banner>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Subsection>? _subsections;
  @override
  @JsonKey(name: "subsections")
  List<Subsection>? get subsections {
    final value = _subsections;
    if (value == null) return null;
    if (_subsections is EqualUnmodifiableListView) return _subsections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiscoverCategoryItem(entityId: $entityId, menuName: $menuName, logoUrl: $logoUrl, category: $category, banners: $banners, subsections: $subsections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverCategoryItemImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality().equals(
              other._subsections,
              _subsections,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entityId,
    menuName,
    logoUrl,
    category,
    const DeepCollectionEquality().hash(_banners),
    const DeepCollectionEquality().hash(_subsections),
  );

  /// Create a copy of DiscoverCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverCategoryItemImplCopyWith<_$DiscoverCategoryItemImpl>
  get copyWith =>
      __$$DiscoverCategoryItemImplCopyWithImpl<_$DiscoverCategoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscoverCategoryItemImplToJson(this);
  }
}

abstract class _DiscoverCategoryItem implements DiscoverCategoryItem {
  const factory _DiscoverCategoryItem({
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "menu_name") final String? menuName,
    @JsonKey(name: "logo_url") final String? logoUrl,
    @JsonKey(name: "category") final Category? category,
    @JsonKey(name: "banners") final List<Banner>? banners,
    @JsonKey(name: "subsections") final List<Subsection>? subsections,
  }) = _$DiscoverCategoryItemImpl;

  factory _DiscoverCategoryItem.fromJson(Map<String, dynamic> json) =
      _$DiscoverCategoryItemImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "menu_name")
  String? get menuName;
  @override
  @JsonKey(name: "logo_url")
  String? get logoUrl;
  @override
  @JsonKey(name: "category")
  Category? get category;
  @override
  @JsonKey(name: "banners")
  List<Banner>? get banners;
  @override
  @JsonKey(name: "subsections")
  List<Subsection>? get subsections;

  /// Create a copy of DiscoverCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoverCategoryItemImplCopyWith<_$DiscoverCategoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return _Banner.fromJson(json);
}

/// @nodoc
mixin _$Banner {
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "link_type")
  String? get linkType => throw _privateConstructorUsedError;
  @JsonKey(name: "link_value")
  String? get linkValue => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order")
  int? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this Banner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerCopyWith<Banner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerCopyWith<$Res> {
  factory $BannerCopyWith(Banner value, $Res Function(Banner) then) =
      _$BannerCopyWithImpl<$Res, Banner>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "sort_order") int? sortOrder,
  });
}

/// @nodoc
class _$BannerCopyWithImpl<$Res, $Val extends Banner>
    implements $BannerCopyWith<$Res> {
  _$BannerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? imageUrl = freezed,
    Object? linkType = freezed,
    Object? linkValue = freezed,
    Object? link = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
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
            link:
                freezed == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String?,
            sortOrder:
                freezed == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BannerImplCopyWith<$Res> implements $BannerCopyWith<$Res> {
  factory _$$BannerImplCopyWith(
    _$BannerImpl value,
    $Res Function(_$BannerImpl) then,
  ) = __$$BannerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "sort_order") int? sortOrder,
  });
}

/// @nodoc
class __$$BannerImplCopyWithImpl<$Res>
    extends _$BannerCopyWithImpl<$Res, _$BannerImpl>
    implements _$$BannerImplCopyWith<$Res> {
  __$$BannerImplCopyWithImpl(
    _$BannerImpl _value,
    $Res Function(_$BannerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? imageUrl = freezed,
    Object? linkType = freezed,
    Object? linkValue = freezed,
    Object? link = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$BannerImpl(
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
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
        link:
            freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String?,
        sortOrder:
            freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerImpl implements _Banner {
  const _$BannerImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "image_url") this.imageUrl,
    @JsonKey(name: "link_type") this.linkType,
    @JsonKey(name: "link_value") this.linkValue,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "sort_order") this.sortOrder,
  });

  factory _$BannerImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "link_type")
  final String? linkType;
  @override
  @JsonKey(name: "link_value")
  final String? linkValue;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "sort_order")
  final int? sortOrder;

  @override
  String toString() {
    return 'Banner(entityId: $entityId, imageUrl: $imageUrl, linkType: $linkType, linkValue: $linkValue, link: $link, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.linkValue, linkValue) ||
                other.linkValue == linkValue) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entityId,
    imageUrl,
    linkType,
    linkValue,
    link,
    sortOrder,
  );

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerImplCopyWith<_$BannerImpl> get copyWith =>
      __$$BannerImplCopyWithImpl<_$BannerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerImplToJson(this);
  }
}

abstract class _Banner implements Banner {
  const factory _Banner({
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "image_url") final String? imageUrl,
    @JsonKey(name: "link_type") final String? linkType,
    @JsonKey(name: "link_value") final String? linkValue,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "sort_order") final int? sortOrder,
  }) = _$BannerImpl;

  factory _Banner.fromJson(Map<String, dynamic> json) = _$BannerImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "link_type")
  String? get linkType;
  @override
  @JsonKey(name: "link_value")
  String? get linkValue;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "sort_order")
  int? get sortOrder;

  /// Create a copy of Banner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerImplCopyWith<_$BannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
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
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
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
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
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
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "slug") this.slug,
  });

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

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
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "slug") final String? slug,
  }) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "slug")
  String? get slug;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subsection _$SubsectionFromJson(Map<String, dynamic> json) {
  return _Subsection.fromJson(json);
}

/// @nodoc
mixin _$Subsection {
  @JsonKey(name: "section_type")
  String? get sectionType => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "see_more_link")
  dynamic get seeMoreLink => throw _privateConstructorUsedError;
  @JsonKey(name: "see_more_link_type")
  String? get seeMoreLinkType => throw _privateConstructorUsedError;
  @JsonKey(name: "see_more_link_value")
  String? get seeMoreLinkValue => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<SubsectionItem>? get items => throw _privateConstructorUsedError;

  /// Serializes this Subsection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subsection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubsectionCopyWith<Subsection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubsectionCopyWith<$Res> {
  factory $SubsectionCopyWith(
    Subsection value,
    $Res Function(Subsection) then,
  ) = _$SubsectionCopyWithImpl<$Res, Subsection>;
  @useResult
  $Res call({
    @JsonKey(name: "section_type") String? sectionType,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "see_more_link") dynamic seeMoreLink,
    @JsonKey(name: "see_more_link_type") String? seeMoreLinkType,
    @JsonKey(name: "see_more_link_value") String? seeMoreLinkValue,
    @JsonKey(name: "items") List<SubsectionItem>? items,
  });
}

/// @nodoc
class _$SubsectionCopyWithImpl<$Res, $Val extends Subsection>
    implements $SubsectionCopyWith<$Res> {
  _$SubsectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subsection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionType = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? seeMoreLink = freezed,
    Object? seeMoreLinkType = freezed,
    Object? seeMoreLinkValue = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _value.copyWith(
            sectionType:
                freezed == sectionType
                    ? _value.sectionType
                    : sectionType // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
            seeMoreLink:
                freezed == seeMoreLink
                    ? _value.seeMoreLink
                    : seeMoreLink // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            seeMoreLinkType:
                freezed == seeMoreLinkType
                    ? _value.seeMoreLinkType
                    : seeMoreLinkType // ignore: cast_nullable_to_non_nullable
                        as String?,
            seeMoreLinkValue:
                freezed == seeMoreLinkValue
                    ? _value.seeMoreLinkValue
                    : seeMoreLinkValue // ignore: cast_nullable_to_non_nullable
                        as String?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<SubsectionItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubsectionImplCopyWith<$Res>
    implements $SubsectionCopyWith<$Res> {
  factory _$$SubsectionImplCopyWith(
    _$SubsectionImpl value,
    $Res Function(_$SubsectionImpl) then,
  ) = __$$SubsectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "section_type") String? sectionType,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "see_more_link") dynamic seeMoreLink,
    @JsonKey(name: "see_more_link_type") String? seeMoreLinkType,
    @JsonKey(name: "see_more_link_value") String? seeMoreLinkValue,
    @JsonKey(name: "items") List<SubsectionItem>? items,
  });
}

/// @nodoc
class __$$SubsectionImplCopyWithImpl<$Res>
    extends _$SubsectionCopyWithImpl<$Res, _$SubsectionImpl>
    implements _$$SubsectionImplCopyWith<$Res> {
  __$$SubsectionImplCopyWithImpl(
    _$SubsectionImpl _value,
    $Res Function(_$SubsectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subsection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionType = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? seeMoreLink = freezed,
    Object? seeMoreLinkType = freezed,
    Object? seeMoreLinkValue = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _$SubsectionImpl(
        sectionType:
            freezed == sectionType
                ? _value.sectionType
                : sectionType // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int?,
        seeMoreLink:
            freezed == seeMoreLink
                ? _value.seeMoreLink
                : seeMoreLink // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        seeMoreLinkType:
            freezed == seeMoreLinkType
                ? _value.seeMoreLinkType
                : seeMoreLinkType // ignore: cast_nullable_to_non_nullable
                    as String?,
        seeMoreLinkValue:
            freezed == seeMoreLinkValue
                ? _value.seeMoreLinkValue
                : seeMoreLinkValue // ignore: cast_nullable_to_non_nullable
                    as String?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<SubsectionItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubsectionImpl implements _Subsection {
  const _$SubsectionImpl({
    @JsonKey(name: "section_type") this.sectionType,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "see_more_link") this.seeMoreLink,
    @JsonKey(name: "see_more_link_type") this.seeMoreLinkType,
    @JsonKey(name: "see_more_link_value") this.seeMoreLinkValue,
    @JsonKey(name: "items") final List<SubsectionItem>? items,
  }) : _items = items;

  factory _$SubsectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubsectionImplFromJson(json);

  @override
  @JsonKey(name: "section_type")
  final String? sectionType;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "see_more_link")
  final dynamic seeMoreLink;
  @override
  @JsonKey(name: "see_more_link_type")
  final String? seeMoreLinkType;
  @override
  @JsonKey(name: "see_more_link_value")
  final String? seeMoreLinkValue;
  final List<SubsectionItem>? _items;
  @override
  @JsonKey(name: "items")
  List<SubsectionItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Subsection(sectionType: $sectionType, title: $title, status: $status, seeMoreLink: $seeMoreLink, seeMoreLinkType: $seeMoreLinkType, seeMoreLinkValue: $seeMoreLinkValue, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubsectionImpl &&
            (identical(other.sectionType, sectionType) ||
                other.sectionType == sectionType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other.seeMoreLink,
              seeMoreLink,
            ) &&
            (identical(other.seeMoreLinkType, seeMoreLinkType) ||
                other.seeMoreLinkType == seeMoreLinkType) &&
            (identical(other.seeMoreLinkValue, seeMoreLinkValue) ||
                other.seeMoreLinkValue == seeMoreLinkValue) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sectionType,
    title,
    status,
    const DeepCollectionEquality().hash(seeMoreLink),
    seeMoreLinkType,
    seeMoreLinkValue,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of Subsection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubsectionImplCopyWith<_$SubsectionImpl> get copyWith =>
      __$$SubsectionImplCopyWithImpl<_$SubsectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubsectionImplToJson(this);
  }
}

abstract class _Subsection implements Subsection {
  const factory _Subsection({
    @JsonKey(name: "section_type") final String? sectionType,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "status") final int? status,
    @JsonKey(name: "see_more_link") final dynamic seeMoreLink,
    @JsonKey(name: "see_more_link_type") final String? seeMoreLinkType,
    @JsonKey(name: "see_more_link_value") final String? seeMoreLinkValue,
    @JsonKey(name: "items") final List<SubsectionItem>? items,
  }) = _$SubsectionImpl;

  factory _Subsection.fromJson(Map<String, dynamic> json) =
      _$SubsectionImpl.fromJson;

  @override
  @JsonKey(name: "section_type")
  String? get sectionType;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "see_more_link")
  dynamic get seeMoreLink;
  @override
  @JsonKey(name: "see_more_link_type")
  String? get seeMoreLinkType;
  @override
  @JsonKey(name: "see_more_link_value")
  String? get seeMoreLinkValue;
  @override
  @JsonKey(name: "items")
  List<SubsectionItem>? get items;

  /// Create a copy of Subsection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubsectionImplCopyWith<_$SubsectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubsectionItem _$SubsectionItemFromJson(Map<String, dynamic> json) {
  return _SubsectionItem.fromJson(json);
}

/// @nodoc
mixin _$SubsectionItem {
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "item_type")
  String? get itemType => throw _privateConstructorUsedError;
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "link_type")
  String? get linkType => throw _privateConstructorUsedError;
  @JsonKey(name: "link_value")
  String? get linkValue => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order")
  int? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this SubsectionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubsectionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubsectionItemCopyWith<SubsectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubsectionItemCopyWith<$Res> {
  factory $SubsectionItemCopyWith(
    SubsectionItem value,
    $Res Function(SubsectionItem) then,
  ) = _$SubsectionItemCopyWithImpl<$Res, SubsectionItem>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "item_type") String? itemType,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "sort_order") int? sortOrder,
  });
}

/// @nodoc
class _$SubsectionItemCopyWithImpl<$Res, $Val extends SubsectionItem>
    implements $SubsectionItemCopyWith<$Res> {
  _$SubsectionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubsectionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? itemType = freezed,
    Object? itemId = freezed,
    Object? linkType = freezed,
    Object? linkValue = freezed,
    Object? link = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as int?,
            itemType:
                freezed == itemType
                    ? _value.itemType
                    : itemType // ignore: cast_nullable_to_non_nullable
                        as String?,
            itemId:
                freezed == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as int?,
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
            link:
                freezed == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            sortOrder:
                freezed == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubsectionItemImplCopyWith<$Res>
    implements $SubsectionItemCopyWith<$Res> {
  factory _$$SubsectionItemImplCopyWith(
    _$SubsectionItemImpl value,
    $Res Function(_$SubsectionItemImpl) then,
  ) = __$$SubsectionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "item_type") String? itemType,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "link_type") String? linkType,
    @JsonKey(name: "link_value") String? linkValue,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "sort_order") int? sortOrder,
  });
}

/// @nodoc
class __$$SubsectionItemImplCopyWithImpl<$Res>
    extends _$SubsectionItemCopyWithImpl<$Res, _$SubsectionItemImpl>
    implements _$$SubsectionItemImplCopyWith<$Res> {
  __$$SubsectionItemImplCopyWithImpl(
    _$SubsectionItemImpl _value,
    $Res Function(_$SubsectionItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubsectionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? itemType = freezed,
    Object? itemId = freezed,
    Object? linkType = freezed,
    Object? linkValue = freezed,
    Object? link = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$SubsectionItemImpl(
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as int?,
        itemType:
            freezed == itemType
                ? _value.itemType
                : itemType // ignore: cast_nullable_to_non_nullable
                    as String?,
        itemId:
            freezed == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int?,
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
        link:
            freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        sortOrder:
            freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubsectionItemImpl implements _SubsectionItem {
  const _$SubsectionItemImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "item_type") this.itemType,
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "link_type") this.linkType,
    @JsonKey(name: "link_value") this.linkValue,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "image_url") this.imageUrl,
    @JsonKey(name: "sort_order") this.sortOrder,
  });

  factory _$SubsectionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubsectionItemImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "item_type")
  final String? itemType;
  @override
  @JsonKey(name: "item_id")
  final int? itemId;
  @override
  @JsonKey(name: "link_type")
  final String? linkType;
  @override
  @JsonKey(name: "link_value")
  final String? linkValue;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "sort_order")
  final int? sortOrder;

  @override
  String toString() {
    return 'SubsectionItem(entityId: $entityId, itemType: $itemType, itemId: $itemId, linkType: $linkType, linkValue: $linkValue, link: $link, name: $name, imageUrl: $imageUrl, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubsectionItemImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.linkValue, linkValue) ||
                other.linkValue == linkValue) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entityId,
    itemType,
    itemId,
    linkType,
    linkValue,
    link,
    name,
    imageUrl,
    sortOrder,
  );

  /// Create a copy of SubsectionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubsectionItemImplCopyWith<_$SubsectionItemImpl> get copyWith =>
      __$$SubsectionItemImplCopyWithImpl<_$SubsectionItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubsectionItemImplToJson(this);
  }
}

abstract class _SubsectionItem implements SubsectionItem {
  const factory _SubsectionItem({
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "item_type") final String? itemType,
    @JsonKey(name: "item_id") final int? itemId,
    @JsonKey(name: "link_type") final String? linkType,
    @JsonKey(name: "link_value") final String? linkValue,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "image_url") final String? imageUrl,
    @JsonKey(name: "sort_order") final int? sortOrder,
  }) = _$SubsectionItemImpl;

  factory _SubsectionItem.fromJson(Map<String, dynamic> json) =
      _$SubsectionItemImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "item_type")
  String? get itemType;
  @override
  @JsonKey(name: "item_id")
  int? get itemId;
  @override
  @JsonKey(name: "link_type")
  String? get linkType;
  @override
  @JsonKey(name: "link_value")
  String? get linkValue;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "sort_order")
  int? get sortOrder;

  /// Create a copy of SubsectionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubsectionItemImplCopyWith<_$SubsectionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
