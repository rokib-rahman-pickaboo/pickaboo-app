import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/navigation/app_navigator_key.dart';
import 'package:pickaboo/data/services/auth_service.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/navigation/routes/auth_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/cart_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/dashboard_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/order_routes.dart';
import 'package:pickaboo/presentation/navigation/routes/product_routes.dart';

/// Central application router coordinating modular route definitions.
class AppRouter {
  final AuthService authService;

  AppRouter(this.authService);

  late final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    refreshListenable: authService,
    routes: [
      ...authRoutes,
      ...dashboardRoutes,
      ...productRoutes,
      ...cartRoutes,
      ...orderRoutes,
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.error, style: AppTypography.titleLarge),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: AppColors.red),
            SizedBox(height: 16.h),
            Text(
              AppStrings.pageNotFound,
              style: AppTypography.heroTitle.withColor(
                AppColors.navy,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              state.matchedLocation,
              style: AppTypography.bodyMedium.withColor(
                AppColors.muted,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => context.go(Routes.home),
              child: const Text(AppStrings.goHome),
            ),
          ],
        ),
      ),
    ),
  );
}
