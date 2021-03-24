import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';
import 'package:mobile_shop_app/resources/utils/text_fields/text_field_util.dart';
import 'package:mobile_shop_app/resources/widgets/rounded_button.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 120),
        child: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 40, left: 50, right: 50),
              child: Column(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  EditTextUtils().getCustomEditTextArea(
                    context: context,
                    controller: nameController,
                    hintValue: "Enter Name",
                    icon: Icons.person_outline,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EditTextUtils().getCustomEditTextArea(
                    context: context,
                    controller: emailController,
                    hintValue: "Enter Email",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EditTextUtils().getCustomEditTextArea(
                    context: context,
                    controller: passwordController,
                    hintValue: "Enter Password",
                    icon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EditTextUtils().getCustomEditTextArea(
                    context: context,
                    controller: confirmPasswordController,
                    hintValue: "Confirm password",
                    icon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "<< Back to Login",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: ConstColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    text: "Register",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
