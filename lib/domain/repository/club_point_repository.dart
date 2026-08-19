import 'package:dartz/dartz.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';

abstract class ClubPointRepository {
  Future<Either<AppErrorEntity, ClubPointEntity>> getClubPoints({
    int page = 1,
    int limit = 5,
  });
}
