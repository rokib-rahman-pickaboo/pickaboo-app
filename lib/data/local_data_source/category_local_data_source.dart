import 'package:pickaboo/data/model/category_response/category_response.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryResponse>?> getCategoriesIfValid();

  Future<void> insertCategories(List<CategoryResponse> categories);

  Future<void> clearCategories();
}
