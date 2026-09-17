// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:io';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:pickaboo/core/enums/gender_enum.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_event.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_state.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/account_information_page/widgets/change_phone_number_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

/// Modernized Pickaboo Edit Account Information Page
/// Form for updating profile avatar, name, gender, date of birth, and contact number.
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

  Gender? _selectedGender;
  DateTime? _selectedDate;

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
    super.dispose();
  }

  Future<void> _pickProfilePhoto() async {
    _photoPickerBloc.add(const PhotoPickerEvent.pickFromGallery());
  }

  Future<void> _cropAndUpload(String sourcePath) async {
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
          toolbarColor: AppColors.pickabooBlue,
          toolbarWidgetColor: AppColors.white,
          activeControlsWidgetColor: AppColors.pickabooBlue,
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
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.pickabooBlue,
              onPrimary: AppColors.white,
              onSurface: AppColors.navy,
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
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.fromLTRB(
          16.w,
          20.w,
          16.w,
          16.w + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Gender',
              style: AppTypography.titleLarge,
            ),
            SizedBox(height: 16.h),
            ...Gender.values.map((gender) {
              final isSelected = gender == _selectedGender;
              return ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.cardRadius,
                ),
                tileColor: isSelected ? AppColors.surfaceBlue : null,
                title: Text(
                  gender.label,
                  style: isSelected ? AppTypography.brandAction : AppTypography.bodyMedium,
                ),
                trailing: isSelected
                    ? Icon(Icons.check_circle, color: AppColors.pickabooBlue, size: 20.sp)
                    : Icon(Icons.radio_button_unchecked, color: AppColors.mutedLight, size: 20.sp),
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
    ChangePhoneNumberBottomSheet.show(
      context,
      onSuccess: (newMobile) {
        setState(() {
          _contactNumberController.text = newMobile;
          _hasExistingNumber = true;
        });
      },
    );
  }

  bool _isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
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
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        gender: _selectedGender?.value.toString() ?? '',
        dob: _formatDateForApi(_selectedDate),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Date of birth';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatDateForApi(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
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
              if (s.mobileNumber != null && s.mobileNumber!.isNotEmpty) {
                setState(() {
                  _contactNumberController.text = s.mobileNumber!;
                  _hasExistingNumber = true;
                });
              }
            },
            imageUploadSuccess: (s) {
              SnackBarUtils.showSuccess(context, s.message);
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
            backgroundColor: AppColors.pageBg,
            appBar: const PickabooAppBar(
              title: 'Edit Profile',
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w * 2,
                vertical: 14.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.navy.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, -2.h),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: AppButton.primary(
                  height: 50.h,
                  borderRadius: AppRadius.cardRadius,
                  isLoading: isLoading,
                  onPressed: _saveProfile,
                  text: 'Save Changes',
                ),
              ),
            ),
            body: ResponsiveContainer(
              child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                  ),

                  // ── AVATAR PROFILE PHOTO CARD ──
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sameGroupItemSpacing.w,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: AppRadius.cardRadius,
                        border: Border.all(color: AppColors.border),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.navy.withValues(alpha: 0.03),
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
                                  width: 96.w,
                                  height: 96.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.surfaceBlue,
                                    border: Border.all(
                                      color: AppColors.pickabooBlue,
                                      width: 2.w,
                                    ),
                                    image: imageUrl != null && imageUrl.isNotEmpty
                                        ? DecorationImage(
                                            image: AppImage.provider(imageUrl),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: imageUrl == null || imageUrl.isEmpty
                                      ? Icon(
                                          Icons.person,
                                          size: 48.sp,
                                          color: AppColors.pickabooBlue,
                                        )
                                      : null,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.pickabooBlue,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.white,
                                        width: 2.w,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(7.w),
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 16.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Tap to change photo',
                            style: AppTypography.bodySmall.mutedLight,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.groupToGroupSpacing.h),
                  ),

                  // ── PERSONAL DETAILS FORM CARD ──
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sameGroupItemSpacing.w,
                      ),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: AppRadius.cardRadius,
                        border: Border.all(color: AppColors.border),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.navy.withValues(alpha: 0.03),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: _buildEditForm(),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.groupToGroupSpacing.h * 2),
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
            SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
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
            style: AppTypography.link,
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyLarge,
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          style: AppTypography.bodyLarge.regular(),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: AppTypography.inputHint,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            filled: !enabled,
            fillColor: enabled ? AppColors.white : AppColors.pageBg,
            border: const OutlineInputBorder(
              borderRadius: AppRadius.cardRadius,
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: AppRadius.cardRadius,
              borderSide: BorderSide(color: AppColors.border),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.cardRadius,
              borderSide: BorderSide(color: AppColors.border.withValues(alpha: 0.6)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: AppRadius.cardRadius,
              borderSide: BorderSide(color: AppColors.pickabooBlue, width: 1.5),
            ),
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    final bool isPlaceholder = value.startsWith('Select');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyLarge,
        ),
        SizedBox(height: 6.h),
        InkWell(
          onTap: onTap,
          borderRadius: AppRadius.cardRadius,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.border),
              borderRadius: AppRadius.cardRadius,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: isPlaceholder ? AppTypography.inputHint : AppTypography.bodyLarge.regular(),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.mutedLight,
                  size: 22.sp,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
}
