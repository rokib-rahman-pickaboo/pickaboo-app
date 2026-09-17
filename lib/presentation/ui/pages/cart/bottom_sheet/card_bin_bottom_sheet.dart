import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class CardBinBottomSheet extends StatefulWidget {
  final String orderId;
  const CardBinBottomSheet({super.key, required this.orderId});

  static void show(BuildContext context, String orderId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (sheetCtx) => BlocProvider.value(
        value: context.read<CardBinBloc>(),
        child: CardBinBottomSheet(orderId: orderId),
      ),
    );
  }

  @override
  State<CardBinBottomSheet> createState() => _CardBinBottomSheetState();
}

class _CardBinBottomSheetState extends State<CardBinBottomSheet> {
  final TextEditingController _binController = TextEditingController();

  String? _errorText;

  @override
  void dispose() {
    _binController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 56.h,
      textStyle: AppTypography.bodyMedium.bold().copyWith(
        color: AppColors.text,
        fontSize: 20.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.mutedLight.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.pickabooBlue),
      ),
    );

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: bottomInset > 0 ? (bottomInset + 16.h) : (bottomPadding + 16.h),
        top: 16.h,
      ),
        child: BlocConsumer<CardBinBloc, CardBinState>(
          listener: (context, state) {
            if (state.status == CardBinStatus.success && state.cardBinResponse != null) {
              if (state.cardBinResponse!.success) {
                Navigator.pop(context);
              } else {
                setState(() => _errorText = state.cardBinResponse!.message);
              }
            } else if (state.status == CardBinStatus.error && state.error != null) {
              setState(() => _errorText = state.error!.message);
            }
          },
          builder: (context, state) {
            final isLoading = state.status == CardBinStatus.loading;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.mutedLight.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text('Enter Card BIN', style: AppTypography.bodyMedium.bold()),
                SizedBox(height: 8.h),
                Text(
                  'Enter the first 6 digits of your card',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.mutedLight),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Pinput(
                    length: 6,
                    controller: _binController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    autofocus: true,
                    enabled: !isLoading,
                    onChanged: (_) {
                      if (_errorText != null) {
                        setState(() => _errorText = null);
                      }
                    },
                    onCompleted: (pin) {
                      context.read<CardBinBloc>().add(
                        CardBinEvent.apply(orderId: widget.orderId, cardBin: pin),
                      );
                    },
                  ),
                ),
                if (_errorText != null) ...[
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.red.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.red.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.error_outline, color: AppColors.red, size: 18.w),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            _errorText!,
                            style: AppTypography.bodySmall.copyWith(color: AppColors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                AppSpacing.gapV24,
                AppButton.primary(
                  text: 'Submit',
                  isLoading: isLoading,
                  isFullWidth: true,
                  onPressed: isLoading ? null : () {
                    if (_binController.text.length == 6) {
                      context.read<CardBinBloc>().add(
                        CardBinEvent.apply(orderId: widget.orderId, cardBin: _binController.text),
                      );
                    }
                  },
                ),
              ],
            );
          },
        ),
      );
  }
}
