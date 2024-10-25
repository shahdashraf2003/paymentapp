import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActived = false,
    required this.image,
  });
  final bool isActived;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isActived ? const Color(0xff34A853) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
                color: isActived ? const Color(0xff34A853) : Colors.white,
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0)
          ]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
          ),
        ),
      ),
    );
  }
}
