import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment({required paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (l) => emit(StripePaymentFailure(l.errMessage)),
      (r) => emit(StripePaymentSuccess()),
    );
  }
  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
