part of 'promo_bloc.dart';

@freezed
class PromoState with _$PromoState {
  const factory PromoState.initial() = _Initial;
  const factory PromoState.loading() = _Loading;
  const factory PromoState.loaded(PromoEntity promo) = _Loaded;
  const factory PromoState.error(AppErrorEntity error) = _Error;
}
