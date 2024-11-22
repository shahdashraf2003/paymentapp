import 'details.model.dart';

class AmountModel {
  final String? total;
  final String ?currency;
  final DetailsModel? details;

  AmountModel({required this.total, required this.currency, required this.details});

  factory AmountModel.toJson(
      Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      details: json['details'] == null
          ? null
          : DetailsModel
              .fromTotal100CurrencyUsdDetailsSubtotal100Shipping0ShippingDiscount0(
                  json['details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details
          ?.toTotal100CurrencyUsdDetailsSubtotal100Shipping0ShippingDiscount0(),
    };
  }
}
