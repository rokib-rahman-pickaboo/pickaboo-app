import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/homepage_offers/homepage_offers_response.dart';

abstract class HomepageOffersApiService {
  Future<Either<ErrorResponse, HomepageOffersResponse>> getHomepageOffers();
}
