import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';

abstract class PlacePickerRepository {
  Future<Either<AppErrorEntity, List<PlacePickResultEntity>>> autocomplete({
    required String query,
  });

  Future<Either<AppErrorEntity, PlacePickResultEntity>> reverseGeocode({
    required double latitude,
    required double longitude,
  });
}
