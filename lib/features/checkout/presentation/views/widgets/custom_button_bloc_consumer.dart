import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/widgets/custom_button_widget.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/amount.model.dart';
import 'package:payment_app/features/checkout/data/models/amount_model/details.model.dart';
import 'package:payment_app/features/checkout/data/models/items_list_model/item.model.dart';
import 'package:payment_app/features/checkout/data/models/items_list_model/items.model.dart';
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
              exceutePaypalPayment(context);
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

  void exceutePaypalPayment(BuildContext context) {
    var transactionsData = getTransactionsData();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemList.toJson(),
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
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: DetailsModel(
        subtotal: '100',
        shipping: '0',
        shippingDiscount: 0,
      ),
    );
    List<ItemModel> items = [
      ItemModel(
        name: 'Apple',
        quantity: 4,
        price: '10',
        currency: 'USD',
      ),
      ItemModel(
        name: 'Pineapple',
        quantity: 5,
        price: '12',
        currency: 'USD',
      )
    ];
    var itemList = ItemListModel(items: items);

    return (amount: amount, itemList: itemList);
  }
}
