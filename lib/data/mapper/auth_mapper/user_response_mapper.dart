import 'package:pickaboo/data/mapper/common/address_mapper.dart';
import 'package:pickaboo/data/mapper/common/extension_attributes_mapper.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/common/custom_attribute_entity.dart';

extension UserResponseMapper on UserResponse {
  UserEntity toEntity() {
    return UserEntity(
      id: id ?? 0,
      email: email ?? '',
      firstname: firstname ?? '',
      lastname: lastname ?? '',
      groupId: groupId,
      defaultShipping: defaultShipping,
      storeId: storeId,
      websiteId: websiteId,
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      dob: dob?.toIso8601String(),
      gender: gender,
      customAttributes: customAttributes
          ?.map(
            (e) => CustomAttributeEntity(
              attributeCode: e.attributeCode ?? '',
              value: e.value,
            ),
          )
          .toList(),
      addresses: addresses?.map((e) => e.toEntity()).toList(),
      extensionAttributes: extensionAttributes?.toEntity(),
    );
  }
}
