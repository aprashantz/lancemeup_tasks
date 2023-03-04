part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends AuthEvent {}

class LoginCheckerEvent extends AuthEvent {}

class LoginClickedEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginClickedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
