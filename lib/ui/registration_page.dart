import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/data/models/user_model.dart';
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
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Center(
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
                  icon: Icons.person_add_alt_1_outlined,
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
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 40,
                  width: 120,
                  child: MaterialButton(
                    disabledTextColor: Colors.grey,
                    disabledColor: Colors.blue.shade400,
                    color: ConstColor.primaryColor,
                    elevation: 4,
                    hoverElevation: 20,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      UserModel user = UserModel(
                          userName: nameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                      BlocProvider.of<LoginBloc>(context)
                          .add(StoredInPref(user: user));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a user? ",
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
                          BlocProvider.of<LoginBloc>(context).add(LoggingIn());
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: ConstColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
