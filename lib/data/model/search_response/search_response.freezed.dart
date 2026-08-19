// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return _SearchResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchResponse {
  @JsonKey(name: "totalItems")
  int? get totalItems => throw _privateConstructorUsedError;
  @JsonKey(name: "startIndex")
  int? get startIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "itemsPerPage")
  int? get itemsPerPage => throw _privateConstructorUsedError;
  @JsonKey(name: "currentItemCount")
  int? get currentItemCount => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<Item>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "suggestions")
  List<String>? get suggestions => throw _privateConstructorUsedError;
  @JsonKey(name: "categories")
  List<SearchCategory>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "correctedQuery")
  String? get correctedQuery => throw _privateConstructorUsedError;
  @JsonKey(name: "facets")
  List<SearchFacetResponse>? get facets => throw _privateConstructorUsedError;

  /// Serializes this SearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResponseCopyWith<SearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseCopyWith<$Res> {
  factory $SearchResponseCopyWith(
    SearchResponse value,
    $Res Function(SearchResponse) then,
  ) = _$SearchResponseCopyWithImpl<$Res, SearchResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "totalItems") int? totalItems,
    @JsonKey(name: "startIndex") int? startIndex,
    @JsonKey(name: "itemsPerPage") int? itemsPerPage,
    @JsonKey(name: "currentItemCount") int? currentItemCount,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "suggestions") List<String>? suggestions,
    @JsonKey(name: "categories") List<SearchCategory>? categories,
    @JsonKey(name: "correctedQuery") String? correctedQuery,
    @JsonKey(name: "facets") List<SearchFacetResponse>? facets,
  });
}

/// @nodoc
class _$SearchResponseCopyWithImpl<$Res, $Val extends SearchResponse>
    implements $SearchResponseCopyWith<$Res> {
  _$SearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = freezed,
    Object? startIndex = freezed,
    Object? itemsPerPage = freezed,
    Object? currentItemCount = freezed,
    Object? items = freezed,
    Object? suggestions = freezed,
    Object? categories = freezed,
    Object? correctedQuery = freezed,
    Object? facets = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalItems:
                freezed == totalItems
                    ? _value.totalItems
                    : totalItems // ignore: cast_nullable_to_non_nullable
                        as int?,
            startIndex:
                freezed == startIndex
                    ? _value.startIndex
                    : startIndex // ignore: cast_nullable_to_non_nullable
                        as int?,
            itemsPerPage:
                freezed == itemsPerPage
                    ? _value.itemsPerPage
                    : itemsPerPage // ignore: cast_nullable_to_non_nullable
                        as int?,
            currentItemCount:
                freezed == currentItemCount
                    ? _value.currentItemCount
                    : currentItemCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            items:
                freezed == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<Item>?,
            suggestions:
                freezed == suggestions
                    ? _value.suggestions
                    : suggestions // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            categories:
                freezed == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<SearchCategory>?,
            correctedQuery:
                freezed == correctedQuery
                    ? _value.correctedQuery
                    : correctedQuery // ignore: cast_nullable_to_non_nullable
                        as String?,
            facets:
                freezed == facets
                    ? _value.facets
                    : facets // ignore: cast_nullable_to_non_nullable
                        as List<SearchFacetResponse>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchResponseImplCopyWith<$Res>
    implements $SearchResponseCopyWith<$Res> {
  factory _$$SearchResponseImplCopyWith(
    _$SearchResponseImpl value,
    $Res Function(_$SearchResponseImpl) then,
  ) = __$$SearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "totalItems") int? totalItems,
    @JsonKey(name: "startIndex") int? startIndex,
    @JsonKey(name: "itemsPerPage") int? itemsPerPage,
    @JsonKey(name: "currentItemCount") int? currentItemCount,
    @JsonKey(name: "items") List<Item>? items,
    @JsonKey(name: "suggestions") List<String>? suggestions,
    @JsonKey(name: "categories") List<SearchCategory>? categories,
    @JsonKey(name: "correctedQuery") String? correctedQuery,
    @JsonKey(name: "facets") List<SearchFacetResponse>? facets,
  });
}

/// @nodoc
class __$$SearchResponseImplCopyWithImpl<$Res>
    extends _$SearchResponseCopyWithImpl<$Res, _$SearchResponseImpl>
    implements _$$SearchResponseImplCopyWith<$Res> {
  __$$SearchResponseImplCopyWithImpl(
    _$SearchResponseImpl _value,
    $Res Function(_$SearchResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = freezed,
    Object? startIndex = freezed,
    Object? itemsPerPage = freezed,
    Object? currentItemCount = freezed,
    Object? items = freezed,
    Object? suggestions = freezed,
    Object? categories = freezed,
    Object? correctedQuery = freezed,
    Object? facets = freezed,
  }) {
    return _then(
      _$SearchResponseImpl(
        totalItems:
            freezed == totalItems
                ? _value.totalItems
                : totalItems // ignore: cast_nullable_to_non_nullable
                    as int?,
        startIndex:
            freezed == startIndex
                ? _value.startIndex
                : startIndex // ignore: cast_nullable_to_non_nullable
                    as int?,
        itemsPerPage:
            freezed == itemsPerPage
                ? _value.itemsPerPage
                : itemsPerPage // ignore: cast_nullable_to_non_nullable
                    as int?,
        currentItemCount:
            freezed == currentItemCount
                ? _value.currentItemCount
                : currentItemCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        items:
            freezed == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<Item>?,
        suggestions:
            freezed == suggestions
                ? _value._suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        categories:
            freezed == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<SearchCategory>?,
        correctedQuery:
            freezed == correctedQuery
                ? _value.correctedQuery
                : correctedQuery // ignore: cast_nullable_to_non_nullable
                    as String?,
        facets:
            freezed == facets
                ? _value._facets
                : facets // ignore: cast_nullable_to_non_nullable
                    as List<SearchFacetResponse>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResponseImpl implements _SearchResponse {
  const _$SearchResponseImpl({
    @JsonKey(name: "totalItems") this.totalItems,
    @JsonKey(name: "startIndex") this.startIndex,
    @JsonKey(name: "itemsPerPage") this.itemsPerPage,
    @JsonKey(name: "currentItemCount") this.currentItemCount,
    @JsonKey(name: "items") final List<Item>? items,
    @JsonKey(name: "suggestions") final List<String>? suggestions,
    @JsonKey(name: "categories") final List<SearchCategory>? categories,
    @JsonKey(name: "correctedQuery") this.correctedQuery,
    @JsonKey(name: "facets") final List<SearchFacetResponse>? facets,
  }) : _items = items,
       _suggestions = suggestions,
       _categories = categories,
       _facets = facets;

  factory _$SearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResponseImplFromJson(json);

  @override
  @JsonKey(name: "totalItems")
  final int? totalItems;
  @override
  @JsonKey(name: "startIndex")
  final int? startIndex;
  @override
  @JsonKey(name: "itemsPerPage")
  final int? itemsPerPage;
  @override
  @JsonKey(name: "currentItemCount")
  final int? currentItemCount;
  final List<Item>? _items;
  @override
  @JsonKey(name: "items")
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _suggestions;
  @override
  @JsonKey(name: "suggestions")
  List<String>? get suggestions {
    final value = _suggestions;
    if (value == null) return null;
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SearchCategory>? _categories;
  @override
  @JsonKey(name: "categories")
  List<SearchCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "correctedQuery")
  final String? correctedQuery;
  final List<SearchFacetResponse>? _facets;
  @override
  @JsonKey(name: "facets")
  List<SearchFacetResponse>? get facets {
    final value = _facets;
    if (value == null) return null;
    if (_facets is EqualUnmodifiableListView) return _facets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchResponse(totalItems: $totalItems, startIndex: $startIndex, itemsPerPage: $itemsPerPage, currentItemCount: $currentItemCount, items: $items, suggestions: $suggestions, categories: $categories, correctedQuery: $correctedQuery, facets: $facets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseImpl &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.currentItemCount, currentItemCount) ||
                other.currentItemCount == currentItemCount) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._suggestions,
              _suggestions,
            ) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.correctedQuery, correctedQuery) ||
                other.correctedQuery == correctedQuery) &&
            const DeepCollectionEquality().equals(other._facets, _facets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalItems,
    startIndex,
    itemsPerPage,
    currentItemCount,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_suggestions),
    const DeepCollectionEquality().hash(_categories),
    correctedQuery,
    const DeepCollectionEquality().hash(_facets),
  );

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResponseImplCopyWith<_$SearchResponseImpl> get copyWith =>
      __$$SearchResponseImplCopyWithImpl<_$SearchResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResponseImplToJson(this);
  }
}

abstract class _SearchResponse implements SearchResponse {
  const factory _SearchResponse({
    @JsonKey(name: "totalItems") final int? totalItems,
    @JsonKey(name: "startIndex") final int? startIndex,
    @JsonKey(name: "itemsPerPage") final int? itemsPerPage,
    @JsonKey(name: "currentItemCount") final int? currentItemCount,
    @JsonKey(name: "items") final List<Item>? items,
    @JsonKey(name: "suggestions") final List<String>? suggestions,
    @JsonKey(name: "categories") final List<SearchCategory>? categories,
    @JsonKey(name: "correctedQuery") final String? correctedQuery,
    @JsonKey(name: "facets") final List<SearchFacetResponse>? facets,
  }) = _$SearchResponseImpl;

  factory _SearchResponse.fromJson(Map<String, dynamic> json) =
      _$SearchResponseImpl.fromJson;

  @override
  @JsonKey(name: "totalItems")
  int? get totalItems;
  @override
  @JsonKey(name: "startIndex")
  int? get startIndex;
  @override
  @JsonKey(name: "itemsPerPage")
  int? get itemsPerPage;
  @override
  @JsonKey(name: "currentItemCount")
  int? get currentItemCount;
  @override
  @JsonKey(name: "items")
  List<Item>? get items;
  @override
  @JsonKey(name: "suggestions")
  List<String>? get suggestions;
  @override
  @JsonKey(name: "categories")
  List<SearchCategory>? get categories;
  @override
  @JsonKey(name: "correctedQuery")
  String? get correctedQuery;
  @override
  @JsonKey(name: "facets")
  List<SearchFacetResponse>? get facets;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResponseImplCopyWith<_$SearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: "product_id")
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: "original_product_id")
  String? get originalProductId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "list_price")
  String? get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity")
  String? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "product_code")
  String? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: "image_link")
  String? get imageLink => throw _privateConstructorUsedError;
  @JsonKey(name: "total_reviews")
  String? get totalReviews => throw _privateConstructorUsedError;
  @JsonKey(name: "reviews_average_score")
  String? get reviewsAverageScore => throw _privateConstructorUsedError;
  @JsonKey(name: "url_key")
  String? get urlKey => throw _privateConstructorUsedError;
  @JsonKey(name: "type_id")
  String? get typeId => throw _privateConstructorUsedError;
  @JsonKey(name: "emi_available")
  String? get emiAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: "express_delivery")
  String? get expressDelivery => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call({
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "original_product_id") String? originalProductId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "list_price") String? listPrice,
    @JsonKey(name: "quantity") String? quantity,
    @JsonKey(name: "product_code") String? productCode,
    @JsonKey(name: "image_link") String? imageLink,
    @JsonKey(name: "total_reviews") String? totalReviews,
    @JsonKey(name: "reviews_average_score") String? reviewsAverageScore,
    @JsonKey(name: "url_key") String? urlKey,
    @JsonKey(name: "type_id") String? typeId,
    @JsonKey(name: "emi_available") String? emiAvailable,
    @JsonKey(name: "express_delivery") String? expressDelivery,
  });
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? originalProductId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? link = freezed,
    Object? price = freezed,
    Object? listPrice = freezed,
    Object? quantity = freezed,
    Object? productCode = freezed,
    Object? imageLink = freezed,
    Object? totalReviews = freezed,
    Object? reviewsAverageScore = freezed,
    Object? urlKey = freezed,
    Object? typeId = freezed,
    Object? emiAvailable = freezed,
    Object? expressDelivery = freezed,
  }) {
    return _then(
      _value.copyWith(
            productId:
                freezed == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as String?,
            originalProductId:
                freezed == originalProductId
                    ? _value.originalProductId
                    : originalProductId // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            link:
                freezed == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String?,
            price:
                freezed == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as String?,
            listPrice:
                freezed == listPrice
                    ? _value.listPrice
                    : listPrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            quantity:
                freezed == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as String?,
            productCode:
                freezed == productCode
                    ? _value.productCode
                    : productCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageLink:
                freezed == imageLink
                    ? _value.imageLink
                    : imageLink // ignore: cast_nullable_to_non_nullable
                        as String?,
            totalReviews:
                freezed == totalReviews
                    ? _value.totalReviews
                    : totalReviews // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviewsAverageScore:
                freezed == reviewsAverageScore
                    ? _value.reviewsAverageScore
                    : reviewsAverageScore // ignore: cast_nullable_to_non_nullable
                        as String?,
            urlKey:
                freezed == urlKey
                    ? _value.urlKey
                    : urlKey // ignore: cast_nullable_to_non_nullable
                        as String?,
            typeId:
                freezed == typeId
                    ? _value.typeId
                    : typeId // ignore: cast_nullable_to_non_nullable
                        as String?,
            emiAvailable:
                freezed == emiAvailable
                    ? _value.emiAvailable
                    : emiAvailable // ignore: cast_nullable_to_non_nullable
                        as String?,
            expressDelivery:
                freezed == expressDelivery
                    ? _value.expressDelivery
                    : expressDelivery // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
    _$ItemImpl value,
    $Res Function(_$ItemImpl) then,
  ) = __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "original_product_id") String? originalProductId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "list_price") String? listPrice,
    @JsonKey(name: "quantity") String? quantity,
    @JsonKey(name: "product_code") String? productCode,
    @JsonKey(name: "image_link") String? imageLink,
    @JsonKey(name: "total_reviews") String? totalReviews,
    @JsonKey(name: "reviews_average_score") String? reviewsAverageScore,
    @JsonKey(name: "url_key") String? urlKey,
    @JsonKey(name: "type_id") String? typeId,
    @JsonKey(name: "emi_available") String? emiAvailable,
    @JsonKey(name: "express_delivery") String? expressDelivery,
  });
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
    : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? originalProductId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? link = freezed,
    Object? price = freezed,
    Object? listPrice = freezed,
    Object? quantity = freezed,
    Object? productCode = freezed,
    Object? imageLink = freezed,
    Object? totalReviews = freezed,
    Object? reviewsAverageScore = freezed,
    Object? urlKey = freezed,
    Object? typeId = freezed,
    Object? emiAvailable = freezed,
    Object? expressDelivery = freezed,
  }) {
    return _then(
      _$ItemImpl(
        productId:
            freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String?,
        originalProductId:
            freezed == originalProductId
                ? _value.originalProductId
                : originalProductId // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        link:
            freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String?,
        price:
            freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as String?,
        listPrice:
            freezed == listPrice
                ? _value.listPrice
                : listPrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        quantity:
            freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as String?,
        productCode:
            freezed == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageLink:
            freezed == imageLink
                ? _value.imageLink
                : imageLink // ignore: cast_nullable_to_non_nullable
                    as String?,
        totalReviews:
            freezed == totalReviews
                ? _value.totalReviews
                : totalReviews // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviewsAverageScore:
            freezed == reviewsAverageScore
                ? _value.reviewsAverageScore
                : reviewsAverageScore // ignore: cast_nullable_to_non_nullable
                    as String?,
        urlKey:
            freezed == urlKey
                ? _value.urlKey
                : urlKey // ignore: cast_nullable_to_non_nullable
                    as String?,
        typeId:
            freezed == typeId
                ? _value.typeId
                : typeId // ignore: cast_nullable_to_non_nullable
                    as String?,
        emiAvailable:
            freezed == emiAvailable
                ? _value.emiAvailable
                : emiAvailable // ignore: cast_nullable_to_non_nullable
                    as String?,
        expressDelivery:
            freezed == expressDelivery
                ? _value.expressDelivery
                : expressDelivery // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl({
    @JsonKey(name: "product_id") this.productId,
    @JsonKey(name: "original_product_id") this.originalProductId,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "description") this.description,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "price") this.price,
    @JsonKey(name: "list_price") this.listPrice,
    @JsonKey(name: "quantity") this.quantity,
    @JsonKey(name: "product_code") this.productCode,
    @JsonKey(name: "image_link") this.imageLink,
    @JsonKey(name: "total_reviews") this.totalReviews,
    @JsonKey(name: "reviews_average_score") this.reviewsAverageScore,
    @JsonKey(name: "url_key") this.urlKey,
    @JsonKey(name: "type_id") this.typeId,
    @JsonKey(name: "emi_available") this.emiAvailable,
    @JsonKey(name: "express_delivery") this.expressDelivery,
  });

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final String? productId;
  @override
  @JsonKey(name: "original_product_id")
  final String? originalProductId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "price")
  final String? price;
  @override
  @JsonKey(name: "list_price")
  final String? listPrice;
  @override
  @JsonKey(name: "quantity")
  final String? quantity;
  @override
  @JsonKey(name: "product_code")
  final String? productCode;
  @override
  @JsonKey(name: "image_link")
  final String? imageLink;
  @override
  @JsonKey(name: "total_reviews")
  final String? totalReviews;
  @override
  @JsonKey(name: "reviews_average_score")
  final String? reviewsAverageScore;
  @override
  @JsonKey(name: "url_key")
  final String? urlKey;
  @override
  @JsonKey(name: "type_id")
  final String? typeId;
  @override
  @JsonKey(name: "emi_available")
  final String? emiAvailable;
  @override
  @JsonKey(name: "express_delivery")
  final String? expressDelivery;

  @override
  String toString() {
    return 'Item(productId: $productId, originalProductId: $originalProductId, title: $title, description: $description, link: $link, price: $price, listPrice: $listPrice, quantity: $quantity, productCode: $productCode, imageLink: $imageLink, totalReviews: $totalReviews, reviewsAverageScore: $reviewsAverageScore, urlKey: $urlKey, typeId: $typeId, emiAvailable: $emiAvailable, expressDelivery: $expressDelivery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.originalProductId, originalProductId) ||
                other.originalProductId == originalProductId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.listPrice, listPrice) ||
                other.listPrice == listPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            (identical(other.reviewsAverageScore, reviewsAverageScore) ||
                other.reviewsAverageScore == reviewsAverageScore) &&
            (identical(other.urlKey, urlKey) || other.urlKey == urlKey) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.emiAvailable, emiAvailable) ||
                other.emiAvailable == emiAvailable) &&
            (identical(other.expressDelivery, expressDelivery) ||
                other.expressDelivery == expressDelivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    originalProductId,
    title,
    description,
    link,
    price,
    listPrice,
    quantity,
    productCode,
    imageLink,
    totalReviews,
    reviewsAverageScore,
    urlKey,
    typeId,
    emiAvailable,
    expressDelivery,
  );

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item({
    @JsonKey(name: "product_id") final String? productId,
    @JsonKey(name: "original_product_id") final String? originalProductId,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "description") final String? description,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "price") final String? price,
    @JsonKey(name: "list_price") final String? listPrice,
    @JsonKey(name: "quantity") final String? quantity,
    @JsonKey(name: "product_code") final String? productCode,
    @JsonKey(name: "image_link") final String? imageLink,
    @JsonKey(name: "total_reviews") final String? totalReviews,
    @JsonKey(name: "reviews_average_score") final String? reviewsAverageScore,
    @JsonKey(name: "url_key") final String? urlKey,
    @JsonKey(name: "type_id") final String? typeId,
    @JsonKey(name: "emi_available") final String? emiAvailable,
    @JsonKey(name: "express_delivery") final String? expressDelivery,
  }) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  String? get productId;
  @override
  @JsonKey(name: "original_product_id")
  String? get originalProductId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "price")
  String? get price;
  @override
  @JsonKey(name: "list_price")
  String? get listPrice;
  @override
  @JsonKey(name: "quantity")
  String? get quantity;
  @override
  @JsonKey(name: "product_code")
  String? get productCode;
  @override
  @JsonKey(name: "image_link")
  String? get imageLink;
  @override
  @JsonKey(name: "total_reviews")
  String? get totalReviews;
  @override
  @JsonKey(name: "reviews_average_score")
  String? get reviewsAverageScore;
  @override
  @JsonKey(name: "url_key")
  String? get urlKey;
  @override
  @JsonKey(name: "type_id")
  String? get typeId;
  @override
  @JsonKey(name: "emi_available")
  String? get emiAvailable;
  @override
  @JsonKey(name: "express_delivery")
  String? get expressDelivery;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchCategory _$SearchCategoryFromJson(Map<String, dynamic> json) {
  return _SearchCategory.fromJson(json);
}

/// @nodoc
mixin _$SearchCategory {
  @JsonKey(name: "category_id")
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "image_link")
  String? get imageLink => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SearchCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchCategoryCopyWith<SearchCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCategoryCopyWith<$Res> {
  factory $SearchCategoryCopyWith(
    SearchCategory value,
    $Res Function(SearchCategory) then,
  ) = _$SearchCategoryCopyWithImpl<$Res, SearchCategory>;
  @useResult
  $Res call({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "image_link") String? imageLink,
    @JsonKey(name: "description") String? description,
  });
}

/// @nodoc
class _$SearchCategoryCopyWithImpl<$Res, $Val extends SearchCategory>
    implements $SearchCategoryCopyWith<$Res> {
  _$SearchCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? imageLink = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            link:
                freezed == link
                    ? _value.link
                    : link // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageLink:
                freezed == imageLink
                    ? _value.imageLink
                    : imageLink // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchCategoryImplCopyWith<$Res>
    implements $SearchCategoryCopyWith<$Res> {
  factory _$$SearchCategoryImplCopyWith(
    _$SearchCategoryImpl value,
    $Res Function(_$SearchCategoryImpl) then,
  ) = __$$SearchCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "image_link") String? imageLink,
    @JsonKey(name: "description") String? description,
  });
}

/// @nodoc
class __$$SearchCategoryImplCopyWithImpl<$Res>
    extends _$SearchCategoryCopyWithImpl<$Res, _$SearchCategoryImpl>
    implements _$$SearchCategoryImplCopyWith<$Res> {
  __$$SearchCategoryImplCopyWithImpl(
    _$SearchCategoryImpl _value,
    $Res Function(_$SearchCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? imageLink = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$SearchCategoryImpl(
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        link:
            freezed == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageLink:
            freezed == imageLink
                ? _value.imageLink
                : imageLink // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchCategoryImpl implements _SearchCategory {
  const _$SearchCategoryImpl({
    @JsonKey(name: "category_id") this.categoryId,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "link") this.link,
    @JsonKey(name: "image_link") this.imageLink,
    @JsonKey(name: "description") this.description,
  });

  factory _$SearchCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchCategoryImplFromJson(json);

  @override
  @JsonKey(name: "category_id")
  final String? categoryId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "image_link")
  final String? imageLink;
  @override
  @JsonKey(name: "description")
  final String? description;

  @override
  String toString() {
    return 'SearchCategory(categoryId: $categoryId, title: $title, link: $link, imageLink: $imageLink, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imageLink, imageLink) ||
                other.imageLink == imageLink) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, title, link, imageLink, description);

  /// Create a copy of SearchCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCategoryImplCopyWith<_$SearchCategoryImpl> get copyWith =>
      __$$SearchCategoryImplCopyWithImpl<_$SearchCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchCategoryImplToJson(this);
  }
}

abstract class _SearchCategory implements SearchCategory {
  const factory _SearchCategory({
    @JsonKey(name: "category_id") final String? categoryId,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "link") final String? link,
    @JsonKey(name: "image_link") final String? imageLink,
    @JsonKey(name: "description") final String? description,
  }) = _$SearchCategoryImpl;

  factory _SearchCategory.fromJson(Map<String, dynamic> json) =
      _$SearchCategoryImpl.fromJson;

  @override
  @JsonKey(name: "category_id")
  String? get categoryId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "image_link")
  String? get imageLink;
  @override
  @JsonKey(name: "description")
  String? get description;

  /// Create a copy of SearchCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCategoryImplCopyWith<_$SearchCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
