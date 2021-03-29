part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoggingState extends LoginState {
  final String? isVerified;

  LoggingState({this.isVerified});
  @override
  List<Object> get props => [isVerified!];
}

class RegisteringState extends LoginState {}

class Loading extends LoginState {}

