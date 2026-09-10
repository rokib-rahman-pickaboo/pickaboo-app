import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';

class CmsContentPage extends StatelessWidget {
  final CmsBlockEntity cmsBlock;

  const CmsContentPage({super.key, required this.cmsBlock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: cmsBlock.title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: AppHtml(
          data: cmsBlock.content,
          onLinkTap: (url, attributes, element) async {
            debugPrint('Link clicked: ${element?.text}');
            debugPrint('Link URL: $url');

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
    );
  }
}
