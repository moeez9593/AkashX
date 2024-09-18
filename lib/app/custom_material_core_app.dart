import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/app_localizations.dart';
import 'package:akashx/features/auth/presentation/login/presentation/login_screen.dart';
import 'package:akashx/features/dashboard/presentation/dashboard_screen.dart';
import 'package:akashx/features/dashboard/presentation/profile_screen.dart';
import 'package:akashx/features/home/presentation/educator_details_screen.dart';
import 'package:akashx/features/sessions/presentation/live_session_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/splash/presentation/splash_screen.dart';
import 'animations/animation_page_route.dart';
import 'routes/screens.dart';
import 'themes/app_themes.dart';

class CustomMaterialCoreApp extends GetMaterialApp {
  CustomMaterialCoreApp({super.key, required Locale super.locale})
      : super(
          onGenerateTitle: (context) => context.l10n.akashx,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          localeResolutionCallback: (locale, supportedLocales) {
            for (final supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            // if (Platform.isAndroid) {
            //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
            // }
            if (settings.name == ScreenSplash().route) {
              return AnimationPageRoute(
                child: const SplashScreen(),
                settings: settings,
              );
            }
            if (settings.name == ScreenLogin().route) {
              return AnimationPageRoute(
                child: const LoginScreen(),
                settings: settings,
              );
            }
            if (settings.name == ScreenDashboard().route) {
              return AnimationPageRoute(
                child: const DashboardScreen(),
                settings: settings,
              );
            }
            if (settings.name == ScreenEducatorDetails().route) {
              return AnimationPageRoute(
                child: const EducatorDetailsScreen(),
                settings: settings,
              );
            }
            if (settings.name == ScreenLiveSessions().route) {
              return AnimationPageRoute(
                child: const LiveSessionScreens(),
                settings: settings,
              );
            }
            if (settings.name == ScreenProfile().route) {
              return AnimationPageRoute(
                child: const ProfileScreen(),
                settings: settings,
              );
            }

            return null;
          },
          initialRoute: ScreenSplash().route,
        );
}
