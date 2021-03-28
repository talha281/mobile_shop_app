part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class VerifyLogin extends LoginEvent {
  final UserModel? user;
  final BuildContext? context;
  VerifyLogin({this.user, this.context});
  @override
  List<Object> get props => [user!, context!];
}

class RegisteringUser extends LoginEvent {}

class LoggingIn extends LoginEvent {}

class StoredInPref extends LoginEvent {
  final UserModel? user;
  StoredInPref({this.user});
  @override
  List<Object> get props => [user!];
}
