import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/model/payment/saved_payment_model.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';

@lazySingleton
class SavedPaymentMapper {
  SavedPaymentEntity toEntity(SavedPaymentModel model) {
    return SavedPaymentEntity(
      network: model.network,
      phoneNumber: model.phoneNumber,
      iconUrl: model.iconUrl,
      agreementId: model.agreementId,
    );
  }

  List<SavedPaymentEntity> toEntityList(List<SavedPaymentModel> models) {
    return models.map((e) => toEntity(e)).toList();
  }
}
