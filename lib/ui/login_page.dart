import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';
import 'package:mobile_shop_app/resources/utils/text_fields/text_field_util.dart';
import 'package:mobile_shop_app/resources/widgets/rounded_button.dart';
import 'package:mobile_shop_app/ui/registration_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 120),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 40, left: 50, right: 50),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: ConstColor.primaryColor,
                        foregroundColor: ConstColor.white,
                        radius: 50,
                        child: Icon(
                          Icons.person_outline,
                          size: 70,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      EditTextUtils().getCustomEditTextArea(
                        context: context,
                        controller: emailController,
                        hintValue: "Enter your email",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      EditTextUtils().getCustomEditTextArea(
                        context: context,
                        controller: passwordController,
                        hintValue: "Enter your Passowrd",
                        icon: Icons.lock_outline,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: RoundedButton(
                          text: "Login",
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          MouseRegion(
                            //these two method logic will be done with bloc
                            onHover: (_) {},
                            onExit: (_) {},
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
