import 'package:pickaboo/data/model/customer_status_response/customer_status_response.dart';
import 'package:pickaboo/domain/entity/customer_status/customer_status_entity.dart';

extension CustomerStatusResponseMapper on CustomerStatusResponse {
  CustomerStatusEntity toEntity() {
    return CustomerStatusEntity(
      exists: _parseStatus(status),
      message: message ?? '',
      httpCode: httpCode ?? 0,
    );
  }

  bool _parseStatus(String? value) {
    return value == '1' ||
        value?.toLowerCase() == 'true' ||
        value?.toLowerCase() == 'success';
  }
}
