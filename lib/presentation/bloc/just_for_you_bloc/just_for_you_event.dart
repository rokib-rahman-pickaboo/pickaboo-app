part of 'just_for_you_bloc.dart';

@freezed
class JustForYouEvent with _$JustForYouEvent {
  const factory JustForYouEvent.getProducts() = _GetProduct;
  const factory JustForYouEvent.refresh() = _Refresh;
}
