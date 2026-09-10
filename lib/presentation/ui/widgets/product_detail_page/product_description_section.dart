import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:go_router/go_router.dart';

class ProductDescriptionSection extends StatefulWidget {
  final ProductDetailEntity product;

  const ProductDescriptionSection({super.key, required this.product});

  static const int _collapsedCharLimit = 400;

  @override
  State<ProductDescriptionSection> createState() =>
      _ProductDescriptionSectionState();
}

class _ProductDescriptionSectionState extends State<ProductDescriptionSection> {
  final bool _expanded = false;

  ProductDetailEntity get product => widget.product;

  int _visibleLength(String html) => html
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim()
      .length;

  String _truncateHtml(String html, int max) {
    final buffer = StringBuffer();
    int visible = 0;
    bool inTag = false;
    for (int i = 0; i < html.length; i++) {
      final ch = html[i];
      if (ch == '<') inTag = true;
      if (!inTag) {
        if (visible >= max) break;
        visible++;
      }
      buffer.write(ch);
      if (ch == '>') inTag = false;
    }
    return '${buffer.toString()}…';
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    final fullHtml = product.productDetails;
    final isTruncatable =
        _visibleLength(fullHtml) > ProductDescriptionSection._collapsedCharLimit;
    final displayHtml = (isTruncatable && !_expanded)
        ? _truncateHtml(fullHtml, ProductDescriptionSection._collapsedCharLimit)
        : fullHtml;

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Description',
            style: textStyle.headingSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: 16.h),
          if (fullHtml.isNotEmpty) ...[
            AppHtml(
              data: displayHtml,
              style: {
                "p": Style(
                  margin: Margins.only(top: 4.h, bottom: 14.h),
                  lineHeight: const LineHeight(1.6),
                ),
                "ul": Style(margin: Margins.only(top: 8.h, bottom: 16.h)),
                "li": Style(margin: Margins.only(bottom: 8.h)),
                "table": Style(margin: Margins.only(top: 8.h, bottom: 20.h)),
              },
              extensions: [
                TagExtension(
                  tagsToExtend: {"table"},
                  builder: (extensionContext) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AppHtml(
                        data: extensionContext.element?.outerHtml ?? '',
                        onLinkTap: (url, attributes, element) async {
                          if (url != null) {
                            try {
                              await launchUrl(
                                Uri.parse(url.trim()),
                                mode: LaunchMode.externalApplication,
                              );
                            } catch (e) {
                              debugPrint('Could not launch $url: $e');
                            }
                          }
                        },
                        extensions: const [TableHtmlExtension()],
                        style: {
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
                            backgroundColor: AppColors.mutedLight.withValues(
                              alpha: 0.1,
                            ),
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            textAlign: TextAlign.center,
                            verticalAlign: VerticalAlign.top,
                            border: Border.all(
                              color: AppColors.border,
                              width: 0.5.w,
                            ),
                            color: AppColors.text,
                          ),
                          "td": Style(
                            padding: HtmlPaddings.all(8.w),
                            textAlign: TextAlign.start,
                            verticalAlign: VerticalAlign.top,
                            border: Border.all(
                              color: AppColors.border,
                              width: 0.5.w,
                            ),
                            color: AppColors.text,
                          ),
                          "td p": Style(
                            margin: Margins.zero,
                            padding: HtmlPaddings.zero,
                          ),
                        },
                      ),
                    );
                  },
                ),
                const TableHtmlExtension(),
              ],
            ),
          ],
          SizedBox(height: 16.w),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  'productDescription',
                  pathParameters: {'id': product.id.toString()},
                  extra: {'product': product, 'initialIndex': 1},
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pickabooBlue,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: Text(
                'View Full Description',
                style: textStyle.buttonMedium.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
