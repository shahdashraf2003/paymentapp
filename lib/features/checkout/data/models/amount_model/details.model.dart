class DetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsModel({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsModel.fromTotal100CurrencyUsdDetailsSubtotal100Shipping0ShippingDiscount0(
      Map<String, dynamic> json) {
    return DetailsModel(
      subtotal: json['subtotal'] as String?,
      shipping: json['shipping'] as String?,
      shippingDiscount: json['shipping_discount'] as int?,
    );
  }

  Map<String, dynamic>
      toTotal100CurrencyUsdDetailsSubtotal100Shipping0ShippingDiscount0() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
