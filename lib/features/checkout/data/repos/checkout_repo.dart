
import 'package:dartz/dartz.dart';
import 'package:payment_app/errors/failure.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}

