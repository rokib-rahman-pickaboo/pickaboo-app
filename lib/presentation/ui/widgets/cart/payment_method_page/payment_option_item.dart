import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:url_launcher/url_launcher.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return InkWell(
      onTap: isEnabled ? onTap : null,
      borderRadius: BorderRadius.circular(12.r),
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.6,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? colors.primary
                  : colors.black.withValues(alpha: 0.1),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: colors.gray.withValues(alpha: 0.1)),
                ),
                child: SvgPicture.asset(asset, fit: BoxFit.cover),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: textStyle.listSubtitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colors.text,
                            ),
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
                      SizedBox(height: 4.h),
                      _HtmlSubtitle(
                        html: subtitle!,
                        textStyle: textStyle,
                        colors: colors,
                        defaultColor: subtitleColor ?? colors.textLight,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HtmlSubtitle extends StatelessWidget {
  final String html;
  final AppTextStyles textStyle;
  final AppColors colors;
  final Color defaultColor;

  const _HtmlSubtitle({
    required this.html,
    required this.textStyle,
    required this.colors,
    required this.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    final parsed = _parse(html);

    if (parsed.mainText.isEmpty && parsed.linkText == null) {
      return Text(
        html,
        style: textStyle.listCaption.copyWith(color: defaultColor),
      );
    }

    final baseStyle = textStyle.listCaption.copyWith(color: defaultColor);

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
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: colors.primary,
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
