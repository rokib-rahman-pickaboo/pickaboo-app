import 'package:pickaboo/domain/entity/common/address_entity.dart';
import 'package:pickaboo/domain/entity/common/custom_attribute_entity.dart';
import 'package:pickaboo/domain/entity/common/extension_attributes_entity.dart';

class UserEntity {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final int? groupId;
  final String? defaultShipping;
  final int? storeId;
  final int? websiteId;
  final String? createdAt;
  final String? updatedAt;
  final String? dob;
  final int? gender;
  final List<CustomAttributeEntity>? customAttributes;
  final List<AddressEntity>? addresses;
  final ExtensionAttributesEntity? extensionAttributes;

  const UserEntity({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    this.groupId,
    this.defaultShipping,
    this.storeId,
    this.websiteId,
    this.createdAt,
    this.updatedAt,
    this.dob,
    this.gender,
    this.customAttributes,
    this.addresses,
    this.extensionAttributes,
  });
}
