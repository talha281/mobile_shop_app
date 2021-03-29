import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.accentColor,
        body: Center(
        child: Text(
          'Mobile Shop App',
        ),
      ),
    );
  }
}
