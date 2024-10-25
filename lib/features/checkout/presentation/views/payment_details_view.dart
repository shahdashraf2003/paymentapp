import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_app_bar.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsview extends StatelessWidget {
  const PaymentDetailsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body:    const PaymentDetailsViewBody(),
    );
  }
}
