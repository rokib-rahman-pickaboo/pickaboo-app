// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class ChangePhoneNumberBottomSheet extends StatefulWidget {
  final BuildContext pageContext;
  final ValueChanged<String>? onSuccess;

  const ChangePhoneNumberBottomSheet({
    super.key,
    required this.pageContext,
    this.onSuccess,
  });

  static Future<void> show(
    BuildContext context, {
    ValueChanged<String>? onSuccess,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: context.read<UserProfileBloc>(),
        child: ChangePhoneNumberBottomSheet(
          pageContext: context,
          onSuccess: onSuccess,
        ),
      ),
    );
  }

  @override
  State<ChangePhoneNumberBottomSheet> createState() =>
      _ChangePhoneNumberBottomSheetState();
}

class _ChangePhoneNumberBottomSheetState
    extends State<ChangePhoneNumberBottomSheet> {
  final _phoneFormKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  bool _isOtpSent = false;
  Timer? _resendTimer;
  int _resendCountdown = 0;
  String? _phoneError;
  String? _otpError;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      if (_phoneError != null) {
        setState(() => _phoneError = null);
      }
    });
    _otpController.addListener(() {
      if (_otpError != null) {
        setState(() => _otpError = null);
      } else {
        setState(() {});
      }
    });
  }

  String get _formattedCountdown {
    final minutes = (_resendCountdown ~/ 60).toString().padLeft(2, '0');
    final seconds = (_resendCountdown % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    setState(() {
      _resendCountdown = 300; // 5 minutes timeout
    });
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendCountdown > 0) {
        setState(() => _resendCountdown--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  String _normalizePhone(String phone) {
    var cleaned = phone.replaceAll(RegExp(r'[\s-]'), '');
    if (cleaned.startsWith('+880')) {
      cleaned = cleaned.substring(3);
    } else if (cleaned.startsWith('880')) {
      cleaned = cleaned.substring(2);
    }
    return cleaned;
  }

  void _sendOtp() {
    final phone = _normalizePhone(_phoneController.text.trim());
    if (_isOtpSent) {
      if (phone.isNotEmpty) {
        widget.pageContext.read<UserProfileBloc>().add(
              UserProfileEvent.sendPhoneUpdateOtp(phone),
            );
      }
      return;
    }

    if (_phoneFormKey.currentState?.validate() ?? false) {
      widget.pageContext.read<UserProfileBloc>().add(
            UserProfileEvent.sendPhoneUpdateOtp(phone),
          );
    }
  }

  void _verifyOtp() {
    if (_otpFormKey.currentState?.validate() ?? false) {
      final phone = _normalizePhone(_phoneController.text.trim());
      final otp = _otpController.text.trim();
      widget.pageContext.read<UserProfileBloc>().add(
            UserProfileEvent.updateMobile(
              newMobile: phone,
              otp: otp,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomInset = mediaQuery.viewInsets.bottom;

    return BlocConsumer<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (e) {
            setState(() {
              if (_isOtpSent) {
                _otpError = e.message;
              } else {
                _phoneError = e.message;
              }
            });
            SnackBarUtils.showError(
              context,
              e.message.isNotEmpty ? e.message : AppStrings.somethingWentWrong,
            );
          },
          phoneUpdateOtpSent: (s) {
            setState(() {
              _isOtpSent = true;
              _phoneError = null;
              _otpError = null;
            });
            _startResendTimer();
            SnackBarUtils.showInfo(
              context,
              'OTP sent to ${s.mobileNumber}',
            );
          },
          mobileUpdateSuccess: (s) {
            _resendTimer?.cancel();
            Navigator.of(context).pop();
            SnackBarUtils.showSuccess(
              widget.pageContext,
              s.message.isNotEmpty ? s.message : AppStrings.operationSuccessful,
            );
            widget.onSuccess?.call(_phoneController.text.trim());
          },
        );
      },
      builder: (context, state) {
        final isUpdating = state.maybeMap(
          updating: (_) => true,
          orElse: () => false,
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SafeArea(
            top: false,
            bottom: true,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                20.w,
                12.h,
                20.w,
                bottomInset > 0 ? bottomInset + 16.h : 16.h,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _isOtpSent
                    ? _buildOtpStep(isUpdating)
                    : _buildPhoneStep(isUpdating),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPhoneStep(bool isUpdating) {
    return Form(
      key: _phoneFormKey,
      child: Column(
        key: const ValueKey('phone_step'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Change Phone Number',
                style: AppTypography.titleLarge,
              ),
              IconButton(
                onPressed: isUpdating ? null : () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.muted,
                  size: 22.sp,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'Enter your new mobile number to receive an OTP.',
            style: AppTypography.bodySmall,
          ),
          SizedBox(height: 20.h),

          // New Phone Number Label
          Text(
            'New Phone Number',
            style: AppTypography.bodyLarge,
          ),
          SizedBox(height: 6.h),
          TextFormField(
            controller: _phoneController,
            enabled: !isUpdating,
            keyboardType: TextInputType.phone,
            style: AppTypography.bodyLarge.regular(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d+]')),
              LengthLimitingTextInputFormatter(14),
            ],
            decoration: InputDecoration(
              hintText: 'New Phone Number',
              hintStyle: AppTypography.inputHint,
              filled: true,
              fillColor: AppColors.pageBg,
              errorText: _phoneError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: AppColors.pickabooBlue,
                  width: 1.5,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
            ),
            validator: validateMobileNumber,
          ),
          AppSpacing.gapV24,

          // Submit Button
          AppButton.primary(
            text: 'Send OTP',
            isLoading: isUpdating,
            isFullWidth: true,
            height: 48.h,
            borderRadius: BorderRadius.circular(12.r),
            onPressed: isUpdating ? null : _sendOtp,
          ),
        ],
      ),
    );
  }

  Widget _buildOtpStep(bool isUpdating) {
    final phone = _phoneController.text.trim();
    final isOtpValid = _otpController.text.trim().length == 4;

    return Form(
      key: _otpFormKey,
      child: Column(
        key: const ValueKey('otp_step'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Verify Phone Number',
                style: AppTypography.titleLarge,
              ),
              IconButton(
                onPressed: isUpdating ? null : () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.muted,
                  size: 22.sp,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  'OTP sent to $phone',
                  style: AppTypography.bodySmall,
                ),
              ),
              GestureDetector(
                onTap: isUpdating
                    ? null
                    : () {
                        _resendTimer?.cancel();
                        setState(() {
                          _isOtpSent = false;
                          _resendCountdown = 0;
                          _otpController.clear();
                        });
                      },
                child: Text(
                  'Change',
                  style: AppTypography.brandAction,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // ── OTP LABEL (Strictly "OTP", not "OTP Code") ──
          Text(
            'OTP',
            style: AppTypography.bodyLarge,
          ),
          SizedBox(height: 6.h),
          TextFormField(
            controller: _otpController,
            enabled: !isUpdating,
            keyboardType: TextInputType.number,
            style: AppTypography.bodyLarge.regular(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              hintText: 'Enter OTP',
              hintStyle: AppTypography.inputHint,
              filled: true,
              fillColor: AppColors.pageBg,
              errorText: _otpError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: AppColors.pickabooBlue,
                  width: 1.5,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return 'Please enter OTP';
              }
              if (val.trim().length != 4) {
                return 'Please enter a 4-digit OTP';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),

          // Resend OTP Row
          Align(
            alignment: Alignment.centerRight,
            child: _resendCountdown > 0
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 14.sp,
                        color: AppColors.muted,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        AppStrings.resendOtpCountdown(_formattedCountdown),
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  )
                : AppButton.ghost(
                    shrinkWrap: true,
                    text: AppStrings.resendOtp,
                    textStyle: AppTypography.brandAction,
                    isDisabled: isUpdating,
                    onPressed: isUpdating ? null : _sendOtp,
                  ),
          ),
          AppSpacing.gapV20,

          // Verify & Update Button
          AppButton.primary(
            text: 'Verify & Update',
            isLoading: isUpdating,
            isDisabled: !isOtpValid,
            isFullWidth: true,
            height: 48.h,
            borderRadius: BorderRadius.circular(12.r),
            onPressed: (isUpdating || !isOtpValid) ? null : _verifyOtp,
          ),
        ],
      ),
    );
  }
}
