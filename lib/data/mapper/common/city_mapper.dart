import 'package:pickaboo/data/model/common/city_response.dart';
import 'package:pickaboo/domain/entity/common/city_entity.dart';

extension CityMapper on CityResponse {
  CityEntity toEntity() {
    return CityEntity(
      entityId: entityId ?? '',
      statesName: statesName ?? '',
      citiesName: citiesName ?? '',
    );
  }
}
