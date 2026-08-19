part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, success, empty, update, error }

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(CategoryStatus.initial) CategoryStatus status,
    AppErrorEntity? error,
    List<CategoryEntity>? categories,
  }) = _CategoryState;
}
