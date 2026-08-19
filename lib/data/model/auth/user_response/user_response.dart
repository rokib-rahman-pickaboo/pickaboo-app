import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
@HiveType(typeId: 3, adapterName: 'UserResponseAdapter')
class UserResponse with _$UserResponse {
  const factory UserResponse({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "group_id") int? groupId,
    @HiveField(2) @JsonKey(name: "default_shipping") String? defaultShipping,
    @HiveField(3) @JsonKey(name: "created_at") DateTime? createdAt,
    @HiveField(4) @JsonKey(name: "updated_at") DateTime? updatedAt,
    @HiveField(5) @JsonKey(name: "created_in") String? createdIn,
    @HiveField(6) @JsonKey(name: "dob") DateTime? dob,
    @HiveField(7) @JsonKey(name: "email") String? email,
    @HiveField(8) @JsonKey(name: "firstname") String? firstname,
    @HiveField(9) @JsonKey(name: "lastname") String? lastname,
    @HiveField(10) @JsonKey(name: "gender") int? gender,
    @HiveField(11) @JsonKey(name: "store_id") int? storeId,
    @HiveField(12) @JsonKey(name: "website_id") int? websiteId,
    @HiveField(13) @JsonKey(name: "addresses") List<Address>? addresses,
    @HiveField(14)
    @JsonKey(name: "disable_auto_group_change")
    int? disableAutoGroupChange,
    @HiveField(15)
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
    @HiveField(16)
    @JsonKey(name: "custom_attributes")
    List<CustomAttribute>? customAttributes,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
@HiveType(typeId: 4, adapterName: 'AddressAdapter')
class Address with _$Address {
  const factory Address({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "customer_id") int? customerId,
    @HiveField(2) @JsonKey(name: "region") Region? region,
    @HiveField(3) @JsonKey(name: "region_id") int? regionId,
    @HiveField(4) @JsonKey(name: "country_id") String? countryId,
    @HiveField(5) @JsonKey(name: "street") List<String>? street,
    @HiveField(6) @JsonKey(name: "telephone") String? telephone,
    @HiveField(7) @JsonKey(name: "postcode") String? postcode,
    @HiveField(8) @JsonKey(name: "city") String? city,
    @HiveField(9) @JsonKey(name: "firstname") String? firstname,
    @HiveField(10) @JsonKey(name: "lastname") String? lastname,
    @HiveField(11) @JsonKey(name: "default_shipping") bool? defaultShipping,
    @HiveField(12) @JsonKey(name: "default_billing") bool? defaultBilling,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
@HiveType(typeId: 5, adapterName: 'RegionAdapter')
class Region with _$Region {
  const factory Region({
    @HiveField(0) @JsonKey(name: "region_code") String? regionCode,
    @HiveField(1) @JsonKey(name: "region") String? region,
    @HiveField(2) @JsonKey(name: "region_id") int? regionId,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}

@freezed
@HiveType(typeId: 6, adapterName: 'CustomAttributeAdapter')
class CustomAttribute with _$CustomAttribute {
  const factory CustomAttribute({
    @HiveField(0) @JsonKey(name: "attribute_code") String? attributeCode,
    @HiveField(1) @JsonKey(name: "value") String? value,
  }) = _CustomAttribute;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeFromJson(json);
}

@freezed
@HiveType(typeId: 7, adapterName: 'ExtensionAttributesAdapter')
class ExtensionAttributes with _$ExtensionAttributes {
  const factory ExtensionAttributes({
    @HiveField(0) @JsonKey(name: "is_subscribed") bool? isSubscribed,
  }) = _ExtensionAttributes;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);
}
