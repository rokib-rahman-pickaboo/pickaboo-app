import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Standardized PaymentOptionItem styled as a list tile for grouped container views
/// (matching dashboard item list pattern).
class PaymentOptionItem extends StatelessWidget {
  final String id;
  final String title;
  final String asset;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;
  final String? subtitle;
  final Color? subtitleColor;
  final Widget? badge;

  const PaymentOptionItem({
    super.key,
    required this.id,
    required this.title,
    required this.asset,
    required this.isSelected,
    required this.onTap,
    this.isEnabled = true,
    this.subtitle,
    this.subtitleColor,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.5,
        child: Container(
          color: isSelected ? AppColors.surfaceBlue.withValues(alpha: 0.5) : AppColors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          child: Row(
            children: [
              // ── Payment Icon (36x36) ──
              Container(
                width: 36.w,
                height: 36.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppRadius.buttonRadius,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.pickabooBlue.withValues(alpha: 0.4)
                        : AppColors.border,
                  ),
                ),
                child: SvgPicture.asset(asset, fit: BoxFit.contain),
              ),
              SizedBox(width: 12.w),

              // ── Title & Subtitle ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: AppTypography.titleSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (badge != null) ...[
                          SizedBox(width: 8.w),
                          badge!,
                        ],
                      ],
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      _HtmlSubtitle(
                        html: subtitle!,
                        defaultColor: subtitleColor ?? AppColors.muted,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: 8.w),

              // ── Radio Dot ──
              _RadioDot(selected: isSelected),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;

  const _RadioDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.pickabooBlue : AppColors.border,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.pickabooBlue,
                ),
              ),
            )
          : null,
    );
  }
}

class _HtmlSubtitle extends StatelessWidget {
  final String html;
  final Color defaultColor;

  const _HtmlSubtitle({
    required this.html,
    required this.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    final parsed = _parse(html);

    final baseStyle = AppTypography.bodySmall.copyWith(
      color: defaultColor,
      height: 1.25,
    );

    if (parsed.mainText.isEmpty && parsed.linkText == null) {
      return Text(html, style: baseStyle);
    }

    if (parsed.linkText == null) {
      return Text(parsed.mainText, style: baseStyle);
    }

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          if (parsed.mainText.isNotEmpty) TextSpan(text: parsed.mainText),
          if (parsed.linkText != null) ...[
            const TextSpan(text: ' '),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () async {
                  final uri = Uri.tryParse(parsed.linkUrl ?? '');
                  if (uri != null && uri.hasScheme) {
                    try {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    } catch (e) {
                      debugPrint('PaymentOptionItem: could not launch ${parsed.linkUrl}: $e');
                    }
                  }
                },
                child: Text(
                  parsed.linkText!,
                  style: baseStyle.copyWith(
                    color: AppColors.pickabooBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  _ParsedSubtitle _parse(String rawHtml) {
    try {
      final document = html_parser.parse(rawHtml);
      final body = document.body;
      if (body == null) return _ParsedSubtitle(mainText: rawHtml);

      final linkElement = body.querySelector('a');
      final linkText = linkElement?.text.trim();
      final linkUrl = linkElement?.attributes['href'];

      final fullText = body.text.trim();

      String mainText = fullText;
      if (linkText != null && linkText.isNotEmpty) {
        final idx = mainText.lastIndexOf(linkText);
        if (idx != -1) {
          mainText = mainText.substring(0, idx).trim();
        }
      }

      return _ParsedSubtitle(
        mainText: mainText,
        linkText: linkText?.isNotEmpty == true ? linkText : null,
        linkUrl: linkUrl,
      );
    } catch (e) {
      debugPrint('PaymentOptionItem: HTML parse error — $e');
      return _ParsedSubtitle(mainText: rawHtml);
    }
  }
}

class _ParsedSubtitle {
  final String mainText;
  final String? linkText;
  final String? linkUrl;

  const _ParsedSubtitle({
    required this.mainText,
    this.linkText,
    this.linkUrl,
  });
}
