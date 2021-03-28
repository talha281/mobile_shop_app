import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/main/home.dart';
import 'package:mobile_shop_app/resources/injection/injection.dart';

import 'blocs/auth/bloc/auth_bloc.dart';
import 'blocs/dashboard/bloc/dashboard_bloc.dart';
import 'blocs/login/bloc/login_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectD();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DashboardBloc>(
            create: (context) => sl<DashboardBloc>(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => sl<AuthBloc>(),
          ),
           BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),)
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
        ));
  }
}
