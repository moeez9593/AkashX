part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class TogglePassword extends LoginEvent {}
class LoginUser extends LoginEvent {

}


class UsernameChanged extends LoginEvent {
  final String username;

  UsernameChanged(this.username);
}


class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}