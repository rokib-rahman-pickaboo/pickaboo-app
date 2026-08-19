import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/data/mapper/banner_mapper/banner_mapper.dart';
import 'package:pickaboo/data/model/banner_response/banner_response.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';
import 'package:pickaboo/presentation/ui/widgets/category_product_page/category_banner_section.dart';

/// Trimmed to the fields the selection logic reads, from the live
/// `/rest/V1/custom-banners/active` payload.
const _payload = <Map<String, dynamic>>[
  {
    'entity_id': 22,
    'title': 'Electronics & Appliances Listing Center',
    'is_active': 'Yes',
    'identifier': 'default-category-banner-list-center',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 0,
    'column_count': 1,
    'for_homepage': 'No',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    'entity_id': 21,
    'title': 'Electronics & Appliances Listing Bottom Mid',
    'is_active': 'Yes',
    'identifier': 'custom-category-banner-three-col-bottom',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 2,
    'column_count': 1,
    'for_homepage': 'No',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    'entity_id': 20,
    'title': 'Electronics & Appliances Listing Bottom Right',
    'is_active': 'Yes',
    'identifier': 'custom-category-banner-three-col-bottom',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 3,
    'column_count': 1,
    'for_homepage': 'No',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    'entity_id': 19,
    'title': 'Electronic & Appliances Listing Bottom Left',
    'is_active': 'Yes',
    'identifier': 'custom-category-banner-three-col-bottom',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 1,
    'column_count': 1,
    'for_homepage': 'No',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    'entity_id': 18,
    'title': 'Electronics & Appliance Listing',
    'is_active': 'Yes',
    'identifier': 'default-category-banner-full-top',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 0,
    'column_count': 1,
    'for_homepage': 'No',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    // category 7 but home surface → excluded
    'entity_id': 17,
    'title': 'electronics right banner',
    'is_active': 'Yes',
    'identifier': 'home-banner-right',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 0,
    'for_homepage': 'Yes',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    // category 7 but home surface → excluded
    'entity_id': 6,
    'title': 'Electronics & Appliances',
    'is_active': 'Yes',
    'identifier': 'home-banner-three-col',
    'category_id': 7,
    'is_category': 'Yes',
    'sort_order': 1,
    'for_homepage': 'Yes',
    'category': {'id': 7, 'name': 'Electronics & Appliances'},
  },
  {
    // for_homepage No, but is_category No and no category → excluded
    'entity_id': 11,
    'title': 'Compare Page Full',
    'is_active': 'Yes',
    'identifier': 'compare-banner-full',
    'is_category': 'No',
    'sort_order': 0,
    'for_homepage': 'No',
  },
  {
    // different category → excluded
    'entity_id': 9,
    'title': 'Computer Accessories',
    'is_active': 'Yes',
    'identifier': 'home-banner-two-col',
    'category_id': 20,
    'is_category': 'Yes',
    'sort_order': 1,
    'for_homepage': 'Yes',
    'category': {'id': 20, 'name': 'Computer Accessories'},
  },
];

List<BannerEntity> get _banners =>
    _payload.map((j) => BannerResponse.fromJson(j).toEntity()).toList();

void main() {
  group('groupBannersForCategory — category 7', () {
    test('selects only active, non-homepage, category-bound banners', () {
      final groups = groupBannersForCategory(_banners, 7);

      final selectedIds = groups
          .expand((g) => g.banners)
          .map((b) => b.entityId)
          .toList();

      expect(selectedIds.toSet(), {18, 22, 21, 20, 19});
    });

    test('groups by identifier: full-top, list-center, three-col-bottom', () {
      final groups = groupBannersForCategory(_banners, 7);

      expect(groups.length, 3);
      expect(groups.map((g) => g.identifier), [
        'default-category-banner-full-top',
        'default-category-banner-list-center',
        'custom-category-banner-three-col-bottom',
      ]);
      expect(groups.map((g) => g.columnCount), [1, 1, 3]);
      expect(groups.map((g) => g.isMultiColumn), [false, false, true]);
      expect(groups.map((g) => g.slot), [
        BannerSlot.top,
        BannerSlot.center,
        BannerSlot.bottom,
      ]);
    });

    test('multi-column row is ordered by sort_order', () {
      final groups = groupBannersForCategory(_banners, 7);
      final row = groups.last;

      expect(row.banners.map((b) => b.entityId), [19, 21, 20]);
    });

    test('excludes homepage banners of the same category', () {
      final groups = groupBannersForCategory(_banners, 7);
      final ids = groups.expand((g) => g.banners).map((b) => b.entityId);

      expect(ids, isNot(contains(17)));
      expect(ids, isNot(contains(6)));
    });

    test('excludes is_category: "No" banners even when for_homepage is "No"', () {
      final groups = groupBannersForCategory(_banners, 7);
      final ids = groups.expand((g) => g.banners).map((b) => b.entityId);

      expect(ids, isNot(contains(11)));
    });

    test('other categories get nothing from this payload', () {
      expect(groupBannersForCategory(_banners, 20), isEmpty);
      expect(groupBannersForCategory(_banners, 0), isEmpty);
    });
  });
}
