import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

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
import 'package:pickaboo/data/mapper/order_mapper/order_list_mapper.dart';
import 'package:pickaboo/data/mapper/referral_mapper/referral_mapper.dart';
import 'package:pickaboo/domain/entity/referral/referral_entity.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:collection/collection.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

/// Concrete implementation of [UserProfileRepository].
///
/// Orchestrates user profile synchronization, demographic updates, multi-tier Hive caching,
/// order history retrieval, reCAPTCHA-protected security operations (phone/email OTPs),
/// and resilient address management.
///
/// ### Architecture & Resiliency Patterns:
/// - **Two-Tier Profile Caching:** Uses [UserProfileLocalDataSource] (Hive) for offline retrieval
///   and instant rendering. Network failures gracefully fall back to cached data before emitting errors.
/// - **Order Increment ID Fallback:** Resolves Magento entity IDs if an order increment ID is passed.
/// - **Dual-Strategy Address Engine:** Attempts modern dedicated address endpoints first; if Magento
///   returns 404 / route-not-found, automatically falls back to full-profile address mutations.
/// - **Security & Anti-Abuse:** Protects phone update OTP requests with Google reCAPTCHA v3 tokens.
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

  /// Fetches customer profile data with two-tier cache recovery.
  ///
  /// When [forceRefresh] is false, returns valid cached profile data from Hive immediately.
  /// When refreshing over network, any connection error or timeout gracefully falls back
  /// to existing cached data before failing. On success, persists the customer's numeric
  /// user ID to [_authCacheManager] for quote/cart and order bindings.
  @override
  Future<Either<AppErrorEntity, UserEntity>> getProfile({
    bool forceRefresh = true,
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
        // Cache read failure is non-fatal; proceed with remote network fetch
      }
    }

    final result = await _apiService.getUserProfile();
    return result.fold(
      (error) async {
        try {
          final cachedProfile = await _localDataSource.getUserProfileIfValid();
          if (cachedProfile != null) {
            return Right(cachedProfile.toEntity());
          }
        } catch (e) {
          // If offline and cache is invalid/unavailable, propagate backend error
        }
        return Left(error.toEntity());
      },
      (response) async {
        await _localDataSource.insertUserProfile(response);
        if (response.id != null) {
          await _authCacheManager.setUserId(userId: response.id.toString());
        }
        return Right(response.toEntity());
      },
    );
  }

  /// Purges local Hive user profile data on sign-out or account invalidation.
  @override
  Future<void> clearUserProfile() async {
    await _localDataSource.clearUserProfile();
  }

  /// Fetches the user's uploaded avatar image URL.
  @override
  Future<Either<AppErrorEntity, String>> getProfileImage() async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.getUserImage();
    return result.fold(
      (error) => Left(error.toEntity()),
      (response) => Right(response),
    );
  }

  @override
  Future<void> saveUserId(String userId) async {
    await _authCacheManager.setUserId(userId: userId);
  }

  /// Updates customer demographic details (name, gender, date of birth)
  /// and synchronizes the updated response into the Hive local database.
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
      (error) async => Left(error.toEntity()),
      (response) async {
        await _localDataSource.insertUserProfile(response);
        return Right(response.toEntity());
      },
    );
  }

  /// Sends a verification OTP to the specified email address for email change requests.
  @override
  Future<Either<AppErrorEntity, OtpResponse>> sendEmailUpdateOtp({
    required String email,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.sendEmailUpdateOtp(
      email: email,
    );
    return result.fold(
      (error) => Left(error.toEntity()),
      (response) => Right(response),
    );
  }

  /// Submits the OTP to change the user's email, then performs a full profile refresh
  /// to ensure local state reflects the verified email address.
  @override
  Future<Either<AppErrorEntity, UserEntity>> updateEmail({
    required String newEmail,
    required String otp,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.updateEmail(
      email: newEmail,
      otp: otp,
    );
    return result.fold(
      (error) => Left(error.toEntity()),
      (response) async {
        return await getProfile(forceRefresh: true);
      },
    );
  }

  /// Requests a verification OTP for updating phone numbers, protected by Google reCAPTCHA v3.
  ///
  /// Obtains an anti-abuse token via [RecaptchaService.executeAction] before dispatching
  /// the SMS OTP request.
  @override
  Future<Either<AppErrorEntity, OtpResponse>> sendPhoneUpdateOtp({
    required String mobile,
    bool resend = false,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final String recaptchaToken;
    try {
      debugPrint('[RECAPTCHA_FLOW] 1/3: sendPhoneUpdateOtp requesting token for action=${AppRecaptchaActions.profilePhoneSendOtp}');
      recaptchaToken = await _recaptcha.executeAction(
        AppRecaptchaActions.profilePhoneSendOtp,
      );
      debugPrint('[RECAPTCHA_FLOW] 2/3: sendPhoneUpdateOtp acquired token (len=${recaptchaToken.length}). Forwarding to apiService.sendPhoneUpdateOtp...');
    } catch (e) {
      debugPrint('[RECAPTCHA_FLOW] ❌ sendPhoneUpdateOtp reCAPTCHA failed: $e');
      return const Left(
        AppErrorEntity(
          message:
              'Security verification failed. Please wait a moment and try again.',
        ),
      );
    }

    final result = await _apiService.sendPhoneUpdateOtp(
      mobile: mobile,
      resend: resend,
      recaptchaToken: recaptchaToken,
    );
    return result.fold(
      (error) {
        debugPrint('[RECAPTCHA_FLOW] ❌ sendPhoneUpdateOtp API error: ${error.message}');
        return Left(error.toEntity());
      },
      (response) {
        debugPrint('[RECAPTCHA_FLOW] 3/3: sendPhoneUpdateOtp SUCCESS | message="${response.message}"');
        return Right(response);
      },
    );
  }

  /// Verifies the phone OTP and performs a force-refresh of the customer profile
  /// to ensure the updated mobile number is stored and propagated across the application.
  @override
  Future<Either<AppErrorEntity, UserEntity>> updateMobile({
    required String newMobile,
    required String otp,
  }) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.updatePhoneNumber(
      mobile: newMobile,
      otp: otp,
    );
    return result.fold(
      (error) => Left(error.toEntity()),
      (response) async {
        return await getProfile(forceRefresh: true);
      },
    );
  }

  /// Changes the user's account password and invalidates local cached profile.
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
      (error) => Left(error.toEntity()),
      (success) {
        if (success) {
          _localDataSource.clearUserProfile();
        }
        return Right(success);
      },
    );
  }

  /// Uploads a new avatar image multipart file.
  ///
  /// Clears local Hive profile cache so the next profile fetch retrieves the newly
  /// generated image URL once Google Cloud Storage finishes asynchronous processing.
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
      (error) => Left(error.toEntity()),
      (response) {
        _localDataSource.clearUserProfile();
        return Right(response);
      },
    );
  }

  OrderListEntity? _cachedFirstPageOrders;

  /// In-memory getter for first-page order list to allow instant tab navigation.
  @override
  OrderListEntity? getCachedFirstPageOrders() => _cachedFirstPageOrders;

  /// Fetches paginated order history for the authenticated customer.
  ///
  /// Retains the first page in memory ([_cachedFirstPageOrders]) for instant screen openings.
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
      (error) => Left(error.toEntity()),
      (response) {
        final domain = response.toDomain();
        if (currentPage == 1) {
          _cachedFirstPageOrders = domain;
        }
        return Right(domain);
      },
    );
  }

  /// Fetches detailed order information by [orderId].
  ///
  /// ### Backend Quirk & Resiliency:
  /// The parameter [orderId] may sometimes be passed as an `increment_id` (e.g. `1609225531`
  /// printed on invoices/push notifications) rather than the Magento database `entity_id`
  /// (e.g. `1237650`). If direct retrieval returns 404 or an error, this method scans
  /// recent orders via [_apiService.getOrderList] to match the increment number, resolves the
  /// real numeric entity ID, and transparently retries the lookup.
  @override
  Future<Either<AppErrorEntity, OrderDetailEntity>> getOrderDetails(
    String orderId,
  ) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.getOrderDetails(orderId: orderId);
    if (result.isRight()) {
      return result.fold(
        (error) => Left(error.toEntity()),
        (response) {
          try {
            return Right(response.toEntity());
          } catch (e) {
            return Left(AppErrorEntity(
              message: ApiErrorParser.sanitize(
                'Mapping error: $e',
                fallback: 'Failed to process order details. Please try again.',
              ),
            ));
          }
        },
      );
    }

    // Fallback: orderId might be an increment_id (e.g. 1609225531) rather than the entity ID (e.g. 1237650)
    try {
      final listResult = await _apiService.getOrderList(limit: 20, currentPage: 1);
      final matchedOrder = listResult.fold(
        (_) => null,
        (listResponse) => listResponse.items?.firstWhereOrNull(
          (item) => item.orderNumber == orderId || item.orderId?.toString() == orderId,
        ),
      );

      if (matchedOrder?.orderId != null && matchedOrder!.orderId.toString() != orderId) {
        final fallbackResult = await _apiService.getOrderDetails(
          orderId: matchedOrder.orderId.toString(),
        );
        if (fallbackResult.isRight()) {
          return fallbackResult.fold(
            (error) => Left(error.toEntity()),
            (response) {
              try {
                return Right(response.toEntity());
              } catch (e) {
                return Left(AppErrorEntity(
                  message: ApiErrorParser.sanitize(
                    'Mapping error: $e',
                    fallback: 'Failed to process order details. Please try again.',
                  ),
                ));
              }
            },
          );
        }
      }
    } catch (_) {}

    return result.fold(
      (error) => Left(error.toEntity()),
      (response) => Right(response.toEntity()),
    );
  }

  /// Cancels an order with a mandatory cancellation [reason] and optional customer [note].
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
      (error) => Left(error.toEntity()),
      (response) => Right(response.toEntity()),
    );
  }

  /// Re-orders all line items from a past order into the active shopping cart.
  ///
  /// Guarantees customer ID resolution before dispatching the request: verifies local
  /// cache first, and falls back to a profile network lookup if the cached ID is blank.
  @override
  Future<Either<AppErrorEntity, bool>> reorder(String orderId) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    String? customerId = await _authCacheManager.getUserId();

    if (customerId == null || customerId.isEmpty) {
      final cachedProfile = await _localDataSource.getUserProfileIfValid();
      if (cachedProfile?.id != null) {
        customerId = cachedProfile!.id.toString();
        await _authCacheManager.setUserId(userId: customerId);
      }
    }

    if (customerId == null || customerId.isEmpty) {
      final profileResult = await _apiService.getUserProfile();
      return profileResult.fold(
        (error) => Left(
          AppErrorEntity(
            message: error.message ?? 'Failed to get user profile for reorder',
          ),
        ),
        (userResp) async {
          final cid = userResp.id.toString();
          await _authCacheManager.setUserId(userId: cid);
          final result = await _apiService.reorder(
            orderId: orderId,
            customerId: cid,
          );
          return result.fold(
            (error) => Left(error.toEntity()),
            (success) => Right(success),
          );
        },
      );
    }

    final result = await _apiService.reorder(
      orderId: orderId,
      customerId: customerId,
    );
    return result.fold(
      (error) => Left(error.toEntity()),
      (success) => Right(success),
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
          Left(error.toEntity()),
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
          Left(error.toEntity()),
      (response) => Right(response),
    );
  }

  /// Direct update of the full customer address array in Magento.
  ///
  /// Clears Hive profile cache upon success so fresh addresses are loaded.
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
        "id": user.id,
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
      (error) => Left(error.toEntity()),
      (success) {
        if (success) {
          _localDataSource.clearUserProfile();
        }
        return Right(success);
      },
    );
  }

  /// Detects whether an API error is due to a missing/unsupported custom endpoint (404/route not found).
  bool _isRouteNotFound(ErrorResponse error) {
    final msg = (error.message ?? '').toLowerCase();
    return msg.contains('request does not match any route') ||
        msg.contains('404') ||
        msg.contains('not found');
  }

  /// Formats region data to ensure compatibility with standard Magento 2 customer addresses.
  Map<String, dynamic> _formatAddressForLegacy(Map<String, dynamic> raw) {
    final legacy = Map<String, dynamic>.from(raw);
    if (raw['region'] is String) {
      legacy['region'] = {
        'region': raw['region'],
        'region_id': raw['region_id'] ?? 0,
        'region_code': raw['region'],
      };
    }
    return legacy;
  }

  /// Fallback strategy: Injects a new address directly into the customer's full address list
  /// via standard Magento `/rest/V1/customers/me` API when custom address routes are absent.
  Future<Either<AppErrorEntity, String>> _fallbackAddAddress(
    Map<String, dynamic> rawAddress,
  ) async {
    try {
      final profileResult = await _apiService.getUserProfile();
      return await profileResult.fold(
        (err) => Left(err.toEntity()),
        (userResp) async {
          final existingAddresses = (userResp.addresses ?? [])
              .map((a) => a.toJson())
              .toList();

          final isDefaultShipping = rawAddress['default_shipping'] == true;
          final isDefaultBilling = rawAddress['default_billing'] == true;

          if (isDefaultShipping) {
            for (var a in existingAddresses) {
              a['default_shipping'] = false;
            }
          }
          if (isDefaultBilling) {
            for (var a in existingAddresses) {
              a['default_billing'] = false;
            }
          }

          final legacyAddress = _formatAddressForLegacy(rawAddress);
          if (userResp.id != null) {
            legacyAddress['customer_id'] = userResp.id;
          }
          existingAddresses.add(legacyAddress);

          final Map<String, dynamic> body = {
            "customer": {
              if (userResp.id != null) "id": userResp.id,
              "email": userResp.email,
              "firstname": userResp.firstname,
              "lastname": userResp.lastname,
              "store_id": userResp.storeId,
              "website_id": userResp.websiteId,
              "addresses": existingAddresses,
            },
          };

          final updateResult = await _apiService.updateAddressList(body);
          return updateResult.fold(
            (err) => Left(err.toEntity()),
            (success) {
              _localDataSource.clearUserProfile();
              return const Right('Address saved successfully.');
            },
          );
        },
      );
    } catch (e) {
      return Left(AppErrorEntity(message: 'Failed to save address: $e'));
    }
  }

  /// Fallback strategy: Modifies an existing address in the customer's address array.
  Future<Either<AppErrorEntity, String>> _fallbackUpdateAddress(
    Map<String, dynamic> rawAddress,
  ) async {
    try {
      final profileResult = await _apiService.getUserProfile();
      return await profileResult.fold(
        (err) => Left(err.toEntity()),
        (userResp) async {
          final targetId = rawAddress['id'];
          final existingAddresses = (userResp.addresses ?? [])
              .map((a) => a.toJson())
              .toList();

          final isDefaultShipping = rawAddress['default_shipping'] == true;
          final isDefaultBilling = rawAddress['default_billing'] == true;

          if (isDefaultShipping) {
            for (var a in existingAddresses) {
              a['default_shipping'] = false;
            }
          }
          if (isDefaultBilling) {
            for (var a in existingAddresses) {
              a['default_billing'] = false;
            }
          }

          final legacyAddress = _formatAddressForLegacy(rawAddress);
          if (userResp.id != null) {
            legacyAddress['customer_id'] = userResp.id;
          }
          final index =
              existingAddresses.indexWhere((a) => a['id'] == targetId);
          if (index >= 0) {
            existingAddresses[index] = legacyAddress;
          } else {
            existingAddresses.add(legacyAddress);
          }

          final Map<String, dynamic> body = {
            "customer": {
              if (userResp.id != null) "id": userResp.id,
              "email": userResp.email,
              "firstname": userResp.firstname,
              "lastname": userResp.lastname,
              "store_id": userResp.storeId,
              "website_id": userResp.websiteId,
              "addresses": existingAddresses,
            },
          };

          final updateResult = await _apiService.updateAddressList(body);
          return updateResult.fold(
            (err) => Left(err.toEntity()),
            (success) {
              _localDataSource.clearUserProfile();
              return const Right('Address updated successfully.');
            },
          );
        },
      );
    } catch (e) {
      return Left(AppErrorEntity(message: 'Failed to update address: $e'));
    }
  }

  /// Fallback strategy: Filters out an address from the array and persists the trimmed list.
  Future<Either<AppErrorEntity, String>> _fallbackDeleteAddress(
    int addressId,
  ) async {
    try {
      final profileResult = await _apiService.getUserProfile();
      return await profileResult.fold(
        (err) => Left(err.toEntity()),
        (userResp) async {
          final existingAddresses = (userResp.addresses ?? [])
              .where((a) => a.id != addressId)
              .map((a) => a.toJson())
              .toList();

          final Map<String, dynamic> body = {
            "customer": {
              if (userResp.id != null) "id": userResp.id,
              "email": userResp.email,
              "firstname": userResp.firstname,
              "lastname": userResp.lastname,
              "store_id": userResp.storeId,
              "website_id": userResp.websiteId,
              "addresses": existingAddresses,
            },
          };

          final updateResult = await _apiService.updateAddressList(body);
          return updateResult.fold(
            (err) => Left(err.toEntity()),
            (success) {
              _localDataSource.clearUserProfile();
              return const Right('Address deleted successfully.');
            },
          );
        },
      );
    } catch (e) {
      return Left(AppErrorEntity(message: 'Failed to delete address: $e'));
    }
  }

  /// Adds a new delivery/billing address for the customer.
  ///
  /// Employs a dual-strategy approach: executes the custom endpoint first, and automatically
  /// falls back to [_fallbackAddAddress] if the custom route is not available on the server.
  @override
  Future<Either<AppErrorEntity, String>> addAddress(
    Map<String, dynamic> addressData,
  ) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final Map<String, dynamic> body = addressData.containsKey('address')
        ? addressData
        : {'address': addressData};

    final result = await _apiService.addAddress(body);
    return result.fold(
      (error) async {
        if (_isRouteNotFound(error)) {
          return _fallbackAddAddress(
            addressData['address'] as Map<String, dynamic>? ?? addressData,
          );
        }
        return Left(error.toEntity());
      },
      (message) {
        _localDataSource.clearUserProfile();
        return Right(message);
      },
    );
  }

  /// Modifies an existing delivery/billing address for the customer.
  ///
  /// Falls back to [_fallbackUpdateAddress] if the server returns 404 / route-not-found.
  @override
  Future<Either<AppErrorEntity, String>> updateAddress(
    Map<String, dynamic> addressData,
  ) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final Map<String, dynamic> body = addressData.containsKey('address')
        ? addressData
        : {'address': addressData};

    final result = await _apiService.updateAddress(body);
    return result.fold(
      (error) async {
        if (_isRouteNotFound(error)) {
          return _fallbackUpdateAddress(
            addressData['address'] as Map<String, dynamic>? ?? addressData,
          );
        }
        return Left(error.toEntity());
      },
      (message) {
        _localDataSource.clearUserProfile();
        return Right(message);
      },
    );
  }

  /// Deletes a saved address by [addressId].
  ///
  /// Falls back to [_fallbackDeleteAddress] if the dedicated delete endpoint is not found.
  @override
  Future<Either<AppErrorEntity, String>> deleteAddress(
    int addressId,
  ) async {
    final token = await _authCacheManager.getToken();
    if (token == null) {
      return const Left(AppErrorEntity(message: 'User not authenticated'));
    }

    final result = await _apiService.deleteAddress(addressId);
    return result.fold(
      (error) async {
        if (_isRouteNotFound(error)) {
          return _fallbackDeleteAddress(addressId);
        }
        return Left(error.toEntity());
      },
      (message) {
        _localDataSource.clearUserProfile();
        return Right(message);
      },
    );
  }

  /// Fetches available cities for the given geographical [division].
  @override
  Future<Either<AppErrorEntity, List<dynamic>>> getCities(
    String division,
  ) async {
    final result = await _apiService.getCities(division);
    return result.fold(
      (error) => Left(error.toEntity()),
      (cities) => Right(cities.map((city) => city.toJson()).toList()),
    );
  }

  /// Fetches sub-districts and delivery areas for the given [city].
  @override
  Future<Either<AppErrorEntity, List<dynamic>>> getAreas(String city) async {
    final result = await _apiService.getAreas(city);
    return result.fold(
      (error) => Left(error.toEntity()),
      (areas) => Right(areas.map((area) => area.toJson()).toList()),
    );
  }
}

