import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

class ReferralCodePage extends StatefulWidget {
  final String referralCode;

  const ReferralCodePage({super.key, required this.referralCode});

  @override
  State<ReferralCodePage> createState() => _ReferralCodePageState();
}

class _ReferralCodePageState extends State<ReferralCodePage>
    with SingleTickerProviderStateMixin {
  bool _isLoggedIn = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _handleReferralCode();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleReferralCode() async {
    _isLoggedIn = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (token, user) => true,
      orElse: () => false,
    );

    if (!_isLoggedIn) {
      debugPrint('Referral code saved: ${widget.referralCode}');
    } else {
      debugPrint('User already logged in, referral code not applied');
    }
  }

  void _continueToHome() {
    context.go(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textStyle;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _continueToHome();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Container(
                            padding: EdgeInsets.all(24.w),
                            decoration: BoxDecoration(
                              color: _isLoggedIn
                                  ? AppColors.orange.withValues(alpha: 0.1)
                                  : AppColors.green.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isLoggedIn
                                  ? Icons.info_outline
                                  : Icons.check_circle,
                              size: 80.sp,
                              color: _isLoggedIn
                                  ? AppColors.orange
                                  : AppColors.green,
                            ),
                          ),
                        ),
                        SizedBox(height: 32.h),

                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              Text(
                                _isLoggedIn
                                    ? 'Already Existing User'
                                    : 'Referral Code Added!',
                                style: textTheme.headingLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: AppColors.pickabooBlue.withValues(
                                      alpha: 0.3,
                                    ),
                                    width: 1.w,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.badge_outlined,
                                      color: AppColors.pickabooBlue,
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      widget.referralCode,
                                      style: textTheme.bodyLargeMedium.copyWith(
                                        color: AppColors.pickabooBlue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),

                              if (!_isLoggedIn)
                                Container(
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black.withValues(
                                          alpha: 0.05,
                                        ),
                                        blurRadius: 10.r,
                                        offset: Offset(0, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.celebration,
                                        color: AppColors.green,
                                        size: 32.sp,
                                      ),
                                      SizedBox(height: 12.h),
                                      Text(
                                        'Great News!',
                                        style: textTheme.bodyLargeMedium.copyWith(
                                          color: AppColors.text,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        'This referral code will be applied when you sign up. Get ready to enjoy exclusive rewards!',
                                        style: textTheme.bodyMedium.copyWith(
                                          color: AppColors.muted,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              else
                                Text(
                                  'This referral code cannot be applied as you already have an account',
                                  style: textTheme.bodyMedium.copyWith(
                                    color: AppColors.muted,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                color: AppColors.white,
                padding: EdgeInsets.all(16.w),
                child: SafeArea(
                  top: false,
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton.icon(
                      onPressed: _continueToHome,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pickabooBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.white,
                        size: 20.sp,
                      ),
                      label: Text(
                        'Continue Shopping',
                        style: textTheme.buttonMedium.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
