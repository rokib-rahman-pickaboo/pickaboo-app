import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

class AddressAddedResult {
  final Map<String, dynamic> address;
  final bool isDefaultShipping;
  final bool isDefaultBilling;

  const AddressAddedResult({
    required this.address,
    required this.isDefaultShipping,
    required this.isDefaultBilling,
  });

  bool get isTemporary => !isDefaultShipping && !isDefaultBilling;

  String get _street {
    final raw = address['street'];
    final parts = raw is List ? raw : const [];
    return parts.join('').replaceAll(RegExp(r'\s+'), '').toLowerCase();
  }

  String? _str(String key) => address[key]?.toString().trim().toLowerCase();

  bool matches(AddressEntity candidate) {
    final candidateStreet = candidate.street
        .join('')
        .replaceAll(RegExp(r'\s+'), '')
        .toLowerCase();

    return candidateStreet == _street &&
        candidate.telephone?.trim().toLowerCase() == _str('telephone') &&
        candidate.postcode?.trim().toLowerCase() == _str('postcode') &&
        candidate.city?.trim().toLowerCase() == _str('city') &&
        candidate.firstname?.trim().toLowerCase() == _str('firstname') &&
        candidate.lastname?.trim().toLowerCase() == _str('lastname');
  }

  AddressEntity? resolveIn(
    List<AddressEntity> addresses, {
    required bool shipping,
  }) {
    if (addresses.isEmpty) return null;

    for (final a in addresses.reversed) {
      if (matches(a)) return a;
    }

    final flagged = addresses
        .where((a) => shipping ? a.defaultShipping : a.defaultBilling)
        .toList();
    return flagged.isNotEmpty ? flagged.last : addresses.last;
  }
}
