import 'package:pickaboo/data/model/auth/user_response/user_response.dart';

abstract class UserProfileLocalDataSource {
  Future<UserResponse?> getUserProfileIfValid();

  Future<void> insertUserProfile(UserResponse user);

  Future<void> clearUserProfile();
}
