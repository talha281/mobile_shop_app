part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends AuthEvent {
  final UserModel? user;

  RegisterUser({this.user});

  @override
  List<Object> get props => [user!];
}

class AppStarted extends AuthEvent {}

class AlreadyLoggedIn extends AuthEvent {}

class LoggingEvent extends AuthEvent {}

class LogOut extends AuthEvent {
  final BuildContext context;

  LogOut(this.context);
  @override
  List<Object> get props => [context];
}

