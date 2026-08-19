import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/enums/gender_enum.dart';

import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_event.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_state.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

class EditAccountInformationPage extends StatefulWidget {
  const EditAccountInformationPage({super.key});

  @override
  State<EditAccountInformationPage> createState() =>
      _EditAccountInformationPageState();
}

class _EditAccountInformationPageState
    extends State<EditAccountInformationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  Gender? _selectedGender;
  DateTime? _selectedDate;

  bool _isOtpMode = false;
  bool _hasExistingNumber = false;
  late PhotoPickerBloc _photoPickerBloc;

  @override
  void initState() {
    super.initState();
    _photoPickerBloc = context.read<PhotoPickerBloc>();
    _populateControllers();
  }

  void _populateControllers() {
    final userBloc = context.read<UserProfileBloc>();
    final state = userBloc.state;
    state.mapOrNull(
      loaded: (s) {
        final user = s.user;
        _firstNameController.text = user.firstname;
        _lastNameController.text = user.lastname;

        if (user.gender != null) {
          _selectedGender = Gender.fromValue(user.gender!);
        }

        if (user.dob != null && user.dob!.isNotEmpty) {
          try {
            _selectedDate = DateTime.parse(user.dob!);
          } catch (_) {}
        }

        if (s.mobileNumber != null && s.mobileNumber!.isNotEmpty) {
          _contactNumberController.text = s.mobileNumber!;
          _hasExistingNumber = true;
        }
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _pickProfilePhoto() async {
    _photoPickerBloc.add(const PhotoPickerEvent.pickFromGallery());
  }

  Future<void> _cropAndUpload(String sourcePath) async {
    final colors = context.colors;

    final cropped = await ImageCropper().cropImage(
      sourcePath: sourcePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 80,
      maxWidth: 800,
      maxHeight: 800,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Photo',
          toolbarColor: colors.primary,
          toolbarWidgetColor: colors.white,
          activeControlsWidgetColor: colors.primary,
          lockAspectRatio: true,
          hideBottomControls: false,
          initAspectRatio: CropAspectRatioPreset.square,
        ),
        IOSUiSettings(
          title: 'Crop Photo',
          aspectRatioLockEnabled: true,
          resetAspectRatioEnabled: false,
        ),
      ],
    );

    if (cropped == null || !mounted) return;

    context.read<UserProfileBloc>().add(
      UserProfileEvent.uploadProfileImage(image: File(cropped.path)),
    );
  }

  Future<void> _selectDate() async {
    final colors = context.colors;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: colors.primary,
              onPrimary: colors.white,
              onSurface: colors.text,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectGender() async {
    final colors = context.colors;
    final textTheme = context.textStyle;

    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.fromLTRB(
          20.w,
          20.w,
          20.w,
          20.w + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Gender',
              style: textTheme.bodyLargeMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.text,
              ),
            ),
            SizedBox(height: 20.h),
            ...Gender.values.map((gender) {
              final isSelected = gender == _selectedGender;
              return ListTile(
                title: Text(
                  gender.label,
                  style: textTheme.bodyMedium.copyWith(
                    color: isSelected ? colors.primary : colors.text,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                trailing: isSelected
                    ? Icon(Icons.check, color: colors.primary)
                    : null,
                onTap: () {
                  setState(() => _selectedGender = gender);
                  context.pop();
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _handleNumberChange() {
    setState(() => _isOtpMode = true);
  }

  bool _isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  Future<void> _sendOtp() async {
    if (!_isValidMobileNumber(_contactNumberController.text)) {
      SnackBarUtils.showError(context, 'Please enter valid mobile number');
      return;
    }

    context.read<UserProfileBloc>().add(
      UserProfileEvent.sendPhoneUpdateOtp(_contactNumberController.text),
    );
  }

  Future<void> _verifyOtp() async {
    final mobileErr = validateMobileNumber(_contactNumberController.text);
    if (mobileErr != null) {
      SnackBarUtils.showError(context, mobileErr);
      return;
    }

    final otp = _otpController.text.trim();
    if (!RegExp(r'^\d{4,6}$').hasMatch(otp)) {
      SnackBarUtils.showError(context, 'Please enter a valid OTP');
      return;
    }

    context.read<UserProfileBloc>().add(
      UserProfileEvent.updateMobile(
        newMobile: _contactNumberController.text,
        otp: otp,
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (_firstNameController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, 'Please enter first name');
      return;
    }

    if (_lastNameController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, 'Please enter last name');
      return;
    }

    context.read<UserProfileBloc>().add(
      UserProfileEvent.updateBasicInfo(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        gender: _selectedGender?.value.toString() ?? '',
        dob: _formatDateForApi(_selectedDate),
      ),
    );
  }

  bool _isValidMobileNumber(String number) {
    return validateMobileNumber(number) == null;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Date of Birth';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatDateForApi(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocListener<PhotoPickerBloc, PhotoPickerState>(
      bloc: _photoPickerBloc,
      listener: (context, state) {
        if (state.status == PhotoPickerStatus.success &&
            state.images != null &&
            state.images!.isNotEmpty) {
          final image = state.images!.last;
          _photoPickerBloc.add(const PhotoPickerEvent.clear());
          _cropAndUpload(image.path);
        } else if (state.status == PhotoPickerStatus.error) {
          SnackBarUtils.showError(
            context,
            state.errorMessage ?? 'Error picking image',
          );
        }
      },
      child: BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          state.mapOrNull(
            basicInfoUpdateSuccess: (s) {
              SnackBarUtils.showSuccess(context, s.message);
              context.pop();
            },
            mobileUpdateSuccess: (s) {
              SnackBarUtils.showSuccess(context, s.message);
              setState(() => _isOtpMode = false);
              if (s.mobileNumber != null && s.mobileNumber!.isNotEmpty) {
                _contactNumberController.text = s.mobileNumber!;
                _hasExistingNumber = true;
              }
            },
            imageUploadSuccess: (s) {
              SnackBarUtils.showSuccess(context, s.message);
            },
            phoneUpdateOtpSent: (s) {
              SnackBarUtils.showInfo(
                context,
                'OTP sent to ${s.mobileNumber}. Please check your messages.',
              );
              if (!_isOtpMode) {
                setState(() => _isOtpMode = true);
              }
            },
            updateRequiresLogout: (s) {
              SnackBarUtils.showSuccess(context, s.message);
              context.go(Routes.login);
            },
            error: (s) => SnackBarUtils.showError(context, s.message),
          );
        },
        builder: (context, state) {
          final rawImageUrl = state.mapOrNull(
            loaded: (s) => s.imageUrl,
            updating: (s) => s.imageUrl,
            basicInfoUpdateSuccess: (s) => s.imageUrl,
            mobileUpdateSuccess: (s) => s.imageUrl,
            imageUploadSuccess: (s) => s.imageUrl,
            phoneUpdateOtpSent: (s) => s.imageUrl,
          );

          final imageUrl = _isValidImageUrl(rawImageUrl) ? rawImageUrl : null;

          final isLoading = state.maybeMap(
            loading: (_) => true,
            updating: (_) => true,
            orElse: () => false,
          );

          return Scaffold(
            appBar: AppBar(
              leading: AppBarButton(
                iconPath: 'assets/new/svg/back_nav_icon.svg',
                width: 7.w,
                height: 14.h,
                onPressed: () => Navigator.of(context).pop(),
                iconColor: colors.text,
              ),
              title: Text('Edit Profile', style: context.textStyle.appBarTitle),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colors.white,
                boxShadow: [
                  BoxShadow(
                    color: colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, -2.h),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: ElevatedButton(
                  onPressed: _isOtpMode ? _verifyOtp : _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.button,
                    minimumSize: Size(double.infinity, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: CircularProgressIndicator(color: colors.white),
                        )
                      : Text(
                          _isOtpMode ? 'Verify OTP' : 'Save Changes',
                          style: context.textStyle.buttonMedium.copyWith(
                            color: colors.white,
                          ),
                        ),
                ),
              ),
            ),
            body: ResponsiveContainer(
              child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(16.w),
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: colors.black.withValues(alpha: 0.04),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: _pickProfilePhoto,
                            child: Stack(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.primary.withAlpha(25),
                                    image:
                                        imageUrl != null && imageUrl.isNotEmpty
                                        ? DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              imageUrl,
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: imageUrl == null || imageUrl.isEmpty
                                      ? Icon(
                                          Icons.person,
                                          size: 50.sp,
                                          color: colors.primary,
                                        )
                                      : null,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colors.primary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: colors.white,
                                        width: 2.w,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(8.w),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 18.sp,
                                      color: colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Tap to change photo',
                            style: context.textStyle.bodySmall.copyWith(
                              color: colors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: colors.black.withValues(alpha: 0.04),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: _isOtpMode
                          ? _buildOtpVerificationForm()
                          : _buildEditForm(),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          controller: _firstNameController,
          label: 'First Name',
          placeholder: 'Enter your first name',
        ),
        _buildTextField(
          controller: _lastNameController,
          label: 'Last Name',
          placeholder: 'Enter your last name',
        ),
        Row(
          children: [
            Expanded(
              child: _buildDropdownField(
                label: 'Gender',
                value: _selectedGender?.label ?? 'Select gender',
                onTap: _selectGender,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildDropdownField(
                label: 'Date of Birth',
                value: _formatDate(_selectedDate),
                onTap: _selectDate,
              ),
            ),
          ],
        ),
        _buildTextField(
          controller: _contactNumberController,
          label: 'Contact Number',
          placeholder: 'Enter your phone number',
          enabled: false,
        ),
        GestureDetector(
          onTap: _handleNumberChange,
          child: Text(
            _hasExistingNumber ? 'Change mobile number' : 'Add mobile number',
            style: context.textStyle.bodyMediumMedium
                .withColor(context.colors.primary)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpVerificationForm() {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: PhoneTextField(controller: _contactNumberController),
            ),
            SizedBox(width: 12.w),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: _sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Send',
                  style: context.textStyle.buttonMedium.withColor(colors.white),
                ),
              ),
            ),
          ],
        ),
        _buildTextField(
          controller: _otpController,
          label: 'OTP',
          placeholder: 'Enter OTP',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String placeholder,
    bool enabled = true,
    TextInputType? keyboardType,
  }) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium.copyWith(
            color: colors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          style: textTheme.bodyMedium.copyWith(color: colors.text),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: textTheme.bodyMedium.copyWith(color: colors.gray),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.borderColor.withAlpha(128)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.borderColor.withAlpha(128)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.borderColor.withAlpha(76)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.primary, width: 1.5),
            ),
            filled: !enabled,
            fillColor: enabled ? null : colors.background,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium.copyWith(
            color: colors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border.all(color: colors.borderColor.withAlpha(128)),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: textTheme.bodyMedium.copyWith(
                      color: value.startsWith('Select')
                          ? colors.gray
                          : colors.text,
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: colors.gray, size: 24.sp),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
