import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/popup/popup_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';

class PopupBannerView extends StatelessWidget {
  final PopupEntity? popup;
  final String linkType;
  final String link;
  final String name;
  final VoidCallback onClose;
  final void Function(String linkType, String link, String name) onLinkTap;

  const PopupBannerView({
    super.key,
    required this.popup,
    required this.linkType,
    required this.link,
    required this.name,
    required this.onClose,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    if (popup == null) return const SizedBox.shrink();

    final media = MediaQuery.of(context);
    final width = media.size.width;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: media.size.height),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, bottom: 32.h),
            child: GestureDetector(
              onTap: onClose,
              child: Image.asset(
                AppAssets.closeCircle,
                width: 42.w,
                height: 42.h,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onClose();
            onLinkTap(linkType, link, name);
          },
          child: Container(
            width: width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: AppRadius.cardRadius,
              color: AppColors.transparent,
            ),
            clipBehavior: Clip.antiAlias,
            child: AppHtml(
              data: popup?.content ?? '',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
        ),
      ),
    );
  }
}
