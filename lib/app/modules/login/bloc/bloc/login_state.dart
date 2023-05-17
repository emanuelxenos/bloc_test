part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  String email = '';
  String senha = '';

  LoginLoading({
    required this.email,
    required this.senha,
  });
}
