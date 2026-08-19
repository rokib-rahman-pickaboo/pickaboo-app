import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/support_api_service.dart';
import 'package:pickaboo/data/mapper/content_mapper.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/support_article_mapper.dart';
import 'package:pickaboo/data/mapper/support_category_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/content_page/content_page_entity.dart';
import 'package:pickaboo/domain/entity/support_article/support_article_entity.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/domain/repository/support_repository.dart';

@LazySingleton(as: SupportRepository)
class SupportRepositoryImpl implements SupportRepository {
  @override
  final SupportApiService apiService;

  SupportRepositoryImpl(this.apiService);

  @override
  Future<Either<AppErrorEntity, List<SupportCategoryEntity>>>
  getAllSupportCategories() async {
    final result = await apiService.getAllSupportCategories();

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<SupportArticleEntity>>> getSupportArticle({
    required String categoryId,
  }) async {
    final result = await apiService.getSupportArticle(categoryId: categoryId);

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<SupportArticleEntity>>>
  searchSupportArticle({required String query}) async {
    final result = await apiService.searchSupportArticle(query: query);

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<ContentPageEntity>>>
  getTermsAndConditions() async {
    final result = await apiService.getTermsAndConditions();

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<ContentPageEntity>>>
  getPrivacyPolicy() async {
    final result = await apiService.getPrivacyPolicy();

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, List<ContentPageEntity>>>
  getReturnPolicy() async {
    final result = await apiService.getReturnPolicy();

    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }
}
