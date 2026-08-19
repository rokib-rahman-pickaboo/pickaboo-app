import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/content_response/content_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/support_article_response/support_article_response.dart';
import 'package:pickaboo/data/model/support_category_response/support_category_response.dart';

abstract class SupportApiService {
  Future<Either<ErrorResponse, List<SupportCategoryResponse>>>
  getAllSupportCategories();
  Future<Either<ErrorResponse, List<SupportArticleResponse>>>
  getSupportArticle({required String categoryId});
  Future<Either<ErrorResponse, List<SupportArticleResponse>>>
  searchSupportArticle({required String query});

  Future<Either<ErrorResponse, List<ContentResponse>>> getTermsAndConditions();
  Future<Either<ErrorResponse, List<ContentResponse>>> getPrivacyPolicy();
  Future<Either<ErrorResponse, List<ContentResponse>>> getReturnPolicy();
}
