import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class AppHtml extends StatelessWidget {
  final String data;
  final OnTap? onLinkTap;
  final Map<String, Style>? style;
  final TextAlign? textAlign;
  final List<HtmlExtension>? extensions;

  const AppHtml({
    super.key,
    required this.data,
    this.onLinkTap,
    this.style,
    this.textAlign,
    this.extensions,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Html(
      data: data,
      onLinkTap: onLinkTap,
      style: {
        "body": Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontSize: FontSize(textStyle.bodySmall.fontSize ?? 12),
          fontFamily: GoogleFonts.roboto().fontFamily,
          color: AppColors.text,
          lineHeight: const LineHeight(1.5),
          textAlign: textAlign ?? TextAlign.start,
        ),
        "h1": Style(
          fontSize: FontSize(textStyle.headingSmall.fontSize ?? 18),
          fontWeight: FontWeight.bold,
          margin: Margins.only(bottom: 12),
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        "h2": Style(
          fontSize: FontSize(textStyle.subheading.fontSize ?? 16),
          fontWeight: FontWeight.bold,
          margin: Margins.only(bottom: 12),
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        "h3": Style(
          fontSize: FontSize(textStyle.bodyLargeBold.fontSize ?? 16),
          fontWeight: FontWeight.bold,
          margin: Margins.only(top: 16.h, bottom: 8.h),
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        "p": Style(
          margin: Margins.only(bottom: 12),
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        "ul": Style(
          margin: Margins.only(bottom: 12),
          padding: HtmlPaddings.only(left: 16),
        ),
        "li": Style(
          margin: Margins.only(bottom: 4),
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        "img": Style(
          width: Width(100, Unit.percent),
          margin: Margins.only(bottom: 12),
        ),
        "strong": Style(
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        "a": Style(
          color: AppColors.pickabooBlue,
          fontFamily: GoogleFonts.roboto().fontFamily,
          textDecoration: TextDecoration.none,
        ),
        ...?style,
      },
      extensions: [
        TagExtension(
          tagsToExtend: {"img"},
          builder: (extensionContext) {
            final imageUrl = extensionContext.attributes['src'] ?? '';
            return LayoutBuilder(
              builder: (layoutContext, constraints) {
                final width = constraints.hasBoundedWidth
                    ? constraints.maxWidth
                    : MediaQuery.sizeOf(layoutContext).width;
                return AppImage(
                  imageUrl: imageUrl,
                  width: width,
                  fit: BoxFit.contain,
                );
              },
            );
          },
        ),
        ...?extensions,
      ],
    );
  }
}
