import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/auth/bloc/auth_bloc.dart';
import 'package:mobile_shop_app/data/models/user_model.dart';
import 'package:mobile_shop_app/data/repositories/user/i_user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.userRepository) : super(LoginInitial());

  final IUserRepository userRepository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is VerifyLogin) {
      yield Loading();

      bool? isVerified = await userRepository.verifyUser(event.user!);
      String? message =
          (isVerified) ? '' : 'Please Check your email & password';
      print(message);
      if (isVerified) {
        BlocProvider.of<AuthBloc>(event.context!).add(AppStarted());
        //yield LoggingState(isVerified: '');
      } else {
        yield LoggingState(isVerified: message);
      }
    } else if (event is RegisteringUser) {
      yield Loading();
      yield RegisteringState();
    } else if (event is LoggingIn) {
      yield Loading();
      yield LoggingState(isVerified: '');
    } else if (event is StoredInPref) {
      yield Loading();
      userRepository.storeUser(event.user!);
      yield LoggingState(isVerified: '');
    } 
  }
}
