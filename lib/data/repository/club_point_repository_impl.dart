import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/user_profile_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/domain/repository/club_point_repository.dart';
import 'package:pickaboo/data/mapper/club_point_mapper.dart';

@LazySingleton(as: ClubPointRepository)
class ClubPointRepositoryImpl implements ClubPointRepository {
  final UserProfileApiService _apiService;

  ClubPointRepositoryImpl(this._apiService);

  @override
  Future<Either<AppErrorEntity, ClubPointEntity>> getClubPoints({
    int page = 1,
    int limit = 5,
  }) async {
    final result = await _apiService.getClubPoints(page: page, limit: limit);

    return result.fold(
      (error) =>
          Left(AppErrorEntity(message: error.message ?? 'Unknown error')),
      (response) => Right(response.toEntity()),
    );
  }
}
