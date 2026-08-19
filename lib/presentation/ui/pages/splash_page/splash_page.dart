import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _minDelayPassed = false;

  @override
  void initState() {
    super.initState();
    _startMinDelay();
  }

  Future<void> _startMinDelay() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (!mounted) return;
    setState(() => _minDelayPassed = true);
    _tryNavigate();
  }

  void _tryNavigate() {
    final authState = context.read<AuthBloc>().state;
    authState.maybeWhen(
      authenticated: (_, _) => context.go(Routes.home),
      unauthenticated: () => context.go(Routes.home),
      orElse: () => context.go(Routes.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (!_minDelayPassed) return;
        state.maybeWhen(
          authenticated: (_, _) => context.go(Routes.home),
          unauthenticated: () => context.go(Routes.login),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SizedBox.expand(
          child: Image.asset(
            'assets/gif/splash-image.gif',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: context.colors.primary,
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 120.sp,
                    color: context.colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
