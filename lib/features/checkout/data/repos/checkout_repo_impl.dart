import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/stripe_service.dart';

import 'package:payment_app/errors/failure.dart';

import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService apiService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required paymentIntentInputModel}) async {
    await StripeService()
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
    try {
      await StripeService()
          .makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
