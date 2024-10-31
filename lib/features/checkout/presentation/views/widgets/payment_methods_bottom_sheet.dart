import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button_widget.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          CustomButton(title: 'Continue'),
        ],
      ),
    );
  }
}
