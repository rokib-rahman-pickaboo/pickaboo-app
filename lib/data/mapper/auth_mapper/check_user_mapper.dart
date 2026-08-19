import 'package:pickaboo/data/model/auth/check_user_response/check_user_response.dart';
import 'package:pickaboo/domain/entity/auth/check_user_entity.dart';

extension CheckUserMapper on CheckUserResponse {
  CheckUserEntity toEntity() {
    return CheckUserEntity(
      status: status,
      message: message,
      httpCode: httpCode,
    );
  }
}
