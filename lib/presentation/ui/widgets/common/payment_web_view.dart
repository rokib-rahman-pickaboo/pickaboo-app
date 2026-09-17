// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final String title;
  final Map<String, String>? formFields;
  final Function(bool success, String? message) onPaymentResult;
  final void Function(String type, String paymentId)? onBkashCallback;
  final void Function(Map<String, String> params)? onNagadCallback;
  final VoidCallback? onUserClosed;

  const PaymentWebView({
    super.key,
    required this.url,
    required this.title,
    this.formFields,
    required this.onPaymentResult,
    this.onBkashCallback,
    this.onNagadCallback,
    this.onUserClosed,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  int _progress = 0;
  bool _hasError = false;
  String? _errorMessage;
  bool _resultSent = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        Platform.isIOS
            ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1'
            : 'Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Mobile Safari/537.36',
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                _progress = progress;
                if (progress >= 100) _isLoading = false;
              });
            }
          },
          onPageStarted: (String url) {
            debugPrint('🌐 WebView: Page started loading: $url');
            if (mounted) {
              setState(() {
                _isLoading = true;
                _hasError = false;
                _errorMessage = null;
              });
            }
            _checkUrl(url);
          },
          onPageFinished: (String url) {
            debugPrint('🌐 WebView: Page finished loading: $url');
            if (mounted) {
              setState(() => _isLoading = false);
            }
            _checkUrl(url);
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('❌ WebView: Resource Error');
            debugPrint('   Description: ${error.description}');
            debugPrint('   Type: ${error.errorType}');
            debugPrint('   Code: ${error.errorCode}');
            if (error.isForMainFrame ?? true) {
              if (mounted) {
                setState(() {
                  _hasError = true;
                  _errorMessage = error.description.isNotEmpty
                      ? error.description
                      : 'Could not connect to payment gateway.';
                  _isLoading = false;
                });
              }
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            final url = request.url;
            final uri = Uri.tryParse(url);
            if (uri != null && uri.scheme != 'http' && uri.scheme != 'https') {
              debugPrint('ℹ️ WebView: Non-HTTP scheme: ${uri.scheme}');
              if (url.startsWith('intent://') || url.startsWith('market://')) {
                return NavigationDecision.prevent;
              }
            }
            if (_checkUrl(url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    _startLoading();
  }

  void _startLoading() {
    if (mounted) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
        _isLoading = true;
        _progress = 0;
      });
    }

    if (widget.formFields != null && widget.formFields!.isNotEmpty) {
      _loadFormPost();
    } else {
      final uri = Uri.tryParse(widget.url.trim());
      if (uri != null && uri.hasScheme) {
        _controller.loadRequest(uri);
      } else {
        _fireResult(false, 'Invalid payment gateway URL');
      }
    }
  }

  void _loadFormPost() {
    final fields = widget.formFields;
    if (fields == null || fields.isEmpty) {
      debugPrint('⚠️ EBL FormPost: formFields is null/empty — falling back to GET');
      final uri = Uri.tryParse(widget.url.trim());
      if (uri != null && uri.hasScheme) {
        _controller.loadRequest(uri);
      }
      return;
    }

    debugPrint('📤 EBL FormPost ══════════════════════════════');
    debugPrint('   Action URL : ${widget.url}');
    debugPrint('   Field count: ${fields.length}');
    fields.forEach((k, v) {
      debugPrint('   [$k] = $v');
    });

    final String body = fields.entries
        .map(
          (e) =>
              '${Uri.encodeQueryComponent(e.key)}'
              '=${Uri.encodeQueryComponent(e.value)}',
        )
        .join('&');

    final uri = Uri.tryParse(widget.url.trim());
    if (uri != null && uri.hasScheme) {
      _controller.loadRequest(
        uri,
        method: LoadRequestMethod.post,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: Uint8List.fromList(utf8.encode(body)),
      );
    } else {
      _fireResult(false, 'Invalid payment gateway URL');
    }
  }

  void _fireResult(bool success, String? message) {
    if (_resultSent) return;
    _resultSent = true;
    _dismissKeyboard();
    widget.onPaymentResult(success, message);
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
    _controller.runJavaScript(
      'if (document.activeElement) document.activeElement.blur();',
    );
  }

  Future<void> _handlePop() async {
    final canGoBack = await _controller.canGoBack();
    if (canGoBack) {
      await _controller.goBack();
      return;
    }
    _showCancelConfirmationDialog();
  }

  void _showCancelConfirmationDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.dialogRadius,
        ),
        title: Text(
          'Cancel Payment?',
          style: AppTypography.titleMedium.bold().withColor(AppColors.text),
        ),
        content: Text(
          'Are you sure you want to cancel the payment? Your order will remain pending.',
          style: AppTypography.bodyMedium.withColor(AppColors.muted),
        ),
        actionsPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        actions: [
          Row(
            children: [
              Expanded(
                child: AppButton.outline(
                  size: AppButtonSize.sm,
                  borderRadius: AppRadius.buttonRadius,
                  borderColor: AppColors.red,
                  textColor: AppColors.red,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  text: 'Cancel Payment',
                  textStyle: AppTypography.bodySmall.bold().withColor(AppColors.red),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    _fireResult(false, 'Payment cancelled by user');
                    widget.onUserClosed?.call();
                    if (mounted && Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppButton.primary(
                  size: AppButtonSize.sm,
                  borderRadius: AppRadius.buttonRadius,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  text: 'Continue',
                  textStyle: AppTypography.bodySmall.bold().withColor(AppColors.white),
                  onPressed: () => Navigator.of(dialogContext).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _checkUrl(String url) {
    debugPrint('🔎 WebView URL Scan: $url');

    if (url.contains(ApiEndpoints.nagadCallbackPath)) {
      if (_resultSent) return true;
      final uri = Uri.tryParse(url);
      final params = uri?.queryParameters.cast<String, String>() ?? {};
      debugPrint('🟠 WebView: Nagad callback detected — params=$params');

      if (widget.onNagadCallback != null) {
        _resultSent = true;
        widget.onNagadCallback!(params);
      } else {
        final status = (params['status'] ?? '').toLowerCase();
        if (status == 'success' || status == 'successful') {
          _fireResult(true, 'Payment Successful');
        } else {
          _fireResult(false, params['message'] ?? 'Payment failed');
        }
      }
      return true;
    }

    final isEblCallback =
        url.contains('/ebl/') || url.contains('/ebl?') || url.contains('ebl?status=');
    if (isEblCallback) {
      final uri = Uri.tryParse(url);
      final status = uri?.queryParameters['status'] ?? '';
      if (status.toLowerCase() == 'success') {
        debugPrint('🎯 WebView: EBL payment SUCCESS');
        _fireResult(true, 'Payment Successful');
        return true;
      } else if (status.isNotEmpty) {
        debugPrint('🚫 WebView: EBL payment FAILED (status=$status)');
        _fireResult(false, 'Payment failed');
        return true;
      }
    }

    if (widget.onBkashCallback != null) {
      if (url.contains(ApiEndpoints.bkashAgreementCallbackPath)) {
        if (_resultSent) return true;
        final paymentId = Uri.tryParse(url)?.queryParameters['paymentID'] ?? '';
        debugPrint('💳 WebView: bKash agreement callback detected — paymentID=$paymentId');
        _resultSent = true;
        widget.onBkashCallback!('agreement', paymentId);
        return true;
      }
      if (url.contains(ApiEndpoints.bkashPaymentCallbackPath)) {
        if (_resultSent) return true;
        final paymentId = Uri.tryParse(url)?.queryParameters['paymentID'] ?? '';
        debugPrint('💳 WebView: bKash payment callback detected — paymentID=$paymentId');
        _resultSent = true;
        widget.onBkashCallback!('payment', paymentId);
        return true;
      }
    }

    if (url.contains('dcastalia-citybank/returnpath')) {
      final status = Uri.tryParse(url)?.queryParameters['STATUS'] ?? '';
      if (status.toUpperCase() == 'APPROVED') {
        debugPrint('🎯 WebView: City Bank payment SUCCESS');
        _fireResult(true, 'Payment Successful');
      } else {
        debugPrint('🚫 WebView: City Bank payment FAILED (STATUS=$status)');
        _fireResult(false, 'City Bank payment failed');
      }
      return true;
    }

    if (url.contains('payment-status') && url.contains('bracbank')) {
      final status = Uri.tryParse(url)?.queryParameters['status'] ?? '';
      if (status == 'Success') {
        debugPrint('🎯 WebView: Brac Bank payment SUCCESS');
        _fireResult(true, 'Payment Successful');
      } else {
        debugPrint('🚫 WebView: Brac Bank payment FAILED (status=$status)');
        _fireResult(false, 'Brac Bank payment failed');
      }
      return true;
    }

    if (url.contains('mtb') &&
        url.contains('status=') &&
        url.contains(Uri.parse(ApiEndpoints.baseUrl).host)) {
      final status = Uri.tryParse(url)?.queryParameters['status'] ?? '';
      if (status == 'Success') {
        debugPrint('🎯 WebView: MTB payment SUCCESS');
        _fireResult(true, 'Payment Successful');
      } else {
        debugPrint('🚫 WebView: MTB payment FAILED (status=$status)');
        _fireResult(false, 'MTB payment failed');
      }
      return true;
    }

    final successMarkers = [
      'STATUS=APPROVED',
      'status=Success',
      'status=success',
      'status=Validated',
      'status=validated',
      'APPROVED',
      'success.php',
      'checkout/onepage/success',
      'payment-status=success',
      'payment/success',
    ];

    for (var marker in successMarkers) {
      if (url.contains(marker)) {
        debugPrint('🎯 WebView: PAYMENT SUCCESS detected! (Marker: $marker)');
        _fireResult(true, 'Payment Successful');
        return true;
      }
    }

    final failureMarkers = [
      'STATUS=DECLINED',
      'checkout/onepage/failure',
      'cancel.php',
      'error.php',
      'payment-status=fail',
      'action=cancel',
      'status=cancel',
    ];

    for (var marker in failureMarkers) {
      if (url.contains(marker)) {
        debugPrint('🚫 WebView: PAYMENT FAILURE detected! (Marker: $marker)');
        _fireResult(false, 'Payment failed or cancelled');
        return true;
      }
    }

    if (url.contains('cancel') ||
        url.contains('fail') ||
        url.contains('error')) {
      if (url.contains(Uri.parse(ApiEndpoints.baseUrl).host) ||
          url.contains('status=fail') ||
          url.contains('status=error')) {
        debugPrint('🚫 WebView: Aggressive Failure marker detected: $url');
        _fireResult(false, 'Payment failed or cancelled');
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _handlePop();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PickabooAppBar(
          title: widget.title.isNotEmpty ? widget.title : "Payment",
          centerTitle: false,
          showBackButton: true,
          onBackTap: _handlePop,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: SafeArea(
            top: false,
            child: Stack(
              children: [
                if (!_hasError) WebViewWidget(controller: _controller),
                if (_isLoading && _progress < 100)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value: _progress > 0 ? _progress / 100.0 : null,
                      backgroundColor: AppColors.border,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.pickabooBlue,
                      ),
                      minHeight: 3.h,
                    ),
                  ),
                if (_isLoading && _progress == 0 && !_hasError)
                  const AppLoader.fullPage(),
                if (_hasError)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 72.w,
                            height: 72.w,
                            decoration: BoxDecoration(
                              color: AppColors.red.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.wifi_off_rounded,
                              size: 36.sp,
                              color: AppColors.red,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Payment Connection Issue',
                            style: AppTypography.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            _errorMessage ??
                                'Unable to connect to payment gateway. Please check your internet connection.',
                            style: AppTypography.bodySmall.mutedLight,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: AppButton.outline(
                                  text: 'Cancel',
                                  borderColor: AppColors.border,
                                  textColor: AppColors.navy,
                                  onPressed: () {
                                    _fireResult(false, 'Payment cancelled');
                                    widget.onUserClosed?.call();
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: AppButton.primary(
                                  text: 'Try Again',
                                  onPressed: _startLoading,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
