part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class TextWelcomeUpdate extends HomeEvent {
  String text = 'Olá, Seja Bem-Vindo';
  String textToo = '';

  TextWelcomeUpdate({
    required this.text,
    required this.textToo,
  });
}
