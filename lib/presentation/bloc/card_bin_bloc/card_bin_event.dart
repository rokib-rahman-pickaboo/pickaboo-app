part of 'card_bin_bloc.dart';

@freezed
class CardBinEvent with _$CardBinEvent {
  const factory CardBinEvent.getStatus({String? orderId}) = _GetStatus;
  const factory CardBinEvent.verify({
    required String orderId,
  }) = _Verify;
  const factory CardBinEvent.apply({
    required String orderId,
    required String cardBin,
  }) = _Apply;
  const factory CardBinEvent.remove({
    required String orderId,
  }) = _Remove;
}
