import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/ui/dashboard.dart';
import 'package:mobile_shop_app/ui/login_page.dart';
import 'package:mobile_shop_app/ui/splash.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return Dashboard();
        } else if (state is UnAuthenticatedState) {
          BlocProvider.of<LoginBloc>(context).add(LoggingIn());
          return LoginPage();
        } else if (state is AlreadyLoggedInState) {
          return Dashboard();
        } else {
          print('hey buddy the state which is unlike an piles is nothirng but $state state');
          return Dashboard();
        }
      },
    );
  }
}
