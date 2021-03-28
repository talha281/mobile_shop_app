part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final UserModel? user;

  AuthenticatedState({this.user});
  @override
  List<Object> get props => [user!];
}

class AlreadyLoggedInState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class Loading extends AuthState {}
