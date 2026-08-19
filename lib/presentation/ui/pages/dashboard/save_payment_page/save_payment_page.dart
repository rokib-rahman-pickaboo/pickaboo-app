import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.white,
        elevation: 0.5,
        title: Text(
          'Saved Payment',
          style: context.textStyle.appBarTitle,
        ),
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        iconTheme: IconThemeData(color: colors.text),
      ),
      body: BlocConsumer<SavedPaymentBloc, SavedPaymentState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            SnackBarUtils.showSuccess(context, state.successMessage!);
          } else if (state.errorMessage != null && state.savedPayments.isNotEmpty) {
            SnackBarUtils.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          if (state.isLoading && state.savedPayments.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          if (state.errorMessage != null && state.savedPayments.isEmpty) {
            return AppErrorView(
              type: AppErrorType.server,
              message: state.errorMessage,
              onRetry: _loadPayments,
            );
          }

          return Stack(
            children: [
              _buildPaymentList(state.savedPayments, colors, textStyle),
              if (state.isLoading)
                Container(
                  color: colors.black.withValues(alpha: 0.1),
                  child: Center(
                    child: CircularProgressIndicator(color: colors.primary),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPaymentList(
    List<SavedPaymentEntity> payments,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        _buildHeaderCard(colors, textStyle),
        SizedBox(height: 16.h),
        if (payments.isEmpty)
          _buildEmptyState(colors, textStyle)
        else
          _buildMobileWalletSection(payments, colors, textStyle),
      ],
    );
  }

  Widget _buildHeaderCard(AppColors colors, AppTextStyles textStyle) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.credit_card, color: colors.primary, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saved Payment Methods',
                  style: textStyle.headingSmall.copyWith(
                    color: colors.text,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Manage your saved payment methods for faster checkout',
                  style: textStyle.caption.copyWith(color: colors.gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileWalletSection(
    List<SavedPaymentEntity> payments,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.borderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: colors.text,
                  size: 22.sp,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Mobile Wallet',
                  style: textStyle.bodyLargeBold.copyWith(color: colors.text),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colors.borderColor),
          ...payments.map(
            (payment) => _buildWalletRow(payment, colors, textStyle),
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

  Widget _buildWalletRow(
    SavedPaymentEntity payment,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: colors.borderColor),
            ),
            child: SvgPicture.asset(
              'assets/new/svg/payment/bkash_icon.svg',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.network.isNotEmpty ? payment.network : 'bKash',
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(height: 2.h),
                Text(
                  _maskNumber(payment.phoneNumber),
                  style: textStyle.caption.copyWith(
                    color: colors.gray,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          OutlinedButton.icon(
            onPressed: () =>
                _showDeleteConfirmation(payment, colors, textStyle),
            icon: Icon(Icons.delete_outline, color: colors.red, size: 18.sp),
            label: Text(
              'Delete',
              style: textStyle.buttonMedium.copyWith(color: colors.red),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colors.red.withValues(alpha: 0.4)),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppColors colors, AppTextStyles textStyle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.borderColor),
      ),
      child: Column(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: colors.primary,
              size: 34.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'No saved payment methods',
            style: textStyle.bodyLargeBold.copyWith(color: colors.text),
          ),
          SizedBox(height: 6.h),
          Text(
            'Wallets you save during checkout will show up here '
            'for faster payments next time.',
            style: textStyle.caption.copyWith(
              color: colors.gray,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
    SavedPaymentEntity payment,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colors.white,
        title: Text(
          'Remove Payment Method?',
          style: textStyle.headingMedium.copyWith(color: colors.text),
        ),
        content: Text(
          'Are you sure you want to remove ${_maskNumber(payment.phoneNumber)}?',
          style: textStyle.bodyMedium.copyWith(color: colors.text),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: textStyle.buttonMedium.copyWith(color: colors.gray),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<SavedPaymentBloc>().add(
                SavedPaymentEvent.deleteSavedPayment(
                  customerId: _customerId,
                  phoneNumber: payment.phoneNumber,
                ),
              );
            },
            child: Text(
              'Remove',
              style: textStyle.buttonMedium.copyWith(color: colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
