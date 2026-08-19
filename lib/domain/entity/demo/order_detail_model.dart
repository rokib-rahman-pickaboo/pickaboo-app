class OrderDetailModel {
  final String orderId;
  final String status;
  final String date;
  final List<OrderItem> items;
  final AddressModel shippingAddress;
  final AddressModel billingAddress;
  final String paymentMethod;
  final OrderSummaryModel summary;
  final List<OrderItem> justForYou;

  OrderDetailModel({
    required this.orderId,
    required this.status,
    required this.date,
    required this.items,
    required this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    required this.summary,
    this.justForYou = const [],
  });
}

class OrderItem {
  final String name;
  final String image;
  final double price;
  final int quantity;

  OrderItem({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

class AddressModel {
  final String name;
  final String street;
  final String city;
  final String phone;

  AddressModel({
    required this.name,
    required this.street,
    required this.city,
    required this.phone,
  });
}

class OrderSummaryModel {
  final double subtotal;
  final double shippingFee;
  final double discount;
  final double grandTotal;

  OrderSummaryModel({
    required this.subtotal,
    required this.shippingFee,
    required this.discount,
    required this.grandTotal,
  });
}
