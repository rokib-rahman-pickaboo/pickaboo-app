import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';

@injectable
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepository _repository;

  UserProfileBloc(this._repository) : super(const UserProfileState.initial()) {
    on<UserProfileEvent>((event, emit) async {
      await event.map(
        started: (e) async => _onLoadUserProfile(emit),
        loadUserProfile: (e) async => _onLoadUserProfile(emit),
        updateBasicInfo: (e) async =>
            _onUpdateBasicInfo(e.firstName, e.lastName, e.gender, e.dob, emit),
        sendPhoneUpdateOtp: (e) async =>
            _onSendPhoneUpdateOtp(e.mobileNumber, emit),
        updateMobile: (e) async => _onUpdateMobile(e.newMobile, e.otp, emit),
        uploadProfileImage: (e) async => _onUploadProfileImage(e.image, emit),
        updateEmail: (e) async => _onUpdateEmail(e.newEmail, emit),
        changePassword: (e) async =>
            _onChangePassword(e.currentPassword, e.newPassword, emit),
        addAddress: (e) async => _onAddAddress(e.address, emit),
        updateAddress: (e) async => _onUpdateAddress(e.address, emit),
        deleteAddress: (e) async => _onDeleteAddress(e.addressId, emit),
      );
    });
  }

  bool _forceProfileRefresh = false;

  void _reloadProfile() {
    _forceProfileRefresh = true;
    add(const UserProfileEvent.loadUserProfile());
  }

  Future<void> _onLoadUserProfile(Emitter<UserProfileState> emit) async {
    if (kDebugMode) {
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[UserProfileBloc] 🚀 LOADING USER PROFILE');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('[UserProfileBloc] Current state: ${state.runtimeType}');
    }

    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      basicInfoUpdateSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      mobileUpdateSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      imageUploadSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      updating: (s) =>
          (user: s.currentUser, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      phoneUpdateOtpSent: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (kDebugMode) {
      print(
        '[UserProfileBloc] 📦 Preserved user data: ${userData != null ? "YES" : "NO"}',
      );
    }

    emit(
      UserProfileState.loading(
        currentUser: userData?.user,
        imageUrl: userData?.imageUrl,
        mobileNumber: userData?.mobile,
      ),
    );

    if (kDebugMode) {
      print('[UserProfileBloc] 📡 Emitted loading state');
      print('[UserProfileBloc] 🌐 Calling repository.getProfile()...');
    }

    final forceRefresh = _forceProfileRefresh;
    _forceProfileRefresh = false;

    final profileResult = forceRefresh
        ? await _repository.getProfile(forceRefresh: true)
        : await _repository.getProfile();

    await profileResult.fold(
      (error) async {
        if (kDebugMode) {
          print('[UserProfileBloc] ❌ ERROR loading profile');
          print('[UserProfileBloc] Error message: ${error.message}');
          print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        }
        emit(UserProfileState.error(error.message));
      },
      (user) async {
        if (kDebugMode) {
          print('[UserProfileBloc] ✅ SUCCESS loading profile');
          print('[UserProfileBloc] User ID: ${user.id}');
          print('[UserProfileBloc] User Email: ${user.email}');
          print(
            '[UserProfileBloc] User Name: ${user.firstname} ${user.lastname}',
          );
          print(
            '[UserProfileBloc] Custom Attributes Count: ${user.customAttributes?.length ?? 0}',
          );
        }

        var profileImageUrl =
            user.customAttributes
                    ?.where((item) => item.attributeCode == 'profile_image')
                    .firstOrNull
                    ?.value
                as String?;

        if (_bustImageCacheOnNextLoad &&
            profileImageUrl != null &&
            profileImageUrl.isNotEmpty) {
          profileImageUrl = _appendCacheBust(profileImageUrl);
        }
        _bustImageCacheOnNextLoad = false;

        final mobileNumber =
            user.customAttributes
                    ?.where((item) => item.attributeCode == 'customer_mobile')
                    .firstOrNull
                    ?.value
                as String?;

        if (kDebugMode) {
          print(
            '[UserProfileBloc] 📸 Profile Image URL: ${profileImageUrl ?? "NOT FOUND"}',
          );
          print(
            '[UserProfileBloc] 📱 Mobile Number: ${mobileNumber ?? "NOT FOUND"}',
          );
          print(
            '[UserProfileBloc] 🏠 Addresses Count: ${user.addresses?.length ?? 0}',
          );

          if (user.addresses != null && user.addresses!.isNotEmpty) {
            print(
              '[UserProfileBloc] 📍 First Address: ${user.addresses![0].city}',
            );
          }

          print('[UserProfileBloc] 📤 Emitting loaded state');
          print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        }

        emit(
          UserProfileState.loaded(
            user: user,
            imageUrl: profileImageUrl,
            mobileNumber: mobileNumber,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateBasicInfo(
    String firstName,
    String lastName,
    String gender,
    String dob,
    Emitter<UserProfileState> emit,
  ) async {
    final currentUserState = state.mapOrNull(
      loaded: (s) => s,
      phoneUpdateOtpSent: (s) =>
          null,
      updating: (s) => null,
    );

    if (currentUserState == null) return;

    emit(
      UserProfileState.updating(
        currentUser: currentUserState.user,
        imageUrl: currentUserState.imageUrl,
        mobileNumber: currentUserState.mobileNumber,
      ),
    );

    final result = await _repository.updateBasicInfo(
      user: currentUserState.user,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      dob: dob,
    );

    await result.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (newUser) async {
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: 'Profile updated successfully',
            user: newUser,
            imageUrl: currentUserState.imageUrl,
            mobileNumber: currentUserState.mobileNumber,
          ),
        );
        _reloadProfile();
      },
    );
  }

  Future<void> _onSendPhoneUpdateOtp(
    String mobileNumber,
    Emitter<UserProfileState> emit,
  ) async {
    debugPrint(
      'UserProfileBloc: _onSendPhoneUpdateOtp: Sending OTP to $mobileNumber',
    );
    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      updating: (s) =>
          (user: s.currentUser, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      phoneUpdateOtpSent: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) return;

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.sendPhoneUpdateOtp(mobile: mobileNumber);

    await result.fold(
      (error) async {
        debugPrint(
          'UserProfileBloc: _onSendPhoneUpdateOtp: Failed: ${error.message}',
        );
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (response) async {
        debugPrint('UserProfileBloc: _onSendPhoneUpdateOtp: Success');
        emit(
          UserProfileState.phoneUpdateOtpSent(
            mobileNumber: mobileNumber,
            user: userData.user,
            imageUrl: userData.imageUrl,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateMobile(
    String newMobile,
    String otp,
    Emitter<UserProfileState> emit,
  ) async {
    debugPrint(
      'UserProfileBloc: _onUpdateMobile: Updating mobile to $newMobile with OTP $otp',
    );
    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      updating: (s) =>
          (user: s.currentUser, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      phoneUpdateOtpSent: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) return;

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: newMobile,
      ),
    );

    final result = await _repository.updateMobile(
      user: userData.user,
      newMobile: newMobile,
      otp: otp,
    );

    await result.fold(
      (error) async {
        debugPrint(
          'UserProfileBloc: _onUpdateMobile: Failed: ${error.message}',
        );
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (newUser) async {
        debugPrint('UserProfileBloc: _onUpdateMobile: Success');
        final parsedMobile =
            newUser.customAttributes
                    ?.where(
                      (item) => item.attributeCode == 'customer_mobile',
                    )
                    .firstOrNull
                    ?.value
                as String?;
        emit(
          UserProfileState.mobileUpdateSuccess(
            message: 'Mobile updated successfully',
            user: newUser,
            imageUrl: userData.imageUrl,
            mobileNumber: parsedMobile ?? newMobile,
          ),
        );
        _reloadProfile();
      },
    );
  }

  bool _bustImageCacheOnNextLoad = false;

  String _appendCacheBust(String url) {
    if (url.isEmpty) return url;
    final sep = url.contains('?') ? '&' : '?';
    return '$url${sep}v=${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<void> _onUploadProfileImage(
    File image,
    Emitter<UserProfileState> emit,
  ) async {
    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      updating: (s) =>
          (user: s.currentUser, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) return;

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.uploadImage(image: image);

    await result.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (_) async {
        _bustImageCacheOnNextLoad = true;
        emit(
          UserProfileState.imageUploadSuccess(
            message: 'Image uploaded successfully',
            user: userData.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
        _reloadProfile();
      },
    );
  }

  Future<void> _onUpdateEmail(
    String newEmail,
    Emitter<UserProfileState> emit,
  ) async {
    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) {
      debugPrint(
        'UserProfileBloc: _onUpdateEmail: User data is null (state: $state)',
      );
      return;
    }

    debugPrint('UserProfileBloc: Updating email to $newEmail');

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.updateEmail(
      user: userData.user,
      newEmail: newEmail,
    );

    await result.fold(
      (error) async {
        debugPrint('UserProfileBloc: Update email failed: ${error.message}');
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (user) async {
        debugPrint('UserProfileBloc: Update email success');
        emit(
          const UserProfileState.updateRequiresLogout(
            'Email updated successfully. Please login again.',
          ),
        );
      },
    );
  }

  Future<void> _onChangePassword(
    String currentPassword,
    String newPassword,
    Emitter<UserProfileState> emit,
  ) async {
    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) {
      debugPrint(
        'UserProfileBloc: _onChangePassword: User data is null (state: $state)',
      );
      return;
    }

    debugPrint(
      'UserProfileBloc: Changing password. CustomerId: ${userData.user.id}',
    );

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.changePassword(
      customerId: userData.user.id,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    await result.fold(
      (error) async {
        debugPrint('UserProfileBloc: Change password failed: ${error.message}');
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (success) async {
        if (success) {
          debugPrint('UserProfileBloc: Change password success');
          emit(
            const UserProfileState.updateRequiresLogout(
              'Password changed successfully. Please login again.',
            ),
          );
        } else {
          debugPrint('UserProfileBloc: Change password returned success=false');
          emit(const UserProfileState.error('Failed to change password'));
          _reloadProfile();
        }
      },
    );
  }

  Future<void> _onAddAddress(
    Map<String, dynamic> address,
    Emitter<UserProfileState> emit,
  ) async {
    if (kDebugMode) {
      print('[UserProfileBloc] Adding address');
    }

    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      basicInfoUpdateSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      mobileUpdateSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      imageUploadSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) {
      if (kDebugMode) {
        print('[UserProfileBloc] _onAddAddress: blocked — '
            'state is ${state.runtimeType}, need loaded/success');
      }
      emit(const UserProfileState.error('User not loaded'));
      return;
    }

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final currentAddresses = userData.user.addresses ?? [];
    List<Map<String, dynamic>> addressList = currentAddresses
        .map((e) => _addressEntityToJson(e))
        .toList();

    final isDefaultShipping = address['default_shipping'] == true;
    final isDefaultBilling = address['default_billing'] == true;

    if (isDefaultShipping) {
      for (var i = 0; i < addressList.length; i++) {
        addressList[i]['default_shipping'] = false;
      }
    }
    if (isDefaultBilling) {
      for (var i = 0; i < addressList.length; i++) {
        addressList[i]['default_billing'] = false;
      }
    }

    addressList.add(address);

    final result = await _repository.updateAddressList(
      user: userData.user,
      addresses: addressList,
    );

    result.fold(
      (l) {
        if (kDebugMode) {
          print('[UserProfileBloc] Error adding address: ${l.message}');
        }
        emit(UserProfileState.error(l.message));
        _reloadProfile();
      },
      (success) {
        if (kDebugMode) {
          print('[UserProfileBloc] Address added successfully');
        }
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: 'Address added successfully',
            user: userData.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
        _reloadProfile();
      },
    );
  }

  Future<void> _onUpdateAddress(
    Map<String, dynamic> address,
    Emitter<UserProfileState> emit,
  ) async {
    if (kDebugMode) {
      print('[UserProfileBloc] Updating address');
    }

    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) {
      emit(const UserProfileState.error('User not loaded'));
      return;
    }

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final currentAddresses = userData.user.addresses ?? [];
    List<Map<String, dynamic>> addressList = currentAddresses
        .map((e) => _addressEntityToJson(e))
        .toList();

    final addressId = address['id'];
    final isDefaultShipping = address['default_shipping'] == true;
    final isDefaultBilling = address['default_billing'] == true;

    if (isDefaultShipping) {
      for (var i = 0; i < addressList.length; i++) {
        if (addressList[i]['id'] != addressId) {
          addressList[i]['default_shipping'] = false;
        }
      }
    }
    if (isDefaultBilling) {
      for (var i = 0; i < addressList.length; i++) {
        if (addressList[i]['id'] != addressId) {
          addressList[i]['default_billing'] = false;
        }
      }
    }

    final index = addressList.indexWhere((e) => e['id'] == addressId);
    if (index != -1) {
      addressList[index] = address;
    }

    final result = await _repository.updateAddressList(
      user: userData.user,
      addresses: addressList,
    );

    result.fold(
      (l) {
        if (kDebugMode) {
          print('[UserProfileBloc] Error updating address: ${l.message}');
        }
        emit(UserProfileState.error(l.message));
        _reloadProfile();
      },
      (success) {
        if (kDebugMode) {
          print('[UserProfileBloc] Address updated successfully');
        }
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: 'Address updated successfully',
            user: userData.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
        _reloadProfile();
      },
    );
  }

  Future<void> _onDeleteAddress(
    int addressId,
    Emitter<UserProfileState> emit,
  ) async {
    if (kDebugMode) {
      print('[UserProfileBloc] Deleting address: $addressId');
    }

    final userData = state.mapOrNull(
      loaded: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
    );

    if (userData == null) {
      emit(const UserProfileState.error('User not loaded'));
      return;
    }

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final currentAddresses = userData.user.addresses ?? [];
    List<Map<String, dynamic>> addressList = currentAddresses
        .where((e) => e.id != addressId)
        .map((e) => _addressEntityToJson(e))
        .toList();

    final result = await _repository.updateAddressList(
      user: userData.user,
      addresses: addressList,
    );

    result.fold(
      (l) {
        if (kDebugMode) {
          print('[UserProfileBloc] Error deleting address: ${l.message}');
        }
        emit(UserProfileState.error(l.message));
        _reloadProfile();
      },
      (success) {
        if (kDebugMode) {
          print('[UserProfileBloc] Address deleted successfully');
        }
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: 'Address deleted successfully',
            user: userData.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
        _reloadProfile();
      },
    );
  }

  Map<String, dynamic> _addressEntityToJson(dynamic address) {
    return {
      'id': address.id,
      'customer_id': address.customerId,
      'region': {
        'region_code': address.region.regionCode,
        'region': address.region.region,
        'region_id': address.region.regionId,
      },
      'region_id': address.regionId,
      'country_id': address.countryId,
      'street': address.street,
      'telephone': address.telephone,
      'postcode': address.postcode,
      'city': address.city,
      'firstname': address.firstname,
      'lastname': address.lastname,
      'default_shipping': address.defaultShipping,
      'default_billing': address.defaultBilling,
    };
  }
}
