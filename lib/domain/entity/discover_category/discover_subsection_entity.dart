import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';

class DiscoverSubsectionEntity {
  final String sectionType;
  final String title;
  final int status;
  final String seeMoreLink;
  final String seeMoreLinkType;
  final String seeMoreLinkValue;
  final List<DiscoverSubsectionItemEntity> items;

  const DiscoverSubsectionEntity({
    required this.sectionType,
    required this.title,
    required this.status,
    required this.seeMoreLink,
    required this.seeMoreLinkType,
    required this.seeMoreLinkValue,
    required this.items,
  });
}
