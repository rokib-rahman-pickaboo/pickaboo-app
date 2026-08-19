import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/app_recaptcha_actions.dart';
import 'package:pickaboo/data/api_service/user_profile_api_service.dart';
import 'package:pickaboo/data/services/recaptcha_service.dart';
import 'package:pickaboo/data/local_data_source/user_profile_local_data_source.dart';
import 'package:pickaboo/data/mapper/auth_mapper/user_response_mapper.dart';
import 'package:pickaboo/data/model/otp_response/otp_response.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:pickaboo/data/mapper/order_mapper/order_cancel_mapper.dart';
import 'package:pickaboo/data/mapper/order_mapper/order_detail_mapper.dart';
import 'package:pickaboo/domain/entity/order/order_list_entity.dart';
import 'package:pickaboo/domain/entity/referral/referral_entity.dart';
import 'package:pickaboo/data/mapper/order_mapper/order_list_mapper.dart';
import 'package:pickaboo/data/mapper/referral_mapper/referral_mapper.dart';

@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileApiService _apiService;
  final AuthCacheManager _authCacheManager;
  final UserProfileLocalDataSource _localDataSource;
  final RecaptchaService _recaptcha;

  UserProfileRepositoryImpl(
    this._apiService,
    this._authCacheManager,
    this._localDataSource,
    this._recaptcha,
  );

  @override
  Future<Either<AppErrorEntity, UserEntity>> getProfile({
    bool forceRefresh = false,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    if (!forceRefresh) {
      try {
        final cachedProfile = await _localDataSource.getUserProfileIfValid();
        if (cachedProfile != null) {
          return Right(cachedProfile.toEntity());
        }
      } catch (e) {
        debugPrint('Cache error: $e');
      }
    }

    final result = await _apiService.getUserProfile();
    return result.fold(
      (error) async =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) async {
        await _localDataSource.insertUserProfile(response);
        if (response.id != null) {
          await _authCacheManager.setUserId(userId: response.id.toString());
        }
        return Right(response.toEntity());
      },
    );
  }

  @override
  Future<void> clearUserProfile() async {
    await _localDataSource.clearUserProfile();
  }

  @override
  Future<Either<AppErrorEntity, String>> getProfileImage() async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.getUserImage();
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) => Right(response),
    );
  }

  @override
  Future<void> saveUserId(String userId) async {
    await _authCacheManager.setUserId(userId: userId);
  }

  @override
  Future<Either<AppErrorEntity, UserEntity>> updateBasicInfo({
    required UserEntity user,
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final Map<String, dynamic> userMap = {
      'id': user.id,
      'email': user.email,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'group_id': user.groupId,
      'store_id': user.storeId,
      'website_id': user.websiteId,
      if (user.dob != null) 'dob': user.dob,
      if (user.gender != null) 'gender': user.gender,
    };

    final result = await _apiService.updateBasicProfile(
      userMap: userMap,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      dob: dob,
    );
    return result.fold(
      (error) async =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) async {
        await _localDataSource.insertUserProfile(response);
        return Right(response.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, UserEntity>> updateEmail({
    required UserEntity user,
    required String newEmail,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final Map<String, dynamic> userMap = {
      'id': user.id,
      'email': user.email,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'group_id': user.groupId,
      'store_id': user.storeId,
      'website_id': user.websiteId,
    };

    if (user.dob != null) userMap['dob'] = user.dob;
    if (user.gender != null) userMap['gender'] = user.gender;

    final result = await _apiService.updateEmail(
      userMap: userMap,
      newEmail: newEmail,
    );
    return result.fold(
      (error) async =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) async {
        await _localDataSource.insertUserProfile(response);
        return Right(response.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, OtpResponse>> sendPhoneUpdateOtp({
    required String mobile,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final String recaptchaToken;
    try {
      recaptchaToken = await _recaptcha.executeAction(
        AppRecaptchaActions.profilePhoneOtpSend,
      );
    } catch (e) {
      return const Left(
        AppErrorEntity(message: 'Verification failed. Please try again.'),
      );
    }

    final result = await _apiService.sendPhoneUpdateOtp(
      mobile: mobile,
      recaptchaToken: recaptchaToken,
    );
    return result.fold(
      (error) {
        return Left(AppErrorEntity(message: error.message ?? 'Unknown error'));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, UserEntity>> updateMobile({
    required UserEntity user,
    required String newMobile,
    required String otp,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final Map<String, dynamic> userMap = {
      'id': user.id,
      'email': user.email,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'group_id': user.groupId,
      'store_id': user.storeId,
      'website_id': user.websiteId,
      if (user.dob != null) 'dob': user.dob,
      if (user.gender != null) 'gender': user.gender,
    };

    final result = await _apiService.updatePhoneNumber(
      userMap: userMap,
      mobile: newMobile,
      otp: otp,
    );
    return result.fold(
      (error) async {
        return Left(AppErrorEntity(message: error.message ?? 'Unknown error'));
      },
      (response) async {
        await _localDataSource.insertUserProfile(response);
        return Right(response.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> changePassword({
    required int customerId,
    required String currentPassword,
    required String newPassword,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.changePassword(
      customerId: customerId,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (success) {
        if (success) {
          _localDataSource.clearUserProfile();
        }
        return Right(success);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, String>> uploadImage({
    required File image,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.uploadProfileImage(image: image);
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) {
        _localDataSource.clearUserProfile();
        return Right(response);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, OrderListEntity>> getOrders({
    int limit = 10,
    int currentPage = 1,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.getOrderList(
      limit: limit,
      currentPage: currentPage,
    );
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) => Right(response.toDomain()),
    );
  }

  @override
  Future<Either<AppErrorEntity, OrderDetailEntity>> getOrderDetails(
    String orderId,
  ) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.getOrderDetails(orderId: orderId);
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) {
        try {
          return Right(response.toEntity());
        } catch (e) {
          return Left(AppErrorEntity(message: 'Mapping error: $e'));
        }
      },
    );
  }
  @override
  Future<Either<AppErrorEntity, OrderCancelEntity>> cancelOrder({
    required String orderId,
    required String note,
    required String reason,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.cancelOrder(
      orderId: orderId,
      note: note,
      reason: reason,
    );
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) => Right(response.toEntity()),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> reorder(String orderId) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final profileResult = await _apiService.getUserProfile();
    return profileResult.fold(
      (error) => Left(
        AppErrorEntity(
          message: error.message ?? 'Failed to get user profile for reorder',
        ),
      ),
      (userResp) async {
        final customerId = userResp.id.toString();
        final result = await _apiService.reorder(
          orderId: orderId,
          customerId: customerId,
        );
        return result.fold(
          (error) =>
              Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
          (success) => Right(success),
        );
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, ReferralEntity>> getReferralHistory({
    int page = 1,
    int limit = 10,
  }) async {
    final result = await _apiService.getReferralHistory(
      page: page,
      limit: limit,
    );

    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) => Right(response.toEntity()),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> inviteFriend(
    Map<String, dynamic> body,
  ) async {
    final result = await _apiService.inviteFriend(body);

    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<AppErrorEntity, bool>> updateAddressList({
    required UserEntity user,
    required List<dynamic> addresses,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final Map<String, dynamic> body = {
      "customer": {
        "email": user.email,
        "firstname": user.firstname,
        "lastname": user.lastname,
        "store_id": user.storeId,
        "website_id": user.websiteId,
        "addresses": addresses,
      },
    };

    final result = await _apiService.updateAddressList(body);
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (success) {
        if (success) {
          _localDataSource.clearUserProfile();
        }
        return Right(success);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, List<dynamic>>> getCities(
    String division,
  ) async {
    final result = await _apiService.getCities(division);
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (cities) => Right(cities.map((city) => city.toJson()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<dynamic>>> getAreas(String city) async {
    final result = await _apiService.getAreas(city);
    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (areas) => Right(areas.map((area) => area.toJson()).toList()),
    );
  }

}
