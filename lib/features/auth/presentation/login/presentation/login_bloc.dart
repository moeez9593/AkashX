import 'package:akashx/features/auth/data/datasource/auth_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/domain/model/resource.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../auth/domain/model/auth_error.dart';

part 'login_event.dart';

part 'login_state.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(AuthDataSource authDataSource) : super(LoginState()) {
    on<TogglePassword>((event, emit) async {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
    on<LoginUser>((event, emit) async {
      if (state.username == null || state.username?.isEmpty == true) {
        emit(state.copyWith(authError: AuthError.invalidUsername));
        return;
      }
      if (state.password == null || state.password?.isEmpty == true) {
        emit(state.copyWith(authError: AuthError.invalidPassword));
        return;
      }
      emit(state.copyWith(isLoading: true));
      return authDataSource
          .loginUser(
        state.username!,
        state.password!,
        true,
      )
          .forEach((element) {
        if (element is ResourceSuccess) {
          emit(state.copyWith(isLoading: false, isLoggedIn: true));
        } else {
          emit(
            state.copyWith(
              errorMessage: (element as ResourceError).error.message,
              authError: (element as ResourceError).error.type,
              isLoading: false,
            ),
          );
        }
      });
    });

    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      username: event.username,
      isEmailValidated: AppUtils.validateEmail(event.username),
    ));
  }
}
