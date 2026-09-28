import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';

/// Manages user account information, profile updates, and avatar image state.
///
/// **Key Architectural Responsibilities:**
/// 1. **Profile Data Synchronization**: Fetches and caches the user entity, custom attributes (e.g. `customer_mobile`, `profile_image`), and addresses.
/// 2. **Asynchronous Avatar Handling**: Manages immediate cache eviction and timestamp-based URL cache-busting to bridge the backend Google Cloud Storage async processing window (~10-25s).
/// 3. **Two-Step Security Updates**: Coordinates OTP generation and verification for mobile number and email address changes.
/// 4. **Address Book CRUD**: Manages shipping/billing address additions, updates, and deletions.
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
        sendEmailUpdateOtp: (e) async =>
            _onSendEmailUpdateOtp(e.email, emit),
        updateEmail: (e) async => _onUpdateEmail(e.newEmail, e.otp, emit),
        changePassword: (e) async =>
            _onChangePassword(e.currentPassword, e.newPassword, emit),
        addAddress: (e) async => _onAddAddress(e.address, emit),
        updateAddress: (e) async => _onUpdateAddress(e.address, emit),
        deleteAddress: (e) async => _onDeleteAddress(e.addressId, emit),
        clear: (e) async {
          _forceProfileRefresh = true;
          emit(const UserProfileState.initial());
        },
      );
    });
  }

  bool _forceProfileRefresh = false;

  void _reloadProfile() {
    _forceProfileRefresh = true;
    add(const UserProfileEvent.loadUserProfile());
  }

  void refreshProfile() => _reloadProfile();

  /// Loads the customer profile from the repository.
  ///
  /// **Why fallback logic exists:**
  /// The backend `/customers/me` endpoint returns custom attributes asynchronously.
  /// Immediately after an avatar upload, `profile_image` in `customAttributes` may temporarily return `null`.
  /// To prevent UI avatars across the app from flickering or reverting to placeholders, this method:
  /// 1. Checks `customAttributes['profile_image']`.
  /// 2. Falls back to calling `_repository.getProfileImage()`.
  /// 3. Preserves `previousImageUrl` if backend data is temporarily unpopulated.
  Future<void> _onLoadUserProfile(Emitter<UserProfileState> emit) async {

    final userData = _extractUserData();
    final previousImageUrl = userData?.imageUrl;

    emit(
      UserProfileState.loading(
        currentUser: userData?.user,
        imageUrl: previousImageUrl,
        mobileNumber: userData?.mobile,
      ),
    );

    final forceRefresh = _forceProfileRefresh;
    _forceProfileRefresh = false;

    final profileResult = forceRefresh
        ? await _repository.getProfile(forceRefresh: true)
        : await _repository.getProfile();

    await profileResult.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
      },
      (user) async {
        debugPrint('👤 [BLOC:LoadProfile] ========================================');
        debugPrint('👤 [BLOC:LoadProfile] User loaded: id=${user.id}, email=${user.email}, name="${user.firstname} ${user.lastname}"');

        final profileAttr = user.customAttributes
            ?.where((item) => item.attributeCode == 'profile_image')
            .firstOrNull;
        debugPrint('👤 [BLOC:LoadProfile] customAttributes "profile_image" = ${profileAttr != null ? "\"${profileAttr.value}\"" : "null (NOT in customAttributes)"}');

        var profileImageUrl = profileAttr?.value as String?;

        if (profileImageUrl == null || profileImageUrl.isEmpty) {
          debugPrint('👤 [BLOC:LoadProfile] profile_image is empty/null, calling _repository.getProfileImage()...');
          final imgResult = await _repository.getProfileImage();
          imgResult.fold(
            (err) => debugPrint('👤 [BLOC:LoadProfile] ❌ getProfileImage() error: ${err.message}'),
            (url) {
              debugPrint('👤 [BLOC:LoadProfile] ✅ getProfileImage() returned: "$url"');
              if (url.startsWith('http')) {
                profileImageUrl = url;
              } else if (url.startsWith('?')) {
                profileImageUrl =
                    'https://storage.googleapis.com/pickaboo-prod/media/mobikulresized/200x200/customerpicture/${user.id}/${user.id}-profile.jpg$url';
              } else if (url.isNotEmpty && url != '[]') {
                final cleanPath = url.startsWith('/') ? url : '/$url';
                profileImageUrl =
                    'https://storage.googleapis.com/pickaboo-prod/media/mobikulresized/200x200$cleanPath';
              } else {
                debugPrint('👤 [BLOC:LoadProfile] ⚠️ getProfileImage() url was empty or "[]"');
              }
            },
          );
        } else {
          debugPrint('👤 [BLOC:LoadProfile] ℹ️ Using customAttributes profile_image: "$profileImageUrl" (did NOT call getProfileImage)');
        }

        // CRITICAL FALLBACK: If backend has not populated profileImageUrl yet, do NOT wipe out previousImageUrl!
        if ((profileImageUrl == null || profileImageUrl!.isEmpty) &&
            previousImageUrl != null &&
            previousImageUrl.isNotEmpty) {
          debugPrint('👤 [BLOC:LoadProfile] ℹ️ Preserving previousImageUrl "$previousImageUrl" because backend returned null/empty');
          profileImageUrl = previousImageUrl;
        }

        final resolvedImageUrl = profileImageUrl;
        debugPrint('👤 [BLOC:LoadProfile] Before cache bust: resolvedImageUrl="$resolvedImageUrl", _bustImageCacheOnNextLoad=$_bustImageCacheOnNextLoad');
        if (_bustImageCacheOnNextLoad &&
            resolvedImageUrl != null &&
            resolvedImageUrl.isNotEmpty) {
          profileImageUrl = _appendCacheBust(resolvedImageUrl);
          debugPrint('👤 [BLOC:LoadProfile] After cache bust: profileImageUrl="$profileImageUrl"');
        }
        _bustImageCacheOnNextLoad = false;

        final mobileNumber =
            user.customAttributes
                    ?.where((item) => item.attributeCode == 'customer_mobile')
                    .firstOrNull
                    ?.value
                as String?;

        debugPrint('👤 [BLOC:LoadProfile] Emitting UserProfileState.loaded with imageUrl="$profileImageUrl"');
        debugPrint('👤 [BLOC:LoadProfile] ========================================');

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
    var userData = _extractUserData();

    if (userData == null) {
      final profileResult = await _repository.getProfile(forceRefresh: false);
      userData = profileResult.fold(
        (err) => null,
        (user) => (user: user, imageUrl: null, mobile: null),
      );
    }

    if (userData == null) {
      emit(
        const UserProfileState.error(
          'User information not found. Please log in again.',
        ),
      );
      return;
    }

    final isResend = state.maybeWhen(
      phoneUpdateOtpSent: (sentMobile, _, _) => sentMobile == mobileNumber,
      orElse: () => false,
    );

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.sendPhoneUpdateOtp(
      mobile: mobileNumber,
      resend: isResend,
    );

    await result.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
        emit(
          UserProfileState.loaded(
            user: userData!.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
      },
      (response) async {
        emit(
          UserProfileState.phoneUpdateOtpSent(
            mobileNumber: mobileNumber,
            user: userData!.user,
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
    var userData = _extractUserData();

    if (userData == null) {
      final profileResult = await _repository.getProfile(forceRefresh: false);
      userData = profileResult.fold(
        (err) => null,
        (user) => (user: user, imageUrl: null, mobile: null),
      );
    }

    if (userData == null) {
      emit(
        const UserProfileState.error(
          'User information not found. Please log in again.',
        ),
      );
      return;
    }

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: newMobile,
      ),
    );

    final result = await _repository.updateMobile(
      newMobile: newMobile,
      otp: otp,
    );

    await result.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
        // Restore to phoneUpdateOtpSent so the bottom sheet stays in OTP verification step
        emit(
          UserProfileState.phoneUpdateOtpSent(
            mobileNumber: newMobile,
            user: userData!.user,
            imageUrl: userData.imageUrl,
          ),
        );
      },
      (newUser) async {
        final parsedMobile = newUser.customAttributes
            ?.where((item) => item.attributeCode == 'customer_mobile')
            .firstOrNull
            ?.value as String?;
        final updatedMobile = parsedMobile ?? newMobile;

        emit(
          UserProfileState.mobileUpdateSuccess(
            message: 'Mobile number updated successfully',
            user: newUser,
            imageUrl: userData!.imageUrl,
            mobileNumber: updatedMobile,
          ),
        );
        emit(
          UserProfileState.loaded(
            user: newUser,
            imageUrl: userData.imageUrl,
            mobileNumber: updatedMobile,
          ),
        );
      },
    );
  }

  bool _bustImageCacheOnNextLoad = false;

  String _appendCacheBust(String url) {
    if (url.isEmpty) return url;
    final cleanUrl = url.replaceAll(RegExp(r'[?&]v=\d+'), '');
    final sep = cleanUrl.contains('?') ? '&' : '?';
    return '$cleanUrl${sep}v=${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Uploads a new avatar photo with instant whole-app cache-busting.
  ///
  /// **Why this workaround is needed:**
  /// The backend `POST /rest/V1/customer/upload/profilepicture/mine` endpoint returns a generic
  /// `"successfull"` response without returning the new image URL. The backend image resizer and
  /// Google Cloud Storage sync operate asynchronously in the background.
  ///
  /// **To ensure immediate visual update without waiting for the backend queue:**
  /// 1. Constructs a deterministic GCS URL matching Pickaboo storage conventions with a fresh `?v=$timestamp`.
  /// 2. Evicts the previous image URL from [CachedNetworkImage] disk cache and clears [PaintingBinding] memory cache.
  /// 3. Emits [UserProfileState.imageUploadSuccess] with the fresh URL for immediate widget rendering.
  /// 4. Dispatches a delayed background profile reload to fetch final backend state once propagation completes.
  Future<void> _onUploadProfileImage(
    File image,
    Emitter<UserProfileState> emit,
  ) async {
    final userData = _extractUserData();

    if (userData == null) return;

    debugPrint('📸 [BLOC:UploadImage] ========================================');
    debugPrint('📸 [BLOC:UploadImage] _onUploadProfileImage triggered with image path: ${image.path}');
    debugPrint('📸 [BLOC:UploadImage] Current state: ${state.runtimeType}');
    debugPrint('📸 [BLOC:UploadImage] Current userData imageUrl: "${userData.imageUrl}"');

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
        debugPrint('📸 [BLOC:UploadImage] ❌ uploadImage failed: ${error.message}');
        debugPrint('📸 [BLOC:UploadImage] ========================================');
        emit(UserProfileState.error(error.message));
        _reloadProfile();
      },
      (uploadedUrl) async {
        debugPrint('📸 [BLOC:UploadImage] ✅ uploadImage succeeded!');
        debugPrint('📸 [BLOC:UploadImage] uploadedUrl received from repository: "$uploadedUrl"');
        debugPrint('📸 [BLOC:UploadImage] uploadedUrl.startsWith("http"): ${uploadedUrl.startsWith('http')}');
        _bustImageCacheOnNextLoad = true;

        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final String newImageUrl;
        if (uploadedUrl.startsWith('http')) {
          newImageUrl = _appendCacheBust(uploadedUrl);
        } else if (userData.imageUrl != null && userData.imageUrl!.isNotEmpty) {
          newImageUrl = _appendCacheBust(userData.imageUrl!);
        } else {
          newImageUrl =
              'https://storage.googleapis.com/pickaboo-prod/media/mobikulresized/200x200/customerpicture/${userData.user.id}/${userData.user.id}-profile.jpg?v=$timestamp';
        }

        // Evict previous cached network image and clear in-memory image caches immediately
        if (userData.imageUrl != null && userData.imageUrl!.isNotEmpty) {
          try {
            await CachedNetworkImage.evictFromCache(userData.imageUrl!);
          } catch (_) {}
        }
        PaintingBinding.instance.imageCache.clear();
        PaintingBinding.instance.imageCache.clearLiveImages();

        debugPrint('📸 [BLOC:UploadImage] newImageUrl determined: "$newImageUrl"');
        debugPrint('📸 [BLOC:UploadImage] Emitting UserProfileState.imageUploadSuccess and triggering delayed _reloadProfile()...');
        debugPrint('📸 [BLOC:UploadImage] ========================================');
        emit(
          UserProfileState.imageUploadSuccess(
            message: 'Image uploaded successfully',
            user: userData.user,
            imageUrl: newImageUrl,
            mobileNumber: userData.mobile,
          ),
        );

        // Delay background reload to allow server storage & DB sync to finalize
        Future.delayed(const Duration(milliseconds: 2500), () {
          if (!isClosed) {
            _reloadProfile();
          }
        });
      },
    );
  }

  ({UserEntity user, String? imageUrl, String? mobile})? _extractUserData() {
    return state.mapOrNull(
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
      emailUpdateOtpSent: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      emailUpdateSuccess: (s) =>
          (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
      loading: (s) => s.currentUser != null
          ? (user: s.currentUser!, imageUrl: s.imageUrl, mobile: s.mobileNumber)
          : null,
    );
  }

  Future<void> _onSendEmailUpdateOtp(
    String email,
    Emitter<UserProfileState> emit,
  ) async {
    var userData = _extractUserData();

    if (userData == null) {
      final profileResult = await _repository.getProfile(forceRefresh: false);
      userData = profileResult.fold(
        (err) => null,
        (user) => (user: user, imageUrl: null, mobile: null),
      );
    }

    if (userData == null) {
      emit(
        const UserProfileState.error(
          'User information not found. Please log in again.',
        ),
      );
      return;
    }

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.sendEmailUpdateOtp(
      email: email,
    );

    await result.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
        emit(
          UserProfileState.loaded(
            user: userData!.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
      },
      (response) async {
        emit(
          UserProfileState.emailUpdateOtpSent(
            email: email,
            user: userData!.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateEmail(
    String newEmail,
    String otp,
    Emitter<UserProfileState> emit,
  ) async {
    var userData = _extractUserData();

    if (userData == null) {
      final profileResult = await _repository.getProfile(forceRefresh: false);
      userData = profileResult.fold(
        (err) => null,
        (user) => (user: user, imageUrl: null, mobile: null),
      );
    }

    if (userData == null) {
      emit(
        const UserProfileState.error(
          'User information not found. Please log in again.',
        ),
      );
      return;
    }

    emit(
      UserProfileState.updating(
        currentUser: userData.user,
        imageUrl: userData.imageUrl,
        mobileNumber: userData.mobile,
      ),
    );

    final result = await _repository.updateEmail(
      newEmail: newEmail,
      otp: otp,
    );

    await result.fold(
      (error) async {
        emit(UserProfileState.error(error.message));
        emit(
          UserProfileState.emailUpdateOtpSent(
            email: newEmail,
            user: userData!.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
      },
      (newUser) async {
        emit(
          UserProfileState.emailUpdateSuccess(
            message: 'Email address updated successfully',
            user: newUser,
            imageUrl: userData!.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
        emit(
          UserProfileState.loaded(
            user: newUser,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
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
    var userData = _extractUserData();

    if (userData == null) {
      final profileResult = await _repository.getProfile(forceRefresh: false);
      userData = profileResult.fold(
        (err) => null,
        (user) => (user: user, imageUrl: null, mobile: null),
      );
    }

    if (userData == null) {
      emit(
        const UserProfileState.error(
          'User information not found. Please log in again.',
        ),
      );
      return;
    }

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
        emit(UserProfileState.error(error.message));
        emit(
          UserProfileState.loaded(
            user: userData!.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
      },
      (success) async {
        if (success) {
          emit(
            const UserProfileState.updateRequiresLogout(
              'Password changed successfully. Please login again.',
            ),
          );
        } else {
          emit(const UserProfileState.error('Failed to change password'));
          emit(
            UserProfileState.loaded(
              user: userData!.user,
              imageUrl: userData.imageUrl,
              mobileNumber: userData.mobile,
            ),
          );
        }
      },
    );
  }

  Future<void> _onAddAddress(
    Map<String, dynamic> address,
    Emitter<UserProfileState> emit,
  ) async {

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

    final result = await _repository.addAddress(address);

    result.fold(
      (l) {
        emit(UserProfileState.error(l.message));
        _reloadProfile();
      },
      (message) {
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: message.isNotEmpty
                ? message
                : 'Address added successfully',
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

    final result = await _repository.updateAddress(address);

    result.fold(
      (l) {
        emit(UserProfileState.error(l.message));
        _reloadProfile();
      },
      (message) {
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: message.isNotEmpty
                ? message
                : 'Address updated successfully',
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

    final result = await _repository.deleteAddress(addressId);

    result.fold(
      (l) {
        emit(UserProfileState.error(l.message));
        _reloadProfile();
      },
      (message) {
        emit(
          UserProfileState.basicInfoUpdateSuccess(
            message: message.isNotEmpty
                ? message
                : 'Address deleted successfully',
            user: userData.user,
            imageUrl: userData.imageUrl,
            mobileNumber: userData.mobile,
          ),
        );
        _reloadProfile();
      },
    );
  }
}
