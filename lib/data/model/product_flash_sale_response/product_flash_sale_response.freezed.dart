// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_flash_sale_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductFlashSaleResponse _$ProductFlashSaleResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProductFlashSaleResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductFlashSaleResponse {
  @JsonKey(name: "in_flash_sale")
  bool? get inFlashSale => throw _privateConstructorUsedError;
  @JsonKey(name: "flash_sale")
  FlashSale? get flashSale => throw _privateConstructorUsedError;

  /// Serializes this ProductFlashSaleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductFlashSaleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductFlashSaleResponseCopyWith<ProductFlashSaleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFlashSaleResponseCopyWith<$Res> {
  factory $ProductFlashSaleResponseCopyWith(
    ProductFlashSaleResponse value,
    $Res Function(ProductFlashSaleResponse) then,
  ) = _$ProductFlashSaleResponseCopyWithImpl<$Res, ProductFlashSaleResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "in_flash_sale") bool? inFlashSale,
    @JsonKey(name: "flash_sale") FlashSale? flashSale,
  });

  $FlashSaleCopyWith<$Res>? get flashSale;
}

/// @nodoc
class _$ProductFlashSaleResponseCopyWithImpl<
  $Res,
  $Val extends ProductFlashSaleResponse
>
    implements $ProductFlashSaleResponseCopyWith<$Res> {
  _$ProductFlashSaleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFlashSaleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? inFlashSale = freezed, Object? flashSale = freezed}) {
    return _then(
      _value.copyWith(
            inFlashSale:
                freezed == inFlashSale
                    ? _value.inFlashSale
                    : inFlashSale // ignore: cast_nullable_to_non_nullable
                        as bool?,
            flashSale:
                freezed == flashSale
                    ? _value.flashSale
                    : flashSale // ignore: cast_nullable_to_non_nullable
                        as FlashSale?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProductFlashSaleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlashSaleCopyWith<$Res>? get flashSale {
    if (_value.flashSale == null) {
      return null;
    }

    return $FlashSaleCopyWith<$Res>(_value.flashSale!, (value) {
      return _then(_value.copyWith(flashSale: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductFlashSaleResponseImplCopyWith<$Res>
    implements $ProductFlashSaleResponseCopyWith<$Res> {
  factory _$$ProductFlashSaleResponseImplCopyWith(
    _$ProductFlashSaleResponseImpl value,
    $Res Function(_$ProductFlashSaleResponseImpl) then,
  ) = __$$ProductFlashSaleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "in_flash_sale") bool? inFlashSale,
    @JsonKey(name: "flash_sale") FlashSale? flashSale,
  });

  @override
  $FlashSaleCopyWith<$Res>? get flashSale;
}

/// @nodoc
class __$$ProductFlashSaleResponseImplCopyWithImpl<$Res>
    extends
        _$ProductFlashSaleResponseCopyWithImpl<
          $Res,
          _$ProductFlashSaleResponseImpl
        >
    implements _$$ProductFlashSaleResponseImplCopyWith<$Res> {
  __$$ProductFlashSaleResponseImplCopyWithImpl(
    _$ProductFlashSaleResponseImpl _value,
    $Res Function(_$ProductFlashSaleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductFlashSaleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? inFlashSale = freezed, Object? flashSale = freezed}) {
    return _then(
      _$ProductFlashSaleResponseImpl(
        inFlashSale:
            freezed == inFlashSale
                ? _value.inFlashSale
                : inFlashSale // ignore: cast_nullable_to_non_nullable
                    as bool?,
        flashSale:
            freezed == flashSale
                ? _value.flashSale
                : flashSale // ignore: cast_nullable_to_non_nullable
                    as FlashSale?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFlashSaleResponseImpl implements _ProductFlashSaleResponse {
  const _$ProductFlashSaleResponseImpl({
    @JsonKey(name: "in_flash_sale") this.inFlashSale,
    @JsonKey(name: "flash_sale") this.flashSale,
  });

  factory _$ProductFlashSaleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFlashSaleResponseImplFromJson(json);

  @override
  @JsonKey(name: "in_flash_sale")
  final bool? inFlashSale;
  @override
  @JsonKey(name: "flash_sale")
  final FlashSale? flashSale;

  @override
  String toString() {
    return 'ProductFlashSaleResponse(inFlashSale: $inFlashSale, flashSale: $flashSale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFlashSaleResponseImpl &&
            (identical(other.inFlashSale, inFlashSale) ||
                other.inFlashSale == inFlashSale) &&
            (identical(other.flashSale, flashSale) ||
                other.flashSale == flashSale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, inFlashSale, flashSale);

  /// Create a copy of ProductFlashSaleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFlashSaleResponseImplCopyWith<_$ProductFlashSaleResponseImpl>
  get copyWith => __$$ProductFlashSaleResponseImplCopyWithImpl<
    _$ProductFlashSaleResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFlashSaleResponseImplToJson(this);
  }
}

abstract class _ProductFlashSaleResponse implements ProductFlashSaleResponse {
  const factory _ProductFlashSaleResponse({
    @JsonKey(name: "in_flash_sale") final bool? inFlashSale,
    @JsonKey(name: "flash_sale") final FlashSale? flashSale,
  }) = _$ProductFlashSaleResponseImpl;

  factory _ProductFlashSaleResponse.fromJson(Map<String, dynamic> json) =
      _$ProductFlashSaleResponseImpl.fromJson;

  @override
  @JsonKey(name: "in_flash_sale")
  bool? get inFlashSale;
  @override
  @JsonKey(name: "flash_sale")
  FlashSale? get flashSale;

  /// Create a copy of ProductFlashSaleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductFlashSaleResponseImplCopyWith<_$ProductFlashSaleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FlashSale _$FlashSaleFromJson(Map<String, dynamic> json) {
  return _FlashSale.fromJson(json);
}

/// @nodoc
mixin _$FlashSale {
  @JsonKey(name: "sale_id")
  int? get saleId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: "short_description")
  String? get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "is_upcoming")
  bool? get isUpcoming => throw _privateConstructorUsedError;
  @JsonKey(name: "banner_image_url")
  String? get bannerImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "banner_mobile_image_url")
  String? get bannerMobileImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "banner_link_type")
  String? get bannerLinkType => throw _privateConstructorUsedError;
  @JsonKey(name: "banner_link_value")
  String? get bannerLinkValue => throw _privateConstructorUsedError;

  /// Serializes this FlashSale to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashSale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashSaleCopyWith<FlashSale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashSaleCopyWith<$Res> {
  factory $FlashSaleCopyWith(FlashSale value, $Res Function(FlashSale) then) =
      _$FlashSaleCopyWithImpl<$Res, FlashSale>;
  @useResult
  $Res call({
    @JsonKey(name: "sale_id") int? saleId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "start_time") DateTime? startTime,
    @JsonKey(name: "end_time") DateTime? endTime,
    @JsonKey(name: "short_description") String? shortDescription,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "is_upcoming") bool? isUpcoming,
    @JsonKey(name: "banner_image_url") String? bannerImageUrl,
    @JsonKey(name: "banner_mobile_image_url") String? bannerMobileImageUrl,
    @JsonKey(name: "banner_link_type") String? bannerLinkType,
    @JsonKey(name: "banner_link_value") String? bannerLinkValue,
  });
}

/// @nodoc
class _$FlashSaleCopyWithImpl<$Res, $Val extends FlashSale>
    implements $FlashSaleCopyWith<$Res> {
  _$FlashSaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashSale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleId = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? isUpcoming = freezed,
    Object? bannerImageUrl = freezed,
    Object? bannerMobileImageUrl = freezed,
    Object? bannerLinkType = freezed,
    Object? bannerLinkValue = freezed,
  }) {
    return _then(
      _value.copyWith(
            saleId:
                freezed == saleId
                    ? _value.saleId
                    : saleId // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            slug:
                freezed == slug
                    ? _value.slug
                    : slug // ignore: cast_nullable_to_non_nullable
                        as String?,
            startTime:
                freezed == startTime
                    ? _value.startTime
                    : startTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            endTime:
                freezed == endTime
                    ? _value.endTime
                    : endTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            shortDescription:
                freezed == shortDescription
                    ? _value.shortDescription
                    : shortDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            isUpcoming:
                freezed == isUpcoming
                    ? _value.isUpcoming
                    : isUpcoming // ignore: cast_nullable_to_non_nullable
                        as bool?,
            bannerImageUrl:
                freezed == bannerImageUrl
                    ? _value.bannerImageUrl
                    : bannerImageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            bannerMobileImageUrl:
                freezed == bannerMobileImageUrl
                    ? _value.bannerMobileImageUrl
                    : bannerMobileImageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            bannerLinkType:
                freezed == bannerLinkType
                    ? _value.bannerLinkType
                    : bannerLinkType // ignore: cast_nullable_to_non_nullable
                        as String?,
            bannerLinkValue:
                freezed == bannerLinkValue
                    ? _value.bannerLinkValue
                    : bannerLinkValue // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlashSaleImplCopyWith<$Res>
    implements $FlashSaleCopyWith<$Res> {
  factory _$$FlashSaleImplCopyWith(
    _$FlashSaleImpl value,
    $Res Function(_$FlashSaleImpl) then,
  ) = __$$FlashSaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "sale_id") int? saleId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "start_time") DateTime? startTime,
    @JsonKey(name: "end_time") DateTime? endTime,
    @JsonKey(name: "short_description") String? shortDescription,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "is_upcoming") bool? isUpcoming,
    @JsonKey(name: "banner_image_url") String? bannerImageUrl,
    @JsonKey(name: "banner_mobile_image_url") String? bannerMobileImageUrl,
    @JsonKey(name: "banner_link_type") String? bannerLinkType,
    @JsonKey(name: "banner_link_value") String? bannerLinkValue,
  });
}

/// @nodoc
class __$$FlashSaleImplCopyWithImpl<$Res>
    extends _$FlashSaleCopyWithImpl<$Res, _$FlashSaleImpl>
    implements _$$FlashSaleImplCopyWith<$Res> {
  __$$FlashSaleImplCopyWithImpl(
    _$FlashSaleImpl _value,
    $Res Function(_$FlashSaleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlashSale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleId = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? isUpcoming = freezed,
    Object? bannerImageUrl = freezed,
    Object? bannerMobileImageUrl = freezed,
    Object? bannerLinkType = freezed,
    Object? bannerLinkValue = freezed,
  }) {
    return _then(
      _$FlashSaleImpl(
        saleId:
            freezed == saleId
                ? _value.saleId
                : saleId // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        slug:
            freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                    as String?,
        startTime:
            freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        endTime:
            freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        shortDescription:
            freezed == shortDescription
                ? _value.shortDescription
                : shortDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        isUpcoming:
            freezed == isUpcoming
                ? _value.isUpcoming
                : isUpcoming // ignore: cast_nullable_to_non_nullable
                    as bool?,
        bannerImageUrl:
            freezed == bannerImageUrl
                ? _value.bannerImageUrl
                : bannerImageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        bannerMobileImageUrl:
            freezed == bannerMobileImageUrl
                ? _value.bannerMobileImageUrl
                : bannerMobileImageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        bannerLinkType:
            freezed == bannerLinkType
                ? _value.bannerLinkType
                : bannerLinkType // ignore: cast_nullable_to_non_nullable
                    as String?,
        bannerLinkValue:
            freezed == bannerLinkValue
                ? _value.bannerLinkValue
                : bannerLinkValue // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashSaleImpl implements _FlashSale {
  const _$FlashSaleImpl({
    @JsonKey(name: "sale_id") this.saleId,
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "slug") this.slug,
    @JsonKey(name: "start_time") this.startTime,
    @JsonKey(name: "end_time") this.endTime,
    @JsonKey(name: "short_description") this.shortDescription,
    @JsonKey(name: "description") this.description,
    @JsonKey(name: "is_upcoming") this.isUpcoming,
    @JsonKey(name: "banner_image_url") this.bannerImageUrl,
    @JsonKey(name: "banner_mobile_image_url") this.bannerMobileImageUrl,
    @JsonKey(name: "banner_link_type") this.bannerLinkType,
    @JsonKey(name: "banner_link_value") this.bannerLinkValue,
  });

  factory _$FlashSaleImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashSaleImplFromJson(json);

  @override
  @JsonKey(name: "sale_id")
  final int? saleId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @JsonKey(name: "start_time")
  final DateTime? startTime;
  @override
  @JsonKey(name: "end_time")
  final DateTime? endTime;
  @override
  @JsonKey(name: "short_description")
  final String? shortDescription;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "is_upcoming")
  final bool? isUpcoming;
  @override
  @JsonKey(name: "banner_image_url")
  final String? bannerImageUrl;
  @override
  @JsonKey(name: "banner_mobile_image_url")
  final String? bannerMobileImageUrl;
  @override
  @JsonKey(name: "banner_link_type")
  final String? bannerLinkType;
  @override
  @JsonKey(name: "banner_link_value")
  final String? bannerLinkValue;

  @override
  String toString() {
    return 'FlashSale(saleId: $saleId, title: $title, slug: $slug, startTime: $startTime, endTime: $endTime, shortDescription: $shortDescription, description: $description, isUpcoming: $isUpcoming, bannerImageUrl: $bannerImageUrl, bannerMobileImageUrl: $bannerMobileImageUrl, bannerLinkType: $bannerLinkType, bannerLinkValue: $bannerLinkValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashSaleImpl &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isUpcoming, isUpcoming) ||
                other.isUpcoming == isUpcoming) &&
            (identical(other.bannerImageUrl, bannerImageUrl) ||
                other.bannerImageUrl == bannerImageUrl) &&
            (identical(other.bannerMobileImageUrl, bannerMobileImageUrl) ||
                other.bannerMobileImageUrl == bannerMobileImageUrl) &&
            (identical(other.bannerLinkType, bannerLinkType) ||
                other.bannerLinkType == bannerLinkType) &&
            (identical(other.bannerLinkValue, bannerLinkValue) ||
                other.bannerLinkValue == bannerLinkValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    saleId,
    title,
    slug,
    startTime,
    endTime,
    shortDescription,
    description,
    isUpcoming,
    bannerImageUrl,
    bannerMobileImageUrl,
    bannerLinkType,
    bannerLinkValue,
  );

  /// Create a copy of FlashSale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashSaleImplCopyWith<_$FlashSaleImpl> get copyWith =>
      __$$FlashSaleImplCopyWithImpl<_$FlashSaleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashSaleImplToJson(this);
  }
}

abstract class _FlashSale implements FlashSale {
  const factory _FlashSale({
    @JsonKey(name: "sale_id") final int? saleId,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "slug") final String? slug,
    @JsonKey(name: "start_time") final DateTime? startTime,
    @JsonKey(name: "end_time") final DateTime? endTime,
    @JsonKey(name: "short_description") final String? shortDescription,
    @JsonKey(name: "description") final String? description,
    @JsonKey(name: "is_upcoming") final bool? isUpcoming,
    @JsonKey(name: "banner_image_url") final String? bannerImageUrl,
    @JsonKey(name: "banner_mobile_image_url")
    final String? bannerMobileImageUrl,
    @JsonKey(name: "banner_link_type") final String? bannerLinkType,
    @JsonKey(name: "banner_link_value") final String? bannerLinkValue,
  }) = _$FlashSaleImpl;

  factory _FlashSale.fromJson(Map<String, dynamic> json) =
      _$FlashSaleImpl.fromJson;

  @override
  @JsonKey(name: "sale_id")
  int? get saleId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "start_time")
  DateTime? get startTime;
  @override
  @JsonKey(name: "end_time")
  DateTime? get endTime;
  @override
  @JsonKey(name: "short_description")
  String? get shortDescription;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "is_upcoming")
  bool? get isUpcoming;
  @override
  @JsonKey(name: "banner_image_url")
  String? get bannerImageUrl;
  @override
  @JsonKey(name: "banner_mobile_image_url")
  String? get bannerMobileImageUrl;
  @override
  @JsonKey(name: "banner_link_type")
  String? get bannerLinkType;
  @override
  @JsonKey(name: "banner_link_value")
  String? get bannerLinkValue;

  /// Create a copy of FlashSale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashSaleImplCopyWith<_$FlashSaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
