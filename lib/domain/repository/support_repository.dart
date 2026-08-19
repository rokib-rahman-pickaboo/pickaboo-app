import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/api_service/support_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/content_page/content_page_entity.dart';
import 'package:pickaboo/domain/entity/support_article/support_article_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';

abstract class SupportRepository {
  final SupportApiService apiService;

  SupportRepository(this.apiService);

  Future<Either<AppErrorEntity, List<SupportCategoryEntity>>>
  getAllSupportCategories();
  Future<Either<AppErrorEntity, List<SupportArticleEntity>>> getSupportArticle({
    required String categoryId,
  });
  Future<Either<AppErrorEntity, List<SupportArticleEntity>>>
  searchSupportArticle({required String query});

  Future<Either<AppErrorEntity, List<ContentPageEntity>>>
  getTermsAndConditions();
  Future<Either<AppErrorEntity, List<ContentPageEntity>>> getPrivacyPolicy();
  Future<Either<AppErrorEntity, List<ContentPageEntity>>> getReturnPolicy();
}
