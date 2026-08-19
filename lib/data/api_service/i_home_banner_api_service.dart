import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/home_banner_response/home_banner_response.dart';

abstract class HomeBannerApiService {
  Future<Either<ErrorResponse, List<HomeBannerResponse>>> getHomeBanners();
}
