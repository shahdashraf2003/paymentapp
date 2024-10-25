import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            right: 20 + 8,
            left: 20 + 8,
            child: const CustomDashedLine(),
          ),

          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          // ignore: prefer_const_constructors
          Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: const CustomCheckIcon(),
          )
        ],
      ),
    );
  }
}
