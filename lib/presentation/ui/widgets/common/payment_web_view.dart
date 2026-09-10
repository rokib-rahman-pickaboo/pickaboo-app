import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
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
          onPageStarted: (String url) {
            debugPrint('🌐 WebView: Page started loading: $url');
            setState(() => _isLoading = true);
            _checkUrl(url);
          },
          onPageFinished: (String url) {
            debugPrint('🌐 WebView: Page finished loading: $url');
            setState(() => _isLoading = false);
            _checkUrl(url);
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('❌ WebView: Resource Error');
            debugPrint('   Description: ${error.description}');
            debugPrint('   Type: ${error.errorType}');
            debugPrint('   Code: ${error.errorCode}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (_checkUrl(request.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    if (widget.formFields != null && widget.formFields!.isNotEmpty) {
      _loadFormPost();
    } else {
      _controller.loadRequest(Uri.parse(widget.url));
    }
  }

  void _loadFormPost() {
    final fields = widget.formFields;
    if (fields == null || fields.isEmpty) {
      debugPrint('⚠️ EBL FormPost: formFields is null/empty — falling back to GET');
      _controller.loadRequest(Uri.parse(widget.url));
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

    debugPrint('   Encoded body (first 300 chars): ${body.substring(0, body.length.clamp(0, 300))}');
    debugPrint('══════════════════════════════════════════════');

    _controller.loadRequest(
      Uri.parse(widget.url),
      method: LoadRequestMethod.post,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: Uint8List.fromList(utf8.encode(body)),
    );
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
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              WebViewWidget(controller: _controller),
              if (_isLoading) const AppLoader.fullPage(),
            ],
          ),
        ),
      ),
    );
  }
}
