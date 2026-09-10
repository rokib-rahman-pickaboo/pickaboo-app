import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/common/area_response.dart';
import 'package:pickaboo/data/model/common/city_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/order/order_cancel_response/order_cancel_response.dart';
import 'package:pickaboo/data/model/otp_response/otp_response.dart';
import 'package:pickaboo/data/model/order/order_detail_response/order_detail_response.dart';
import 'package:pickaboo/data/model/order/order_list_response/order_list_response.dart';
import 'package:pickaboo/data/model/club_point/club_point_response.dart';
import 'package:pickaboo/data/model/referral/referral_response.dart';

abstract class UserProfileApiService {
  Future<Either<ErrorResponse, ClubPointResponse>> getClubPoints({
    required int page,
    required int limit,
  });
  Future<Either<ErrorResponse, UserResponse>> getUserProfile();

  Future<Either<ErrorResponse, String>> getUserImage();

  Future<Either<ErrorResponse, UserResponse>> updateBasicProfile({
    required Map<String, dynamic> userMap,
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  });

  Future<Either<ErrorResponse, OtpResponse>> sendEmailUpdateOtp({
    required String email,
  });

  Future<Either<ErrorResponse, String>> updateEmail({
    required String email,
    required String otp,
  });

  Future<Either<ErrorResponse, OtpResponse>> sendPhoneUpdateOtp({
    required String mobile,
    bool resend = false,
    String? recaptchaToken,
  });

  Future<Either<ErrorResponse, String>> validateOtp({
    required String mobile,
    required String otp,
  });

  Future<Either<ErrorResponse, String>> updatePhoneNumber({
    required String mobile,
    required String otp,
  });

  Future<Either<ErrorResponse, bool>> changePassword({
    required int customerId,
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<ErrorResponse, String>> uploadProfileImage({
    required File image,
  });

  Future<Either<ErrorResponse, OrderListResponse>> getOrderList({
    int limit = 10,
    int currentPage = 1,
  });

  Future<Either<ErrorResponse, OrderDetailResponse>> getOrderDetails({
    required String orderId,
  });

  Future<Either<ErrorResponse, OrderCancelResponse>> cancelOrder({
    required String orderId,
    required String note,
    required String reason,
  });

  Future<Either<ErrorResponse, bool>> reorder({
    required String orderId,
    required String customerId,
  });

  Future<Either<ErrorResponse, ReferralResponse>> getReferralHistory({
    int page = 1,
    int limit = 10,
  });

  Future<Either<ErrorResponse, bool>> inviteFriend(Map<String, dynamic> body);

  Future<Either<ErrorResponse, bool>> updateAddressList(
    Map<String, dynamic> body,
  );

  Future<Either<ErrorResponse, String>> addAddress(Map<String, dynamic> body);

  Future<Either<ErrorResponse, String>> updateAddress(Map<String, dynamic> body);

  Future<Either<ErrorResponse, String>> deleteAddress(int addressId);

  Future<Either<ErrorResponse, List<CityResponse>>> getCities(String division);

  Future<Either<ErrorResponse, List<AreaResponse>>> getAreas(String city);
}
