import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/place_picker_api_service.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/place_picker_mapper/place_picker_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/repository/place_picker_repository.dart';

@LazySingleton(as: PlacePickerRepository)
class PlacePickerRepositoryImpl implements PlacePickerRepository {
  final PlacePickerApiService _apiService;

  PlacePickerRepositoryImpl(this._apiService);

  @override
  Future<Either<AppErrorEntity, List<PlacePickResultEntity>>> autocomplete({
    required String query,
  }) async {
    final result = await _apiService.autocomplete(query: query);
    return result.fold(
      (error) => left(error.toEntity()),
      (response) {
        final places = response.places ?? [];
        final entities = places.map((p) => p.toEntity()).toList();
        if (kDebugMode && entities.isNotEmpty) {
          final e = entities.first;
          print('🗺️ [PlacePickerRepo] autocomplete → mapped first entity:');
          print('   address   : ${e.address}');
          print('   area      : ${e.area}');
          print('   city      : ${e.city}');
          print('   district  : ${e.district}');
          print('   division  : ${e.division}   ← will be null if model has no field');
          print('   postCode  : ${e.postCode}');
          print('   subArea   : ${e.subArea}');
          print('   subDist   : ${e.subDistrict}');
        }
        return right(entities);
      },
    );
  }

  @override
  Future<Either<AppErrorEntity, PlacePickResultEntity>> reverseGeocode({
    required double latitude,
    required double longitude,
  }) async {
    final result = await _apiService.reverseGeocode(
      latitude: latitude,
      longitude: longitude,
    );
    return result.fold(
      (error) => left(error.toEntity()),
      (response) {
        final place = response.resolvePlace();
        if (place == null) {
          return left(
            const AppErrorEntity(message: 'No place found at this location'),
          );
        }
        final entity = place.toEntity(latitude: latitude, longitude: longitude);
        if (kDebugMode) {
          print('🗺️ [PlacePickerRepo] reverseGeocode → mapped entity:');
          print('   address   : ${entity.address}');
          print('   area      : ${entity.area}');
          print('   city      : ${entity.city}');
          print('   district  : ${entity.district}');
          print('   division  : ${entity.division}   ← will be null if model has no field');
          print('   postCode  : ${entity.postCode}');
          print('   subDist   : ${entity.subDistrict}');
        }
        return right(entity);
      },
    );
  }
}
