part of 'promotion_slider_bloc.dart';

enum PromotionSliderStatus { initial, loading, success, error }

@freezed
class PromotionSliderState with _$PromotionSliderState {
  const factory PromotionSliderState({
    @Default(PromotionSliderStatus.initial) PromotionSliderStatus status,
    AppErrorEntity? error,
    @Default([]) List<PromotionSliderEntity> slides,
  }) = _PromotionSliderState;
}
