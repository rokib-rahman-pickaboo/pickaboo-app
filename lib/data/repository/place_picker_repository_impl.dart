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
          debugPrint(
            '🗺️ [PlacePickerRepo] autocomplete → mapped first entity:\n'
            '   address   : ${e.address}\n'
            '   area      : ${e.area}\n'
            '   city      : ${e.city}\n'
            '   district  : ${e.district}\n'
            '   division  : ${e.division}\n'
            '   postCode  : ${e.postCode}\n'
            '   subArea   : ${e.subArea}\n'
            '   subDist   : ${e.subDistrict}',
          );
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
          debugPrint(
            '🗺️ [PlacePickerRepo] reverseGeocode → mapped entity:\n'
            '   address   : ${entity.address}\n'
            '   area      : ${entity.area}\n'
            '   city      : ${entity.city}\n'
            '   district  : ${entity.district}\n'
            '   division  : ${entity.division}   ← will be null if model has no field\n'
            '   postCode  : ${entity.postCode}\n'
            '   subDist   : ${entity.subDistrict}',
          );
        }
        return right(entity);
      },
    );
  }
}
