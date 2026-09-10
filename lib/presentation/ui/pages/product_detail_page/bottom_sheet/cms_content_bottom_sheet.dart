import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:url_launcher/url_launcher.dart';

/// Bottom sheet dialog for presenting CMS content (e.g. Pickaboo Verified, Express Delivery info)
class CmsContentBottomSheet extends StatelessWidget {
  final CmsBlockEntity cmsBlock;

  const CmsContentBottomSheet({
    super.key,
    required this.cmsBlock,
  });

  static Future<void> show(BuildContext context, CmsBlockEntity cmsBlock) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => CmsContentBottomSheet(cmsBlock: cmsBlock),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.75,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),

            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      cmsBlock.title,
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.navy,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
                physics: const BouncingScrollPhysics(),
                child: AppHtml(
                  data: cmsBlock.content,
                  style: {
                    "body": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                    ),
                    "h1": Style(
                      margin: Margins.only(top: 0, bottom: 8),
                    ),
                    "h2": Style(
                      margin: Margins.only(top: 0, bottom: 8),
                    ),
                    "h3": Style(
                      margin: Margins.only(top: 0, bottom: 8),
                    ),
                    "p": Style(
                      margin: Margins.only(top: 0, bottom: 8),
                    ),
                  },
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
