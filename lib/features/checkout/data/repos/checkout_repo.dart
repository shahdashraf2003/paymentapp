import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:payment_app/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, Void>> makePayment({required paymentIntentInputModel});
}

