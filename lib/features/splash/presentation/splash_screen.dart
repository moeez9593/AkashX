import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/routes/screens.dart';
import 'package:akashx/di/akashx_di.dart';
import 'package:akashx/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: getIt<SplashBloc>()..add(LoadApp()),
      listener: (context, state) {
        if (state is LoadedApp) {
          Navigator.pushReplacementNamed(context, ScreenLogin().route);
        }
      },
      child: Scaffold(
        body: Center(
          child: FlutterLogo(
            size: context.screenWidth * 0.5,
          ),
        ),
      ),
    );
  }
}
