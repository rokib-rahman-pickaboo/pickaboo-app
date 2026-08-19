import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_payment_model.freezed.dart';
part 'saved_payment_model.g.dart';

@freezed
class SavedPaymentModel with _$SavedPaymentModel {
  const factory SavedPaymentModel({
    @Default('') String network,
    @JsonKey(name: 'phone_number') @Default('') String phoneNumber,
    @JsonKey(name: 'icon_url') @Default('') String iconUrl,
    @JsonKey(name: 'agreement_id') @Default('') String agreementId,
  }) = _SavedPaymentModel;

  factory SavedPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$SavedPaymentModelFromJson(json);
}
