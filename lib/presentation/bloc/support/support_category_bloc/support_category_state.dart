part of 'support_category_bloc.dart';

enum SupportCategoryStatus { initial, loading, success, empty, update, error }

@freezed
class SupportCategoryState with _$SupportCategoryState {
  const factory SupportCategoryState({
    @Default(SupportCategoryStatus.initial) SupportCategoryStatus status,
    AppErrorEntity? error,
    List<SupportCategoryEntity>? categories,
  }) = _SupportCategoryState;
}
