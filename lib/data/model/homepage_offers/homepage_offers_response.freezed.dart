// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homepage_offers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomepageOffersResponse _$HomepageOffersResponseFromJson(
  Map<String, dynamic> json,
) {
  return _HomepageOffersResponse.fromJson(json);
}

/// @nodoc
mixin _$HomepageOffersResponse {
  @JsonKey(name: "items")
  List<HomepageOfferMenuResponse>? get items =>
      throw _privateConstructorUsedError;

  /// Serializes this HomepageOffersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomepageOffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomepageOffersResponseCopyWith<HomepageOffersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageOffersResponseCopyWith<$Res> {
  factory $HomepageOffersResponseCopyWith(
    HomepageOffersResponse value,
    $Res Function(HomepageOffersResponse) then,
  ) = _$HomepageOffersResponseCopyWithImpl<$Res, HomepageOffersResponse>;
  @useResult
  $Res call({@JsonKey(name: "items") List<HomepageOfferMenuResponse>? items});
}

/// @nodoc
class _$HomepageOffersResponseCopyWithImpl<
  $Res,
  $Val extends HomepageOffersResponse
>
    implements $HomepageOffersResponseCopyWith<$Res> {
  _$HomepageOffersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomepageOffersResponse
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
                        as List<HomepageOfferMenuResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomepageOffersResponseImplCopyWith<$Res>
    implements $HomepageOffersResponseCopyWith<$Res> {
  factory _$$HomepageOffersResponseImplCopyWith(
    _$HomepageOffersResponseImpl value,
    $Res Function(_$HomepageOffersResponseImpl) then,
  ) = __$$HomepageOffersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "items") List<HomepageOfferMenuResponse>? items});
}

/// @nodoc
class __$$HomepageOffersResponseImplCopyWithImpl<$Res>
    extends
        _$HomepageOffersResponseCopyWithImpl<$Res, _$HomepageOffersResponseImpl>
    implements _$$HomepageOffersResponseImplCopyWith<$Res> {
  __$$HomepageOffersResponseImplCopyWithImpl(
    _$HomepageOffersResponseImpl _value,
    $Res Function(_$HomepageOffersResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomepageOffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = freezed}) {
    return _then(
      _$HomepageOffersResponseImpl(
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<HomepageOfferMenuResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomepageOffersResponseImpl implements _HomepageOffersResponse {
  const _$HomepageOffersResponseImpl({
    @JsonKey(name: "items") final List<HomepageOfferMenuResponse>? items,
  }) : _items = items;

  factory _$HomepageOffersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomepageOffersResponseImplFromJson(json);

  final List<HomepageOfferMenuResponse>? _items;
  @override
  @JsonKey(name: "items")
  List<HomepageOfferMenuResponse>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomepageOffersResponse(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageOffersResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of HomepageOffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageOffersResponseImplCopyWith<_$HomepageOffersResponseImpl>
  get copyWith =>
      __$$HomepageOffersResponseImplCopyWithImpl<_$HomepageOffersResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HomepageOffersResponseImplToJson(this);
  }
}

abstract class _HomepageOffersResponse implements HomepageOffersResponse {
  const factory _HomepageOffersResponse({
    @JsonKey(name: "items") final List<HomepageOfferMenuResponse>? items,
  }) = _$HomepageOffersResponseImpl;

  factory _HomepageOffersResponse.fromJson(Map<String, dynamic> json) =
      _$HomepageOffersResponseImpl.fromJson;

  @override
  @JsonKey(name: "items")
  List<HomepageOfferMenuResponse>? get items;

  /// Create a copy of HomepageOffersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomepageOffersResponseImplCopyWith<_$HomepageOffersResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

HomepageOfferMenuResponse _$HomepageOfferMenuResponseFromJson(
  Map<String, dynamic> json,
) {
  return _HomepageOfferMenuResponse.fromJson(json);
}

/// @nodoc
mixin _$HomepageOfferMenuResponse {
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "menu_name")
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  OfferCategoryResponse? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "banners")
  List<dynamic>? get banners => throw _privateConstructorUsedError;
  @JsonKey(name: "subsections")
  List<OfferSubsectionResponse>? get subsections =>
      throw _privateConstructorUsedError;

  /// Serializes this HomepageOfferMenuResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomepageOfferMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomepageOfferMenuResponseCopyWith<HomepageOfferMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageOfferMenuResponseCopyWith<$Res> {
  factory $HomepageOfferMenuResponseCopyWith(
    HomepageOfferMenuResponse value,
    $Res Function(HomepageOfferMenuResponse) then,
  ) = _$HomepageOfferMenuResponseCopyWithImpl<$Res, HomepageOfferMenuResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "menu_name") String? menuName,
    @JsonKey(name: "category") OfferCategoryResponse? category,
    @JsonKey(name: "banners") List<dynamic>? banners,
    @JsonKey(name: "subsections") List<OfferSubsectionResponse>? subsections,
  });

  $OfferCategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class _$HomepageOfferMenuResponseCopyWithImpl<
  $Res,
  $Val extends HomepageOfferMenuResponse
>
    implements $HomepageOfferMenuResponseCopyWith<$Res> {
  _$HomepageOfferMenuResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomepageOfferMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? menuName = freezed,
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
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as OfferCategoryResponse?,
            banners:
                freezed == banners
                    ? _value.banners
                    : banners // ignore: cast_nullable_to_non_nullable
                        as List<dynamic>?,
            subsections:
                freezed == subsections
                    ? _value.subsections
                    : subsections // ignore: cast_nullable_to_non_nullable
                        as List<OfferSubsectionResponse>?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomepageOfferMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferCategoryResponseCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $OfferCategoryResponseCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomepageOfferMenuResponseImplCopyWith<$Res>
    implements $HomepageOfferMenuResponseCopyWith<$Res> {
  factory _$$HomepageOfferMenuResponseImplCopyWith(
    _$HomepageOfferMenuResponseImpl value,
    $Res Function(_$HomepageOfferMenuResponseImpl) then,
  ) = __$$HomepageOfferMenuResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "menu_name") String? menuName,
    @JsonKey(name: "category") OfferCategoryResponse? category,
    @JsonKey(name: "banners") List<dynamic>? banners,
    @JsonKey(name: "subsections") List<OfferSubsectionResponse>? subsections,
  });

  @override
  $OfferCategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class __$$HomepageOfferMenuResponseImplCopyWithImpl<$Res>
    extends
        _$HomepageOfferMenuResponseCopyWithImpl<
          $Res,
          _$HomepageOfferMenuResponseImpl
        >
    implements _$$HomepageOfferMenuResponseImplCopyWith<$Res> {
  __$$HomepageOfferMenuResponseImplCopyWithImpl(
    _$HomepageOfferMenuResponseImpl _value,
    $Res Function(_$HomepageOfferMenuResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomepageOfferMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? menuName = freezed,
    Object? category = freezed,
    Object? banners = freezed,
    Object? subsections = freezed,
  }) {
    return _then(
      _$HomepageOfferMenuResponseImpl(
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
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as OfferCategoryResponse?,
        banners:
            freezed == banners
                ? _value._banners
                : banners // ignore: cast_nullable_to_non_nullable
                    as List<dynamic>?,
        subsections:
            freezed == subsections
                ? _value._subsections
                : subsections // ignore: cast_nullable_to_non_nullable
                    as List<OfferSubsectionResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomepageOfferMenuResponseImpl implements _HomepageOfferMenuResponse {
  const _$HomepageOfferMenuResponseImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "menu_name") this.menuName,
    @JsonKey(name: "category") this.category,
    @JsonKey(name: "banners") final List<dynamic>? banners,
    @JsonKey(name: "subsections")
    final List<OfferSubsectionResponse>? subsections,
  }) : _banners = banners,
       _subsections = subsections;

  factory _$HomepageOfferMenuResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomepageOfferMenuResponseImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final int? entityId;
  @override
  @JsonKey(name: "menu_name")
  final String? menuName;
  @override
  @JsonKey(name: "category")
  final OfferCategoryResponse? category;
  final List<dynamic>? _banners;
  @override
  @JsonKey(name: "banners")
  List<dynamic>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OfferSubsectionResponse>? _subsections;
  @override
  @JsonKey(name: "subsections")
  List<OfferSubsectionResponse>? get subsections {
    final value = _subsections;
    if (value == null) return null;
    if (_subsections is EqualUnmodifiableListView) return _subsections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomepageOfferMenuResponse(entityId: $entityId, menuName: $menuName, category: $category, banners: $banners, subsections: $subsections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageOfferMenuResponseImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
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
    category,
    const DeepCollectionEquality().hash(_banners),
    const DeepCollectionEquality().hash(_subsections),
  );

  /// Create a copy of HomepageOfferMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageOfferMenuResponseImplCopyWith<_$HomepageOfferMenuResponseImpl>
  get copyWith => __$$HomepageOfferMenuResponseImplCopyWithImpl<
    _$HomepageOfferMenuResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomepageOfferMenuResponseImplToJson(this);
  }
}

abstract class _HomepageOfferMenuResponse implements HomepageOfferMenuResponse {
  const factory _HomepageOfferMenuResponse({
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "menu_name") final String? menuName,
    @JsonKey(name: "category") final OfferCategoryResponse? category,
    @JsonKey(name: "banners") final List<dynamic>? banners,
    @JsonKey(name: "subsections")
    final List<OfferSubsectionResponse>? subsections,
  }) = _$HomepageOfferMenuResponseImpl;

  factory _HomepageOfferMenuResponse.fromJson(Map<String, dynamic> json) =
      _$HomepageOfferMenuResponseImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  int? get entityId;
  @override
  @JsonKey(name: "menu_name")
  String? get menuName;
  @override
  @JsonKey(name: "category")
  OfferCategoryResponse? get category;
  @override
  @JsonKey(name: "banners")
  List<dynamic>? get banners;
  @override
  @JsonKey(name: "subsections")
  List<OfferSubsectionResponse>? get subsections;

  /// Create a copy of HomepageOfferMenuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomepageOfferMenuResponseImplCopyWith<_$HomepageOfferMenuResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OfferCategoryResponse _$OfferCategoryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OfferCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$OfferCategoryResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;

  /// Serializes this OfferCategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferCategoryResponseCopyWith<OfferCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCategoryResponseCopyWith<$Res> {
  factory $OfferCategoryResponseCopyWith(
    OfferCategoryResponse value,
    $Res Function(OfferCategoryResponse) then,
  ) = _$OfferCategoryResponseCopyWithImpl<$Res, OfferCategoryResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  });
}

/// @nodoc
class _$OfferCategoryResponseCopyWithImpl<
  $Res,
  $Val extends OfferCategoryResponse
>
    implements $OfferCategoryResponseCopyWith<$Res> {
  _$OfferCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferCategoryResponse
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
abstract class _$$OfferCategoryResponseImplCopyWith<$Res>
    implements $OfferCategoryResponseCopyWith<$Res> {
  factory _$$OfferCategoryResponseImplCopyWith(
    _$OfferCategoryResponseImpl value,
    $Res Function(_$OfferCategoryResponseImpl) then,
  ) = __$$OfferCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  });
}

/// @nodoc
class __$$OfferCategoryResponseImplCopyWithImpl<$Res>
    extends
        _$OfferCategoryResponseCopyWithImpl<$Res, _$OfferCategoryResponseImpl>
    implements _$$OfferCategoryResponseImplCopyWith<$Res> {
  __$$OfferCategoryResponseImplCopyWithImpl(
    _$OfferCategoryResponseImpl _value,
    $Res Function(_$OfferCategoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfferCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(
      _$OfferCategoryResponseImpl(
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
class _$OfferCategoryResponseImpl implements _OfferCategoryResponse {
  const _$OfferCategoryResponseImpl({
    @JsonKey(name: "id") this.id,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "slug") this.slug,
  });

  factory _$OfferCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferCategoryResponseImplFromJson(json);

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
    return 'OfferCategoryResponse(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferCategoryResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  /// Create a copy of OfferCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferCategoryResponseImplCopyWith<_$OfferCategoryResponseImpl>
  get copyWith =>
      __$$OfferCategoryResponseImplCopyWithImpl<_$OfferCategoryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferCategoryResponseImplToJson(this);
  }
}

abstract class _OfferCategoryResponse implements OfferCategoryResponse {
  const factory _OfferCategoryResponse({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "slug") final String? slug,
  }) = _$OfferCategoryResponseImpl;

  factory _OfferCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$OfferCategoryResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "slug")
  String? get slug;

  /// Create a copy of OfferCategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferCategoryResponseImplCopyWith<_$OfferCategoryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OfferSubsectionResponse _$OfferSubsectionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OfferSubsectionResponse.fromJson(json);
}

/// @nodoc
mixin _$OfferSubsectionResponse {
  @JsonKey(name: "section_type")
  String? get sectionType => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "see_more_link")
  String? get seeMoreLink => throw _privateConstructorUsedError;
  @JsonKey(name: "see_more_link_type")
  String? get seeMoreLinkType => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<OfferItemResponse>? get items => throw _privateConstructorUsedError;

  /// Serializes this OfferSubsectionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferSubsectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferSubsectionResponseCopyWith<OfferSubsectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferSubsectionResponseCopyWith<$Res> {
  factory $OfferSubsectionResponseCopyWith(
    OfferSubsectionResponse value,
    $Res Function(OfferSubsectionResponse) then,
  ) = _$OfferSubsectionResponseCopyWithImpl<$Res, OfferSubsectionResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "section_type") String? sectionType,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "see_more_link") String? seeMoreLink,
    @JsonKey(name: "see_more_link_type") String? seeMoreLinkType,
    @JsonKey(name: "items") List<OfferItemResponse>? items,
  });
}

/// @nodoc
class _$OfferSubsectionResponseCopyWithImpl<
  $Res,
  $Val extends OfferSubsectionResponse
>
    implements $OfferSubsectionResponseCopyWith<$Res> {
  _$OfferSubsectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferSubsectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionType = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? seeMoreLink = freezed,
    Object? seeMoreLinkType = freezed,
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
                        as String?,
            seeMoreLinkType:
                freezed == seeMoreLinkType
                    ? _value.seeMoreLinkType
                    : seeMoreLinkType // ignore: cast_nullable_to_non_nullable
                        as String?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<OfferItemResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfferSubsectionResponseImplCopyWith<$Res>
    implements $OfferSubsectionResponseCopyWith<$Res> {
  factory _$$OfferSubsectionResponseImplCopyWith(
    _$OfferSubsectionResponseImpl value,
    $Res Function(_$OfferSubsectionResponseImpl) then,
  ) = __$$OfferSubsectionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "section_type") String? sectionType,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "see_more_link") String? seeMoreLink,
    @JsonKey(name: "see_more_link_type") String? seeMoreLinkType,
    @JsonKey(name: "items") List<OfferItemResponse>? items,
  });
}

/// @nodoc
class __$$OfferSubsectionResponseImplCopyWithImpl<$Res>
    extends
        _$OfferSubsectionResponseCopyWithImpl<
          $Res,
          _$OfferSubsectionResponseImpl
        >
    implements _$$OfferSubsectionResponseImplCopyWith<$Res> {
  __$$OfferSubsectionResponseImplCopyWithImpl(
    _$OfferSubsectionResponseImpl _value,
    $Res Function(_$OfferSubsectionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfferSubsectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionType = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? seeMoreLink = freezed,
    Object? seeMoreLinkType = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _$OfferSubsectionResponseImpl(
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
                    as String?,
        seeMoreLinkType:
            freezed == seeMoreLinkType
                ? _value.seeMoreLinkType
                : seeMoreLinkType // ignore: cast_nullable_to_non_nullable
                    as String?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<OfferItemResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferSubsectionResponseImpl implements _OfferSubsectionResponse {
  const _$OfferSubsectionResponseImpl({
    @JsonKey(name: "section_type") this.sectionType,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "status") this.status,
    @JsonKey(name: "see_more_link") this.seeMoreLink,
    @JsonKey(name: "see_more_link_type") this.seeMoreLinkType,
    @JsonKey(name: "items") final List<OfferItemResponse>? items,
  }) : _items = items;

  factory _$OfferSubsectionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferSubsectionResponseImplFromJson(json);

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
  final String? seeMoreLink;
  @override
  @JsonKey(name: "see_more_link_type")
  final String? seeMoreLinkType;
  final List<OfferItemResponse>? _items;
  @override
  @JsonKey(name: "items")
  List<OfferItemResponse>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OfferSubsectionResponse(sectionType: $sectionType, title: $title, status: $status, seeMoreLink: $seeMoreLink, seeMoreLinkType: $seeMoreLinkType, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferSubsectionResponseImpl &&
            (identical(other.sectionType, sectionType) ||
                other.sectionType == sectionType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.seeMoreLink, seeMoreLink) ||
                other.seeMoreLink == seeMoreLink) &&
            (identical(other.seeMoreLinkType, seeMoreLinkType) ||
                other.seeMoreLinkType == seeMoreLinkType) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sectionType,
    title,
    status,
    seeMoreLink,
    seeMoreLinkType,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of OfferSubsectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferSubsectionResponseImplCopyWith<_$OfferSubsectionResponseImpl>
  get copyWith => __$$OfferSubsectionResponseImplCopyWithImpl<
    _$OfferSubsectionResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferSubsectionResponseImplToJson(this);
  }
}

abstract class _OfferSubsectionResponse implements OfferSubsectionResponse {
  const factory _OfferSubsectionResponse({
    @JsonKey(name: "section_type") final String? sectionType,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "status") final int? status,
    @JsonKey(name: "see_more_link") final String? seeMoreLink,
    @JsonKey(name: "see_more_link_type") final String? seeMoreLinkType,
    @JsonKey(name: "items") final List<OfferItemResponse>? items,
  }) = _$OfferSubsectionResponseImpl;

  factory _OfferSubsectionResponse.fromJson(Map<String, dynamic> json) =
      _$OfferSubsectionResponseImpl.fromJson;

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
  String? get seeMoreLink;
  @override
  @JsonKey(name: "see_more_link_type")
  String? get seeMoreLinkType;
  @override
  @JsonKey(name: "items")
  List<OfferItemResponse>? get items;

  /// Create a copy of OfferSubsectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferSubsectionResponseImplCopyWith<_$OfferSubsectionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OfferItemResponse _$OfferItemResponseFromJson(Map<String, dynamic> json) {
  return _OfferItemResponse.fromJson(json);
}

/// @nodoc
mixin _$OfferItemResponse {
  @JsonKey(name: "entity_id")
  int? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "item_type")
  String? get itemType => throw _privateConstructorUsedError;
  @JsonKey(name: "item_id")
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_type")
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_value")
  num? get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: "max_discount")
  num? get maxDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_filter")
  OfferDiscountFilterResponse? get discountFilter =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "sort_order")
  int? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this OfferItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferItemResponseCopyWith<OfferItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferItemResponseCopyWith<$Res> {
  factory $OfferItemResponseCopyWith(
    OfferItemResponse value,
    $Res Function(OfferItemResponse) then,
  ) = _$OfferItemResponseCopyWithImpl<$Res, OfferItemResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "item_type") String? itemType,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_value") num? discountValue,
    @JsonKey(name: "max_discount") num? maxDiscount,
    @JsonKey(name: "discount_filter")
    OfferDiscountFilterResponse? discountFilter,
    @JsonKey(name: "sort_order") int? sortOrder,
  });

  $OfferDiscountFilterResponseCopyWith<$Res>? get discountFilter;
}

/// @nodoc
class _$OfferItemResponseCopyWithImpl<$Res, $Val extends OfferItemResponse>
    implements $OfferItemResponseCopyWith<$Res> {
  _$OfferItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? itemType = freezed,
    Object? itemId = freezed,
    Object? link = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? maxDiscount = freezed,
    Object? discountFilter = freezed,
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
            discountType:
                freezed == discountType
                    ? _value.discountType
                    : discountType // ignore: cast_nullable_to_non_nullable
                        as String?,
            discountValue:
                freezed == discountValue
                    ? _value.discountValue
                    : discountValue // ignore: cast_nullable_to_non_nullable
                        as num?,
            maxDiscount:
                freezed == maxDiscount
                    ? _value.maxDiscount
                    : maxDiscount // ignore: cast_nullable_to_non_nullable
                        as num?,
            discountFilter:
                freezed == discountFilter
                    ? _value.discountFilter
                    : discountFilter // ignore: cast_nullable_to_non_nullable
                        as OfferDiscountFilterResponse?,
            sortOrder:
                freezed == sortOrder
                    ? _value.sortOrder
                    : sortOrder // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of OfferItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferDiscountFilterResponseCopyWith<$Res>? get discountFilter {
    if (_value.discountFilter == null) {
      return null;
    }

    return $OfferDiscountFilterResponseCopyWith<$Res>(_value.discountFilter!, (
      value,
    ) {
      return _then(_value.copyWith(discountFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfferItemResponseImplCopyWith<$Res>
    implements $OfferItemResponseCopyWith<$Res> {
  factory _$$OfferItemResponseImplCopyWith(
    _$OfferItemResponseImpl value,
    $Res Function(_$OfferItemResponseImpl) then,
  ) = __$$OfferItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") int? entityId,
    @JsonKey(name: "item_type") String? itemType,
    @JsonKey(name: "item_id") int? itemId,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_value") num? discountValue,
    @JsonKey(name: "max_discount") num? maxDiscount,
    @JsonKey(name: "discount_filter")
    OfferDiscountFilterResponse? discountFilter,
    @JsonKey(name: "sort_order") int? sortOrder,
  });

  @override
  $OfferDiscountFilterResponseCopyWith<$Res>? get discountFilter;
}

/// @nodoc
class __$$OfferItemResponseImplCopyWithImpl<$Res>
    extends _$OfferItemResponseCopyWithImpl<$Res, _$OfferItemResponseImpl>
    implements _$$OfferItemResponseImplCopyWith<$Res> {
  __$$OfferItemResponseImplCopyWithImpl(
    _$OfferItemResponseImpl _value,
    $Res Function(_$OfferItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfferItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? itemType = freezed,
    Object? itemId = freezed,
    Object? link = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? maxDiscount = freezed,
    Object? discountFilter = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$OfferItemResponseImpl(
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
        discountType:
            freezed == discountType
                ? _value.discountType
                : discountType // ignore: cast_nullable_to_non_nullable
                    as String?,
        discountValue:
            freezed == discountValue
                ? _value.discountValue
                : discountValue // ignore: cast_nullable_to_non_nullable
                    as num?,
        maxDiscount:
            freezed == maxDiscount
                ? _value.maxDiscount
                : maxDiscount // ignore: cast_nullable_to_non_nullable
                    as num?,
        discountFilter:
            freezed == discountFilter
                ? _value.discountFilter
                : discountFilter // ignore: cast_nullable_to_non_nullable
                    as OfferDiscountFilterResponse?,
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
class _$OfferItemResponseImpl implements _OfferItemResponse {
  const _$OfferItemResponseImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "item_type") this.itemType,
    @JsonKey(name: "item_id") this.itemId,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "image_url") this.imageUrl,
    @JsonKey(name: "discount_type") this.discountType,
    @JsonKey(name: "discount_value") this.discountValue,
    @JsonKey(name: "max_discount") this.maxDiscount,
    @JsonKey(name: "discount_filter") this.discountFilter,
    @JsonKey(name: "sort_order") this.sortOrder,
  });

  factory _$OfferItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferItemResponseImplFromJson(json);

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
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "discount_type")
  final String? discountType;
  @override
  @JsonKey(name: "discount_value")
  final num? discountValue;
  @override
  @JsonKey(name: "max_discount")
  final num? maxDiscount;
  @override
  @JsonKey(name: "discount_filter")
  final OfferDiscountFilterResponse? discountFilter;
  @override
  @JsonKey(name: "sort_order")
  final int? sortOrder;

  @override
  String toString() {
    return 'OfferItemResponse(entityId: $entityId, itemType: $itemType, itemId: $itemId, link: $link, name: $name, imageUrl: $imageUrl, discountType: $discountType, discountValue: $discountValue, maxDiscount: $maxDiscount, discountFilter: $discountFilter, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferItemResponseImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.discountFilter, discountFilter) ||
                other.discountFilter == discountFilter) &&
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
    link,
    name,
    imageUrl,
    discountType,
    discountValue,
    maxDiscount,
    discountFilter,
    sortOrder,
  );

  /// Create a copy of OfferItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferItemResponseImplCopyWith<_$OfferItemResponseImpl> get copyWith =>
      __$$OfferItemResponseImplCopyWithImpl<_$OfferItemResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferItemResponseImplToJson(this);
  }
}

abstract class _OfferItemResponse implements OfferItemResponse {
  const factory _OfferItemResponse({
    @JsonKey(name: "entity_id") final int? entityId,
    @JsonKey(name: "item_type") final String? itemType,
    @JsonKey(name: "item_id") final int? itemId,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "image_url") final String? imageUrl,
    @JsonKey(name: "discount_type") final String? discountType,
    @JsonKey(name: "discount_value") final num? discountValue,
    @JsonKey(name: "max_discount") final num? maxDiscount,
    @JsonKey(name: "discount_filter")
    final OfferDiscountFilterResponse? discountFilter,
    @JsonKey(name: "sort_order") final int? sortOrder,
  }) = _$OfferItemResponseImpl;

  factory _OfferItemResponse.fromJson(Map<String, dynamic> json) =
      _$OfferItemResponseImpl.fromJson;

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
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "discount_type")
  String? get discountType;
  @override
  @JsonKey(name: "discount_value")
  num? get discountValue;
  @override
  @JsonKey(name: "max_discount")
  num? get maxDiscount;
  @override
  @JsonKey(name: "discount_filter")
  OfferDiscountFilterResponse? get discountFilter;
  @override
  @JsonKey(name: "sort_order")
  int? get sortOrder;

  /// Create a copy of OfferItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferItemResponseImplCopyWith<_$OfferItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfferDiscountFilterResponse _$OfferDiscountFilterResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OfferDiscountFilterResponse.fromJson(json);
}

/// @nodoc
mixin _$OfferDiscountFilterResponse {
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  num? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "max_discount")
  num? get maxDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this OfferDiscountFilterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferDiscountFilterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferDiscountFilterResponseCopyWith<OfferDiscountFilterResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferDiscountFilterResponseCopyWith<$Res> {
  factory $OfferDiscountFilterResponseCopyWith(
    OfferDiscountFilterResponse value,
    $Res Function(OfferDiscountFilterResponse) then,
  ) =
      _$OfferDiscountFilterResponseCopyWithImpl<
        $Res,
        OfferDiscountFilterResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") num? value,
    @JsonKey(name: "max_discount") num? maxDiscount,
    @JsonKey(name: "url") String? url,
  });
}

/// @nodoc
class _$OfferDiscountFilterResponseCopyWithImpl<
  $Res,
  $Val extends OfferDiscountFilterResponse
>
    implements $OfferDiscountFilterResponseCopyWith<$Res> {
  _$OfferDiscountFilterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferDiscountFilterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? value = freezed,
    Object? maxDiscount = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _value.copyWith(
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as num?,
            maxDiscount:
                freezed == maxDiscount
                    ? _value.maxDiscount
                    : maxDiscount // ignore: cast_nullable_to_non_nullable
                        as num?,
            url:
                freezed == url
                    ? _value.url
                    : url // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfferDiscountFilterResponseImplCopyWith<$Res>
    implements $OfferDiscountFilterResponseCopyWith<$Res> {
  factory _$$OfferDiscountFilterResponseImplCopyWith(
    _$OfferDiscountFilterResponseImpl value,
    $Res Function(_$OfferDiscountFilterResponseImpl) then,
  ) = __$$OfferDiscountFilterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") num? value,
    @JsonKey(name: "max_discount") num? maxDiscount,
    @JsonKey(name: "url") String? url,
  });
}

/// @nodoc
class __$$OfferDiscountFilterResponseImplCopyWithImpl<$Res>
    extends
        _$OfferDiscountFilterResponseCopyWithImpl<
          $Res,
          _$OfferDiscountFilterResponseImpl
        >
    implements _$$OfferDiscountFilterResponseImplCopyWith<$Res> {
  __$$OfferDiscountFilterResponseImplCopyWithImpl(
    _$OfferDiscountFilterResponseImpl _value,
    $Res Function(_$OfferDiscountFilterResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfferDiscountFilterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? value = freezed,
    Object? maxDiscount = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _$OfferDiscountFilterResponseImpl(
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as num?,
        maxDiscount:
            freezed == maxDiscount
                ? _value.maxDiscount
                : maxDiscount // ignore: cast_nullable_to_non_nullable
                    as num?,
        url:
            freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferDiscountFilterResponseImpl
    implements _OfferDiscountFilterResponse {
  const _$OfferDiscountFilterResponseImpl({
    @JsonKey(name: "type") this.type,
    @JsonKey(name: "value") this.value,
    @JsonKey(name: "max_discount") this.maxDiscount,
    @JsonKey(name: "url") this.url,
  });

  factory _$OfferDiscountFilterResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$OfferDiscountFilterResponseImplFromJson(json);

  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "value")
  final num? value;
  @override
  @JsonKey(name: "max_discount")
  final num? maxDiscount;
  @override
  @JsonKey(name: "url")
  final String? url;

  @override
  String toString() {
    return 'OfferDiscountFilterResponse(type: $type, value: $value, maxDiscount: $maxDiscount, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferDiscountFilterResponseImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, value, maxDiscount, url);

  /// Create a copy of OfferDiscountFilterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferDiscountFilterResponseImplCopyWith<_$OfferDiscountFilterResponseImpl>
  get copyWith => __$$OfferDiscountFilterResponseImplCopyWithImpl<
    _$OfferDiscountFilterResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferDiscountFilterResponseImplToJson(this);
  }
}

abstract class _OfferDiscountFilterResponse
    implements OfferDiscountFilterResponse {
  const factory _OfferDiscountFilterResponse({
    @JsonKey(name: "type") final String? type,
    @JsonKey(name: "value") final num? value,
    @JsonKey(name: "max_discount") final num? maxDiscount,
    @JsonKey(name: "url") final String? url,
  }) = _$OfferDiscountFilterResponseImpl;

  factory _OfferDiscountFilterResponse.fromJson(Map<String, dynamic> json) =
      _$OfferDiscountFilterResponseImpl.fromJson;

  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "value")
  num? get value;
  @override
  @JsonKey(name: "max_discount")
  num? get maxDiscount;
  @override
  @JsonKey(name: "url")
  String? get url;

  /// Create a copy of OfferDiscountFilterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferDiscountFilterResponseImplCopyWith<_$OfferDiscountFilterResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
