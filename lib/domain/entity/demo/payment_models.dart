class Address {
  final String id;
  final String firstname;
  final String lastname;
  final List<String> street;
  final String city;
  final String telephone;
  final bool defaultShipping;
  final bool defaultBilling;

  Address({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.street,
    required this.city,
    required this.telephone,
    this.defaultShipping = false,
    this.defaultBilling = false,
  });

  String get fullName => '$firstname $lastname';
  String get fullAddress => '${street.join(", ")}\n$city\n$telephone';
}

class DeliveryMethod {
  final String carrierCode;
  final String methodCode;
  final String carrierTitle;
  final String methodTitle;
  final double amount;
  bool isSelected;

  DeliveryMethod({
    required this.carrierCode,
    required this.methodCode,
    required this.carrierTitle,
    required this.methodTitle,
    required this.amount,
    this.isSelected = false,
  });
}
