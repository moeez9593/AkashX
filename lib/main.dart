import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/custom_material_core_app.dart';
import 'core/blocs/language/language_bloc.dart';
import 'di/akashx_di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   systemNavigationBarDividerColor: Colors.transparent,
  // ));
  configureDependencies();
  runApp(
    ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const AppHome();
      },
    ),
  );
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageBloc>()..add(GetLanguage()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return state is LanguageUpdate
              ? CustomMaterialCoreApp(
                  locale: state.locale,
                  key: UniqueKey(),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
