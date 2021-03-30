import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/data/models/user_model.dart';
import 'package:mobile_shop_app/resources/constants/colors.dart';
import 'package:mobile_shop_app/resources/utils/text_fields/text_field_util.dart';
import 'package:mobile_shop_app/ui/registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool canPress = false;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  validator() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    bool val = regExp.hasMatch(emailController.text);
    var canhit = passwordController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        val;

    if (canhit) {
      setState(() {
        canPress = true;
      });
    } else {
      setState(() {
        canPress = false;
      });
    }
  }

  @override
  void initState() {
    emailController.addListener(() {
      validator();
      //showSnackForEmail();
    });
    passwordController.addListener(() {
      validator();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            ConstColor.accentColor,
            ConstColor.primaryColor,
          ],
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 120),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoggingState) {
              return Center(
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
                          SizedBox(height: 20),
                          (state.isVerified!.isEmpty)
                              ? Center(
                                  child: Text(
                                    "Let's get started",
                                    style: TextStyle(
                                        color: ConstColor.primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                  state.isVerified!,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                )),
                          SizedBox(
                            height: 30,
                          ),
                          EditTextUtils().getCustomEditTextArea(
                            context: context,
                            controller: emailController,
                            hintValue: "Enter your email",
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          EditTextUtils().getCustomEditTextArea(
                            context: context,
                            controller: passwordController,
                            obscureText: true,
                            validation: true,
                            validationErrorMsg: 'Entered password is wrong',
                            hintValue: "Enter your Passowrd",
                            icon: Icons.lock_outline,
                            maxLength: 8,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            child: MaterialButton(
                              disabledTextColor: Colors.grey,
                              disabledColor: ConstColor.primaryColor
                                  .withOpacity(0.5)
                                  ,
                              color: ConstColor.primaryColor,
                              elevation: 4,
                              hoverElevation: 20,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
                              onPressed: (canPress)
                                  ? () {
                                      UserModel user = UserModel(
                                          email: emailController.text,
                                          password: passwordController.text);

                                      BlocProvider.of<LoginBloc>(context).add(
                                          VerifyLogin(
                                              user: user, context: context));
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
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
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(RegisteringUser());
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: ConstColor.primaryColor,
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
              );
            } else if (state is RegisteringState) {
              return RegistrationPage();
            } else {
              return Container();
            }
          })),
    ));
  }
}
