import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button_widget.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_app/features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/order_info_item_widget.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset('assets/images/basketimage.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: r'42.97$'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Order Subtotal', value: '0\$'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: '8\$'),
          const Divider(
            height: 34,
            indent: 15,
            endIndent: 10,
            color: Color(0xffC7C7C7),
            thickness: 2,
          ),
          const TotalPrice(
            title: 'Total',
            value: '\$50.97',
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const PaymentDetailsview();
              //     },
              //   ),
              // );
              showBottomSheet(
                  enableDrag: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          StripePaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
