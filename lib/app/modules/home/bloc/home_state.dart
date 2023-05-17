part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  String text = 'Olá, Seja Bem-Vindo!';
}

class TextWelcomeSuccess extends HomeState {
  String text = '';
  String textToo = '';
  TextWelcomeSuccess({
    required this.text,
    required this.textToo,
  });
}
