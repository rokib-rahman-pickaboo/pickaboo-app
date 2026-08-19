// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserResponseAdapter extends TypeAdapter<UserResponse> {
  @override
  final int typeId = 3;

  @override
  UserResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserResponse(
      id: fields[0] as int?,
      groupId: fields[1] as int?,
      defaultShipping: fields[2] as String?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[4] as DateTime?,
      createdIn: fields[5] as String?,
      dob: fields[6] as DateTime?,
      email: fields[7] as String?,
      firstname: fields[8] as String?,
      lastname: fields[9] as String?,
      gender: fields[10] as int?,
      storeId: fields[11] as int?,
      websiteId: fields[12] as int?,
      addresses: (fields[13] as List)?.cast<Address>(),
      disableAutoGroupChange: fields[14] as int?,
      extensionAttributes: fields[15] as ExtensionAttributes?,
      customAttributes: (fields[16] as List)?.cast<CustomAttribute>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserResponse obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.defaultShipping)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.createdIn)
      ..writeByte(6)
      ..write(obj.dob)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.firstname)
      ..writeByte(9)
      ..write(obj.lastname)
      ..writeByte(10)
      ..write(obj.gender)
      ..writeByte(11)
      ..write(obj.storeId)
      ..writeByte(12)
      ..write(obj.websiteId)
      ..writeByte(13)
      ..write(obj.addresses)
      ..writeByte(14)
      ..write(obj.disableAutoGroupChange)
      ..writeByte(15)
      ..write(obj.extensionAttributes)
      ..writeByte(16)
      ..write(obj.customAttributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 4;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      id: fields[0] as int?,
      customerId: fields[1] as int?,
      region: fields[2] as Region?,
      regionId: fields[3] as int?,
      countryId: fields[4] as String?,
      street: (fields[5] as List)?.cast<String>(),
      telephone: fields[6] as String?,
      postcode: fields[7] as String?,
      city: fields[8] as String?,
      firstname: fields[9] as String?,
      lastname: fields[10] as String?,
      defaultShipping: fields[11] as bool?,
      defaultBilling: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerId)
      ..writeByte(2)
      ..write(obj.region)
      ..writeByte(3)
      ..write(obj.regionId)
      ..writeByte(4)
      ..write(obj.countryId)
      ..writeByte(5)
      ..write(obj.street)
      ..writeByte(6)
      ..write(obj.telephone)
      ..writeByte(7)
      ..write(obj.postcode)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.firstname)
      ..writeByte(10)
      ..write(obj.lastname)
      ..writeByte(11)
      ..write(obj.defaultShipping)
      ..writeByte(12)
      ..write(obj.defaultBilling);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RegionAdapter extends TypeAdapter<Region> {
  @override
  final int typeId = 5;

  @override
  Region read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Region(
      regionCode: fields[0] as String?,
      region: fields[1] as String?,
      regionId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Region obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.regionCode)
      ..writeByte(1)
      ..write(obj.region)
      ..writeByte(2)
      ..write(obj.regionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomAttributeAdapter extends TypeAdapter<CustomAttribute> {
  @override
  final int typeId = 6;

  @override
  CustomAttribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomAttribute(
      attributeCode: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomAttribute obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.attributeCode)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomAttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtensionAttributesAdapter extends TypeAdapter<ExtensionAttributes> {
  @override
  final int typeId = 7;

  @override
  ExtensionAttributes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExtensionAttributes(isSubscribed: fields[0] as bool?);
  }

  @override
  void write(BinaryWriter writer, ExtensionAttributes obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isSubscribed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtensionAttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      groupId: (json['group_id'] as num?)?.toInt(),
      defaultShipping: json['default_shipping'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
      createdIn: json['created_in'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      websiteId: (json['website_id'] as num?)?.toInt(),
      addresses:
          (json['addresses'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList(),
      disableAutoGroupChange:
          (json['disable_auto_group_change'] as num?)?.toInt(),
      extensionAttributes:
          json['extension_attributes'] == null
              ? null
              : ExtensionAttributes.fromJson(
                json['extension_attributes'] as Map<String, dynamic>,
              ),
      customAttributes:
          (json['custom_attributes'] as List<dynamic>?)
              ?.map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'default_shipping': instance.defaultShipping,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_in': instance.createdIn,
      'dob': instance.dob?.toIso8601String(),
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'store_id': instance.storeId,
      'website_id': instance.websiteId,
      'addresses': instance.addresses,
      'disable_auto_group_change': instance.disableAutoGroupChange,
      'extension_attributes': instance.extensionAttributes,
      'custom_attributes': instance.customAttributes,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      region:
          json['region'] == null
              ? null
              : Region.fromJson(json['region'] as Map<String, dynamic>),
      regionId: (json['region_id'] as num?)?.toInt(),
      countryId: json['country_id'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      telephone: json['telephone'] as String?,
      postcode: json['postcode'] as String?,
      city: json['city'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      defaultShipping: json['default_shipping'] as bool?,
      defaultBilling: json['default_billing'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'region': instance.region,
      'region_id': instance.regionId,
      'country_id': instance.countryId,
      'street': instance.street,
      'telephone': instance.telephone,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'default_shipping': instance.defaultShipping,
      'default_billing': instance.defaultBilling,
    };

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
  regionCode: json['region_code'] as String?,
  region: json['region'] as String?,
  regionId: (json['region_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'region_code': instance.regionCode,
      'region': instance.region,
      'region_id': instance.regionId,
    };

_$CustomAttributeImpl _$$CustomAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$CustomAttributeImpl(
  attributeCode: json['attribute_code'] as String?,
  value: json['value'] as String?,
);

Map<String, dynamic> _$$CustomAttributeImplToJson(
  _$CustomAttributeImpl instance,
) => <String, dynamic>{
  'attribute_code': instance.attributeCode,
  'value': instance.value,
};

_$ExtensionAttributesImpl _$$ExtensionAttributesImplFromJson(
  Map<String, dynamic> json,
) => _$ExtensionAttributesImpl(isSubscribed: json['is_subscribed'] as bool?);

Map<String, dynamic> _$$ExtensionAttributesImplToJson(
  _$ExtensionAttributesImpl instance,
) => <String, dynamic>{'is_subscribed': instance.isSubscribed};
