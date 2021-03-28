import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/ui/dashboard.dart';
import 'package:mobile_shop_app/ui/login_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return Dashboard();
        } else {
          BlocProvider.of<LoginBloc>(context).add(LoggingIn());
          return LoginPage();
        }
      },
    );
  }
}
