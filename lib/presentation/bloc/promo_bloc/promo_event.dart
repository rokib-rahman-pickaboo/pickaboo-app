part of 'promo_bloc.dart';

@freezed
class PromoEvent with _$PromoEvent {
  const factory PromoEvent.fetch({
    required String slug,
  }) = _Fetch;
}
