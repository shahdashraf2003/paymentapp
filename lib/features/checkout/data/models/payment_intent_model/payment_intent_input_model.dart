class PaymentIntentInputModel {
 final String currency;
 final String amount;

  PaymentIntentInputModel({required this.currency, required this.amount});
  toJson(){
    return {
      'currency': currency,
      'amount': amount
    };
  }
 
}