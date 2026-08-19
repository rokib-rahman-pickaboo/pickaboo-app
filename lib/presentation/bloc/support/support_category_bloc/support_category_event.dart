part of 'support_category_bloc.dart';

@freezed
class SupportCategoryEvent with _$SupportCategoryEvent {
  const factory SupportCategoryEvent.getSupportCategories() =
      _GetSupportCategories;
  const factory SupportCategoryEvent.refresh() = _Refresh;
}
