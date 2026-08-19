import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';

class PaymentMethodsEntity {
  final List<PaymentMethodEntity> paymentMethods;
  final CartTotalsEntity? totals;

  const PaymentMethodsEntity({
    required this.paymentMethods,
    required this.totals,
  });
}

class PaymentMethodEntity {
  final String code;
  final String title;
  final String subtitle;
  final String? paymentGateway;

  const PaymentMethodEntity({
    required this.code,
    required this.title,
    required this.subtitle,
    this.paymentGateway,
  });
}
