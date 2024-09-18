import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/routes/screens.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/core/presentation/widgets/default_action_text_button.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/core/presentation/widgets/default_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_labelled_checkbox.dart';
import 'package:akashx/core/presentation/widgets/default_labelled_text_field.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/di/akashx_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_utils.dart';
import '../../../../auth/domain/model/auth_error.dart';
import 'login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state.authError != null && state.authError! != AuthError.server) {
            AppUtils.showToast(
              msg: AppUtils.parseError(state.authError!, context.l10n),
            );
          } else if (state.authError != null &&
              state.authError! != AuthError.server) {
            AppUtils.showToast(
              msg: state.errorMessage!,
            );
          } else if (state.errorMessage != null) {
            AppUtils.showToast(
              msg: state.errorMessage!,
            );
          } else if (state.isLoggedIn) {
            Navigator.pushReplacementNamed(context, ScreenDashboard().route);
          }
        },
        builder: (context, state) {
          return Builder(builder: (context) {
            return Scaffold(
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Assets.svgs.loginBackground.svg(
                    height: context.screenHeight,
                    width: context.screenWidth,
                    fit: BoxFit.cover,
                  ),
                  const DefaultAppBlurredBg(),
                  // The actual login form
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(Insets.large),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: context.screenHeight * 0.3,
                          alignment: Alignment.center,
                          child: Assets.images.appLogo.image(
                            width: context.screenWidth * 0.5,
                          ),
                        ),
                        DefaultWhiteLabelTextWithIcon(text: l10n.login),
                        Gap.xxsmall(),
                        DefaultGraySubtitleText(
                          text: l10n
                              .enterYourAkashxUsernameAndPasswordToAccessYourAccount,
                        ),
                        Gap.large(),
                        DefaultLabelledTextField(
                          labelText: l10n.username,
                          hintText: l10n.enterYourUsernameHere,
                          fillColor: colorScheme.surface,
                          onChanged: (txt) => context
                              .read<LoginBloc>()
                              .add(UsernameChanged(txt)),
                        ),
                        Gap.small(),
                        DefaultLabelledTextField(
                          labelText: l10n.password,
                          hintText: l10n.enterYourPasswordHere,
                          isPassword: true,
                          fillColor: colorScheme.surface,
                          onChanged: (txt) => context
                              .read<LoginBloc>()
                              .add(PasswordChanged(txt)),
                        ),
                        Gap.medium(),
                        DefaultLabelledCheckbox(label: l10n.rememberMe),
                        Gap.mediumLarge(),
                        state.isLoading
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              )
                            : DefaultGradientButton(
                                text: l10n.login,
                                isExpanded: true,
                                isEnabled: true,
                                onPressed: () {
                                  // context.read<LoginBloc>().add(LoginUser());
                                  Navigator.pushReplacementNamed(context, ScreenDashboard().route);
                                  //TODO: implement remember password username logic
                                },
                              ),
                        Gap.large(),
                        Align(
                          alignment: Alignment.center,
                          child: DefaultActionTextButton(
                            text: l10n.notAMemberYet,
                            actionText: l10n.signUp,
                            onActionPressed: () {},
                          ),
                        ),
                        Gap.large(),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
