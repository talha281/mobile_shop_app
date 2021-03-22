import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';
import 'package:mobile_shop_app/resources/utils/text_fields/text_field_util.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 120),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(top: 70, left: 50, right: 50),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "Let's get started",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: (MediaQuery.of(context).size.width <
                                              500 &&
                                          MediaQuery.of(context).size.height <
                                              500)
                                      ? 10
                                      : 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(top: 70, left: 50, right: 50),
                    child: Column(
                      children: [
                        Text('Login'),
                        SizedBox(
                          height: (MediaQuery.of(context).size.width < 500 &&
                                  MediaQuery.of(context).size.height < 500)
                              ? 5
                              : 10,
                        ),
                        EditTextUtils().getCustomEditTextArea(
                          context: context,
                          controller: emailController,
                          hintValue: "Enter your email",
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
