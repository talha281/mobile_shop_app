import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  const RoundedButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: ConstColor.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: ConstColor.white,
          ),
        ),
      ),
    );
  }
}
