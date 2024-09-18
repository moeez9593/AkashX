part of 'language_bloc.dart';

sealed class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageUpdate extends LanguageState {
  final Locale locale;

  LanguageUpdate(this.locale);
}

class LoggedOut extends LanguageState {}

class LoggingOut extends LanguageState {}
