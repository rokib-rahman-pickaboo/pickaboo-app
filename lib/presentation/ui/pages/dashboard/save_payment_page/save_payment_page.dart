// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class SavePaymentPage extends StatefulWidget {
  final String customerId;

  const SavePaymentPage({super.key, required this.customerId});

  @override
  State<SavePaymentPage> createState() => _SavePaymentPageState();
}

class _SavePaymentPageState extends State<SavePaymentPage> {
  late final String _customerId;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    _customerId = authState.maybeWhen(
      authenticated: (_, user) => user.id.toString(),
      orElse: () => widget.customerId,
    );
    _loadPayments();
  }

  void _loadPayments() {
    context.read<SavedPaymentBloc>().add(
      SavedPaymentEvent.getSavedPayments(_customerId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'Saved Payment Methods',
      ),
      body: BlocConsumer<SavedPaymentBloc, SavedPaymentState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            SnackBarUtils.showSuccess(
              context,
              state.successMessage ?? AppStrings.operationSuccessful,
            );
          } else if (state.errorMessage != null &&
              state.savedPayments.isNotEmpty) {
            SnackBarUtils.showError(
              context,
              state.errorMessage ?? AppStrings.somethingWentWrong,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.savedPayments.isEmpty) {
            return const AppLoader.fullPage();
          }

          if (state.errorMessage != null && state.savedPayments.isEmpty) {
            final isOffline = ConnectivityUtils.isNoInternet(state.errorMessage, context);
            return AppErrorView(
              type: isOffline ? AppErrorType.noInternet : AppErrorType.server,
              message: isOffline ? null : state.errorMessage,
              onRetry: _loadPayments,
            );
          }

          return AppLoader.overlay(
            isLoading: state.isLoading,
            child: _buildPaymentList(state.savedPayments),
          );
        },
      ),
    );
  }

  Widget _buildPaymentList(List<SavedPaymentEntity> payments) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          0,
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h + 16.h,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header Card ──
          AppCard(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Row(
              children: [
                Container(
                  width: 42.w,
                  height: 42.h,
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceBlue,
                    borderRadius: AppRadius.buttonRadius,
                  ),
                  child: Icon(
                    Icons.credit_card_outlined,
                    color: AppColors.pickabooBlue,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved Payment Methods',
                        style: AppTypography.sectionTitle,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Manage your saved methods for faster checkout',
                        style: AppTypography.bodyMuted,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          AppSpacing.groupToGroupGap,

          // ── Mobile Wallets / Cards Section ──
          if (payments.isEmpty)
            _buildEmptyState()
          else
            _buildMobileWalletSection(payments),

          SizedBox(height: 24.h),
        ],
      ),
    ),
  );
}

  Widget _buildMobileWalletSection(List<SavedPaymentEntity> payments) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppColors.navy,
                  size: 20.sp,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Mobile Wallets & Cards',
                  style: AppTypography.sectionTitle,
                ),
              ],
            ),
          ),
          Divider(height: 1.h, color: AppColors.border),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: payments.length,
            separatorBuilder: (_, _) =>
                Divider(height: 1.h, indent: 56.w, color: AppColors.border),
            itemBuilder: (context, index) {
              return _buildWalletRow(payments[index]);
            },
          ),
        ],
      ),
    );
  }

  String _maskNumber(String number) {
    final digits = number.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) return digits;
    final last4 = digits.substring(digits.length - 4);
    return '${'*' * (digits.length - 4)}$last4';
  }

  Widget _buildWalletRow(SavedPaymentEntity payment) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 10.h,
      ),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.h,
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.border),
            ),
            child: SvgPicture.asset(
              'assets/new/svg/payment/bkash_icon.svg',
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => Icon(
                Icons.account_balance_wallet_rounded,
                color: AppColors.pickabooBlue,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.network.isNotEmpty ? payment.network : 'bKash',
                  style: AppTypography.cardTitle,
                ),
                SizedBox(height: 2.h),
                Text(
                  _maskNumber(payment.phoneNumber),
                  style: AppTypography.bodyMuted.withLetterSpacing(1),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          OutlinedButton.icon(
            onPressed: () => _showDeleteConfirmation(payment),
            icon: Icon(
              Icons.delete_outline_rounded,
              color: AppColors.red,
              size: 15.sp,
            ),
            label: Text(
              'Delete',
              style: AppTypography.brandActionText.withColor(AppColors.red),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: AppColors.red.withValues(alpha: 0.35),
                width: 1.w,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return AppEmptyView.savedPayments();
  }

  void _showDeleteConfirmation(SavedPaymentEntity payment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Remove Payment Method?',
          style: AppTypography.pageTitle,
        ),
        content: Text(
          'Are you sure you want to remove ${_maskNumber(payment.phoneNumber)}?',
          style: AppTypography.bodyMuted,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTypography.bodyLarge.withColor(AppColors.muted),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<SavedPaymentBloc>().add(
                SavedPaymentEvent.deleteSavedPayment(
                  customerId: _customerId,
                  phoneNumber: payment.phoneNumber,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Remove',
              style: AppTypography.buttonPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
