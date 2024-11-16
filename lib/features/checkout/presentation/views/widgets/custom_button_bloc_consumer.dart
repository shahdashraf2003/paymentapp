import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button_widget.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
        if (state is StripePaymentFailure) {
          SnackBar snackBar = SnackBar(
            content: Text(state.errMessage),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: '1000',
                currency: 'usd',
                customerId: 'cus_REDu2t0OHNUcfX',
              );
              BlocProvider.of<StripePaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is StripePaymentLoading ? true : false,
            title: 'Continue');
      },
    );
  }
}
