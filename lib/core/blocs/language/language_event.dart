part of 'language_bloc.dart';

sealed class LanguageEvent {}

class GetLanguage extends LanguageEvent {}

class SetLanguage extends LanguageEvent {
  final String languageCode;

  SetLanguage(this.languageCode);
}
