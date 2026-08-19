part of 'card_bin_bloc.dart';

enum CardBinStatus { initial, loading, success, error }

@freezed
class CardBinState with _$CardBinState {
  const factory CardBinState({
    @Default(CardBinStatus.initial) CardBinStatus status,
    AppErrorEntity? error,
    CardBinStatusEntity? cardBinStatus,
    CardBinVerifyEntity? cardBinVerifyResponse,
    CardBinEntity? cardBinResponse,
    CardBinRemoveEntity? cardBinRemoveResponse,
    String? appliedBinNumber,
  }) = _CardBinState;
}
