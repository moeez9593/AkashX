part of 'login_bloc.dart';

@immutable
class LoginState {
  final String? username;
  final String? password;

  final bool isLoading;
  final String? errorMessage;
  final AuthError? authError;
  final bool isLoggedIn;
  final bool isPasswordVisible;

  LoginState({
    this.username,
    this.password,
    this.isLoggedIn = false,
    this.isLoading = false,
    this.isPasswordVisible = false,
    this.errorMessage,
    this.authError,
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? errorMessage,
    AuthError? authError,
    bool? isLoggedIn,
    bool? isLoading,
    bool? isPasswordVisible,
    bool? isEmailValidated,
  }) {
    return LoginState(
      username: username ?? this.username,
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage,
      authError: authError,
      password: password ?? this.password,
    );
  }
}
