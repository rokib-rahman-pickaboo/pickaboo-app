import 'package:pickaboo/data/mapper/common/region_mapper.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/domain/entity/common/address_entity.dart';

extension AddressMapper on Address {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id ?? 0,
      customerId: customerId ?? 0,
      region: region!.toEntity(),
      regionId: regionId ?? 0,
      countryId: countryId ?? '',
      street: street ?? [],
      telephone: telephone ?? '',
      postcode: postcode ?? '',
      city: city ?? '',
      firstname: firstname ?? '',
      lastname: lastname ?? '',
      defaultShipping: defaultShipping ?? false,
      defaultBilling: defaultBilling ?? false,
    );
  }
}
