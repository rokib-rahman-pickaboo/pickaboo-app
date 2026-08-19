import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_bin_remove_entity.freezed.dart';

@freezed
class CardBinRemoveEntity with _$CardBinRemoveEntity {
  const factory CardBinRemoveEntity({
    required bool success,
    required String message,
    required String previousCoupon,
    required int statusCode,
  }) = _CardBinRemoveEntity;
}
