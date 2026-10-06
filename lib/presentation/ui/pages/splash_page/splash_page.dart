import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Uint8List? _gifBytes;
  int _displayDurationMs = 2800;
  bool _minDelayPassed = false;
  bool _hasNavigated = false;
  bool _timerStarted = false;
  bool _hasError = false;
  Timer? _splashTimer;

  @override
  void initState() {
    super.initState();
    _loadAndPrepareGif();
  }

  @override
  void dispose() {
    _splashTimer?.cancel();
    super.dispose();
  }

  /// Loads the GIF asset, strips loop extension blocks in memory to force
  /// single-cycle playback (repetitionCount = 0), and calculates display timing.
  Future<void> _loadAndPrepareGif() async {
    try {
      final data = await rootBundle.load(AppAssets.splashGif);
      final rawBytes = data.buffer.asUint8List();

      // Stripping NETSCAPE2.0 / ANIMEXTS1.0 application extension blocks
      // forces Flutter's Skia engine to report repetitionCount = 0 (play once).
      // Flutter's MultiFrameImageStreamCompleter evaluates:
      //   completedCycles = _framesEmitted ~/ _codec.frameCount;
      //   if (_codec.repetitionCount == -1 || completedCycles <= _codec.repetitionCount)
      // When repetitionCount is 0, completedCycles <= 0 becomes false at the end
      // of cycle 1, guaranteeing the GIF halts permanently on the final frame
      // and NEVER loops or backs to the beginning.
      final singlePlayBytes = _stripLoopExtension(rawBytes);

      // Extract nominal duration directly from frame delays in ~1 ms.
      final rawDurationMs = _extractGifDurationMs(singlePlayBytes);

      // Compute display duration with mobile rendering headroom, capped at 5s.
      _displayDurationMs = _calculateDisplayDurationMs(rawDurationMs);

      if (mounted) {
        setState(() {
          _gifBytes = singlePlayBytes;
        });
      }
    } catch (_) {
      _displayDurationMs = 2500;
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }

    // Safety net: ensure navigation never hangs longer than 5 seconds
    _splashTimer ??= Timer(const Duration(seconds: 5), () {
      _onAnimationFinished();
    });
  }

  /// Removes any NETSCAPE2.0 or ANIMEXTS1.0 Application Extension blocks.
  /// Standard GIF89a without loop extensions defaults to playing once.
  Uint8List _stripLoopExtension(Uint8List rawBytes) {
    final List<int> result = [];
    int i = 0;
    while (i < rawBytes.length) {
      if (i < rawBytes.length - 14 &&
          rawBytes[i] == 0x21 &&
          rawBytes[i + 1] == 0xFF &&
          rawBytes[i + 2] == 0x0B) {
        final isNetscape = rawBytes[i + 3] == 0x4E && // 'N'
            rawBytes[i + 4] == 0x45 && // 'E'
            rawBytes[i + 5] == 0x54 && // 'T'
            rawBytes[i + 6] == 0x53 && // 'S'
            rawBytes[i + 7] == 0x43 && // 'C'
            rawBytes[i + 8] == 0x41 && // 'A'
            rawBytes[i + 9] == 0x50 && // 'P'
            rawBytes[i + 10] == 0x45;  // 'E'

        final isAnimexts = rawBytes[i + 3] == 0x41 && // 'A'
            rawBytes[i + 4] == 0x4E && // 'N'
            rawBytes[i + 5] == 0x49 && // 'I'
            rawBytes[i + 6] == 0x4D && // 'M'
            rawBytes[i + 7] == 0x45 && // 'E'
            rawBytes[i + 8] == 0x58 && // 'X'
            rawBytes[i + 9] == 0x54 && // 'T'
            rawBytes[i + 10] == 0x53;  // 'S'

        if (isNetscape || isAnimexts) {
          int pos = i + 14;
          while (pos < rawBytes.length) {
            final subBlockSize = rawBytes[pos];
            if (subBlockSize == 0) {
              pos++;
              break;
            }
            pos += 1 + subBlockSize;
          }
          i = pos;
          continue;
        }
      }
      result.add(rawBytes[i]);
      i++;
    }
    return Uint8List.fromList(result);
  }

  /// Extracts Graphic Control Extension blocks (0x21 0xF9 0x04) in ~1 ms.
  int _extractGifDurationMs(Uint8List bytes) {
    int totalMs = 0;
    for (int i = 0; i < bytes.length - 7; i++) {
      if (bytes[i] == 0x21 && bytes[i + 1] == 0xF9 && bytes[i + 2] == 0x04) {
        final delay = bytes[i + 4] | (bytes[i + 5] << 8);
        final effectiveDelay = (delay <= 1 ? 10 : delay);
        totalMs += effectiveDelay * 10;
        i += 7;
      }
    }
    return totalMs;
  }

  /// Adapts display duration to accommodate mobile device rendering lag
  /// during app startup while strictly capping at 5 seconds.
  int _calculateDisplayDurationMs(int rawDurationMs) {
    const int maxCapMs = 5000;
    const int minFallbackMs = 2500;

    if (rawDurationMs <= 0) {
      return minFallbackMs;
    }

    // Allow ~35% buffer for mobile rendering overhead during cold start
    int displayMs = (rawDurationMs * 1.35).round();

    // Ensure multi-frame GIFs have adequate real time to render all frames
    if (rawDurationMs >= 1500 && displayMs < 2800) {
      displayMs = 2800;
    }

    // Hard cap at 5.0 seconds maximum
    if (displayMs > maxCapMs) {
      displayMs = maxCapMs;
    }

    return displayMs;
  }

  void _onFirstFrameRendered() {
    if (_timerStarted) return;
    _timerStarted = true;
    _startTimer();
  }

  void _startTimer() {
    _splashTimer?.cancel();
    _splashTimer = Timer(Duration(milliseconds: _displayDurationMs), () {
      _onAnimationFinished();
    });
  }

  void _onAnimationFinished() {
    if (_hasNavigated || !mounted) return;
    setState(() => _minDelayPassed = true);
    _tryNavigate();
  }

  void _tryNavigate() {
    if (_hasNavigated || !mounted) return;
    _hasNavigated = true;
    final authState = context.read<AuthBloc>().state;
    authState.maybeWhen(
      authenticated: (_, _) => context.go(Routes.home),
      unauthenticated: () => context.go(Routes.home),
      orElse: () => context.go(Routes.home),
    );
  }

  Widget _buildFallback() {
    return Container(
      color: AppColors.pickabooBlue,
      child: Center(
        child: Icon(
          Icons.shopping_bag_outlined,
          size: 120.sp,
          color: AppColors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (_gifBytes != null) {
      content = Image.memory(
        _gifBytes!,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame != null) {
            _onFirstFrameRendered();
          }
          return child;
        },
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    } else if (_hasError) {
      content = _buildFallback();
    } else {
      // Seamless white placeholder for ~5ms while single-play bytes load
      content = const SizedBox.expand();
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (!_minDelayPassed || _hasNavigated) return;
        state.maybeWhen(
          authenticated: (_, _) => _tryNavigate(),
          unauthenticated: () => _tryNavigate(),
          orElse: () {},
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SizedBox.expand(
            child: content,
          ),
        ),
      ),
    );
  }
}
