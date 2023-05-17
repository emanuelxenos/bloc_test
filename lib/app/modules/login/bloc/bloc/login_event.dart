part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Loading extends LoginEvent {
  String email = '';
  String senha = '';

  Loading({
    required this.email,
    required this.senha,
  });
}
