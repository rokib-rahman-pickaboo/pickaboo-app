import 'package:pickaboo/domain/entity/common/region_entity.dart';

class AddressEntity {
  final int id;
  final int customerId;
  final RegionEntity region;
  final int regionId;
  final String countryId;
  final List<String> street;
  final String telephone;
  final String postcode;
  final String city;
  final String firstname;
  final String lastname;
  final bool defaultShipping;
  final bool defaultBilling;

  const AddressEntity({
    required this.id,
    required this.customerId,
    required this.region,
    required this.regionId,
    required this.countryId,
    required this.street,
    required this.telephone,
    required this.postcode,
    required this.city,
    required this.firstname,
    required this.lastname,
    required this.defaultShipping,
    required this.defaultBilling,
  });
}
