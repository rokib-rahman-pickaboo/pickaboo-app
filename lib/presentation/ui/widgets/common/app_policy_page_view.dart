import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:url_launcher/url_launcher.dart';

/// ============================================================================
/// 📜 REUSABLE POLICY & CMS CONTENT TEMPLATE
/// Provides a modern, cohesive UI for legal & CMS pages:
///   - Hero header card with icon, title, and trust badge
///   - Styled HTML card container with rich typography (headings, paragraphs, lists)
///   - Bottom support footer card ("Need clarification? Contact support")
/// ============================================================================
class AppPolicyPageView extends StatelessWidget {
  final String htmlContent;

  const AppPolicyPageView({
    super.key,
    required this.htmlContent,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          0, // Flush against top app bar divider on scroll
          AppSpacing.sameGroupItemSpacing.w,
          32.h,
        ),
      child: AppCard(
        padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w * 1.5),
        child: AppHtml(
          data: htmlContent,
          onLinkTap: (url, attributes, element) async {
            if (url != null) {
              final trimmedUrl = url.trim();
              if (trimmedUrl.contains('privacy-policy')) {
                context.push(Routes.privacyPolicy);
              } else if (trimmedUrl.contains('slug=')) {
                final uri = Uri.parse(trimmedUrl);
                final slug = uri.queryParameters['slug'];
                if (slug != null) {
                  context.pushNamed(
                    'knowledgeBaseDetailsStandalone',
                    pathParameters: {'id': slug},
                    extra: {
                      'categoryId': slug,
                      'categoryName': element?.text ?? 'Help Articles',
                    },
                  );
                }
              } else {
                try {
                  await launchUrl(
                    Uri.parse(trimmedUrl),
                    mode: LaunchMode.externalApplication,
                  );
                } catch (e) {
                  debugPrint('Could not launch $url: $e');
                }
              }
            }
          },
          style: {
            "body": Style(
              margin: Margins.zero,
              padding: HtmlPaddings.zero,
              fontSize: FontSize(13.sp),
              color: AppColors.navy.withValues(alpha: 0.9),
              lineHeight: const LineHeight(1.55),
            ),
            "h1": Style(
              fontSize: FontSize(15.5.sp),
              fontWeight: FontWeight.w800,
              color: AppColors.navy,
              margin: Margins.only(top: 14.h, bottom: 6.h),
              padding: HtmlPaddings.zero,
            ),
            "h2": Style(
              fontSize: FontSize(14.5.sp),
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
              margin: Margins.only(top: 12.h, bottom: 6.h),
              padding: HtmlPaddings.zero,
            ),
            "h3": Style(
              fontSize: FontSize(13.5.sp),
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
              margin: Margins.only(top: 10.h, bottom: 4.h),
              padding: HtmlPaddings.zero,
            ),
            "h4": Style(
              fontSize: FontSize(13.sp),
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
              margin: Margins.only(top: 8.h, bottom: 4.h),
              padding: HtmlPaddings.zero,
            ),
            "p": Style(
              margin: Margins.only(bottom: 8.h),
              padding: HtmlPaddings.zero,
              fontSize: FontSize(13.sp),
              color: AppColors.navy.withValues(alpha: 0.85),
              lineHeight: const LineHeight(1.55),
            ),
            "ul": Style(
              margin: Margins.only(left: 0, top: 4.h, bottom: 8.h),
              padding: HtmlPaddings.zero,
            ),
            "ol": Style(
              margin: Margins.only(left: 0, top: 4.h, bottom: 8.h),
              padding: HtmlPaddings.zero,
            ),
            "li": Style(
              margin: Margins.only(bottom: 4.h),
              fontSize: FontSize(13.sp),
              color: AppColors.navy.withValues(alpha: 0.85),
              lineHeight: const LineHeight(1.45),
            ),
            "strong": Style(
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
            "b": Style(
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
            "a": Style(
              color: AppColors.pickabooBlue,
              textDecoration: TextDecoration.none,
            ),
            "table": Style(
              backgroundColor: AppColors.white,
              border: Border.all(
                color: AppColors.border,
                width: 0.5.w,
              ),
              margin: Margins.only(top: 8.h, bottom: 8.h),
              verticalAlign: VerticalAlign.top,
            ),
            "th": Style(
              padding: HtmlPaddings.all(8.w),
              backgroundColor: AppColors.surfaceBlue,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              border: Border.all(
                color: AppColors.border,
                width: 0.5.w,
              ),
              color: AppColors.navy,
            ),
            "td": Style(
              padding: HtmlPaddings.all(8.w),
              textAlign: TextAlign.start,
              border: Border.all(
                color: AppColors.border,
                width: 0.5.w,
              ),
              color: AppColors.navy,
            ),
          },
          extensions: const [TableHtmlExtension()],
        ),
      ),
    ),
  );
}
}
