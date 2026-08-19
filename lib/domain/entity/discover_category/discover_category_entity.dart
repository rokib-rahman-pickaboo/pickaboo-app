import 'package:pickaboo/domain/entity/discover_category/discover_category_info_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_entity.dart';

class DiscoverCategoryEntity {
  final int entityId;
  final String menuName;
  final String logoUrl;
  final DiscoverCategoryInfoEntity category;
  final List<DiscoverCategoryBannerEntity> banners;
  final List<DiscoverSubsectionEntity> subsections;

  const DiscoverCategoryEntity({
    required this.entityId,
    required this.menuName,
    required this.logoUrl,
    required this.category,
    required this.banners,
    required this.subsections,
  });

  String get firstBannerImageUrl =>
      banners.isNotEmpty ? banners.first.imageUrl : '';
}
