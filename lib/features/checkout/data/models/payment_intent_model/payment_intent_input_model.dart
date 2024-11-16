class PaymentIntentInputModel {
  final String currency;
  final String amount;
  final String customerId;

  PaymentIntentInputModel({required this.currency, required this.amount,required this.customerId});
  toJson() {
    return {
      'currency': currency,
      'amount': '${amount}00',
      'customer': customerId,
    };
  }
}
