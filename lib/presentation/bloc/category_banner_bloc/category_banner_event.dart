part of 'category_banner_bloc.dart';

@freezed
class CategoryBannerEvent with _$CategoryBannerEvent {
  const factory CategoryBannerEvent.load({required int categoryId}) = _Load;
}
