import 'package:pickaboo/domain/entity/common/extension_attributes_entity.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';

extension ExtensionAttributesMapper on ExtensionAttributes {
  ExtensionAttributesEntity toEntity() {
    return ExtensionAttributesEntity(isSubscribed: isSubscribed ?? false);
  }
}
