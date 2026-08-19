import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/category_banner_response/category_banner_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

abstract class CategoryBannerApiService {
  Future<Either<ErrorResponse, List<CategoryBannerResponse>>> getCategoryBanners({
    required int categoryId,
  });
}
