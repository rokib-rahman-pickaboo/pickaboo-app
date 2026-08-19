import 'package:pickaboo/data/model/common/area_response.dart';
import 'package:pickaboo/domain/entity/common/area_entity.dart';

extension AreaMapper on AreaResponse {
  AreaEntity toEntity() {
    return AreaEntity(
      entityId: entityId ?? '',
      statesName: statesName ?? '',
      citiesName: citiesName ?? '',
      zipCode: zipCode ?? '',
    );
  }
}
