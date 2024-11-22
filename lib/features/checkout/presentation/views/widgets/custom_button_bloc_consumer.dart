import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId:
                      "AU7FgdyH9dIR_S1KFWpE3XHUx_ByrurYiqFfCqTJ4D11ieO2FxUmN-tRm1TD7Y8WbPoOHmIb4PDLOga5",
                  secretKey:
                      "EA1ZZw1i9OPkqhNZTImXR11sSd4L3Gtaxpn5W9fIH_xxsOaiL_o5HJcQUz70_sBjT5ewcgmph05JmrS_",
                  transactions: const [
                    {
                      "amount": {
                        "total": "100",
                        "currency": "USD",
                        "details": {
                          "subtotal": "100",
                          "shipping": "0",
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '10',
                            "currency": "USD"
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '12',
                            "currency": "USD"
                          }
                        ],
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ));
              // PaymentIntentInputModel paymentIntentInputModel =
              //     PaymentIntentInputModel(
              //   amount: '1000',
              //   currency: 'usd',
              //   customerId: 'cus_REH5JrSlv87CJL',
              // );
              // BlocProvider.of<StripePaymentCubit>(context).makePayment(
              //     paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is StripePaymentLoading ? true : false,
            title: 'Continue');
      },
    );
  }
}
