import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button_widget.dart';
import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({
    super.key,
  });

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(
            child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
              left: 16,
              right: 16,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: 'Pay',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('payment done');
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const ThankYouView();
                      },
                    ));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
