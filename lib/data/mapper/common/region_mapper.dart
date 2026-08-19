import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/domain/entity/common/region_entity.dart';

extension RegionMapper on Region {
  RegionEntity toEntity() {
    return RegionEntity(
      regionCode: regionCode ?? '',
      region: region ?? '',
      regionId: regionId ?? 0,
    );
  }
}
