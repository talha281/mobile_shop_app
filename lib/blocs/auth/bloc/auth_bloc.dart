import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_shop_app/data/models/user_model.dart';
import 'package:mobile_shop_app/data/repositories/user/i_user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IUserRepository userRepository;
  AuthBloc(this.userRepository) : super(AuthInitial());
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      final UserModel? storedUser = await userRepository.getUser();
      final bool token = storedUser!.email != null;
      print('this is the $token ');
      if (token) {
        UserModel? user = await userRepository.getUser();
        yield AuthenticatedState(user: user);
      } else {
        yield UnAuthenticatedState();
      }
    } else if (event is AlreadyLoggedIn) {
      yield AlreadyLoggedInState();
    } else if (event is LogOut) {
      userRepository.signOut(event.context);
      yield Loading();
      yield UnAuthenticatedState();
    }
  }
}
