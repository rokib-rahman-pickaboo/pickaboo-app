import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/otp_response/otp_response.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/entity/order/order_list_entity.dart';
import 'package:pickaboo/domain/entity/referral/referral_entity.dart';

abstract class UserProfileRepository {
  Future<Either<AppErrorEntity, UserEntity>> getProfile({
    bool forceRefresh = false,
  });

  Future<void> clearUserProfile();

  Future<Either<AppErrorEntity, String>> getProfileImage();

  Future<void> saveUserId(String userId);

  Future<Either<AppErrorEntity, UserEntity>> updateBasicInfo({
    required UserEntity user,
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  });

  Future<Either<AppErrorEntity, UserEntity>> updateEmail({
    required UserEntity user,
    required String newEmail,
  });

  Future<Either<AppErrorEntity, OtpResponse>> sendPhoneUpdateOtp({
    required String mobile,
  });

  Future<Either<AppErrorEntity, UserEntity>> updateMobile({
    required UserEntity user,
    required String newMobile,
    required String otp,
  });

  Future<Either<AppErrorEntity, bool>> changePassword({
    required int customerId,
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<AppErrorEntity, String>> uploadImage({required File image});

  Future<Either<AppErrorEntity, OrderListEntity>> getOrders({
    int limit = 10,
    int currentPage = 1,
  });

  Future<Either<AppErrorEntity, OrderDetailEntity>> getOrderDetails(
    String orderId,
  );

  Future<Either<AppErrorEntity, OrderCancelEntity>> cancelOrder({
    required String orderId,
    required String note,
    required String reason,
  });

  Future<Either<AppErrorEntity, bool>> reorder(String orderId);

  Future<Either<AppErrorEntity, ReferralEntity>> getReferralHistory({
    int page = 1,
    int limit = 10,
  });

  Future<Either<AppErrorEntity, bool>> inviteFriend(Map<String, dynamic> body);

  Future<Either<AppErrorEntity, bool>> updateAddressList({
    required UserEntity user,
    required List<dynamic> addresses,
  });

  Future<Either<AppErrorEntity, List<dynamic>>> getCities(String division);

  Future<Either<AppErrorEntity, List<dynamic>>> getAreas(String city);
}
