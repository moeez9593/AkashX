import 'dart:convert';

import 'package:crypto/crypto.dart' as cr;
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as fct;
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/generated/app_localizations.dart';
import '../../features/auth/domain/model/auth_error.dart';

class AppUtils {
  static void showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static String parseError(AuthError error, AppLocalizations? appLocalisations) {
    if (error == AuthError.network) {
      return appLocalisations?.networkError ?? "";
    } else if (error == AuthError.unknown) {
      return appLocalisations?.networkError ?? "";
    } else if (error == AuthError.server) {
      return appLocalisations?.networkError ?? "";
    } else if (error == AuthError.invalidUsername) {
      return appLocalisations?.invalidUsername ?? "";
    } else if (error == AuthError.invalidPassword) {
      return appLocalisations?.invalidPassword ?? "";
    } else if (error == AuthError.invalidCredentials) {
      return appLocalisations?.invalidCreds ?? "";
    } else {
      return "Unknown";
    }
  }

  static void launchWebURL(BuildContext context, String url) async {
    final theme = Theme.of(context);
    try {
      await fct.launchUrl(
        Uri.parse(url),
        customTabsOptions: fct.CustomTabsOptions(
          colorSchemes: fct.CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
          ),
          shareState: fct.CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: fct.CustomTabsCloseButton(
            icon: fct.CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: fct.SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          dismissButtonStyle: fct.SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // If the URL launch fails, an exception will be thrown. (For example, if no browser app is installed on the Android device.)
      debugPrint(e.toString());
    }
  }

  static bool isPasswordValid(String password) {
    // Check for at least one uppercase letter
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));

    // Check for at least one lowercase letter
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));

    // Check for at least one number OR at least one special character
    bool hasNumberOrSpecialChar = password.contains(RegExp(r'[0-9!@#$.]'));

    // Password is valid if it meets all the criteria
    return hasUpperCase && hasLowerCase && hasNumberOrSpecialChar;
  }

  static String sha256(String input) {
    var bytes = utf8.encode(input);
    var digest = cr.sha256.convert(bytes);

    // Convert the digest to a hexadecimal string
    return digest.toString();
  }

  static String getAuthorisation(String authToken) {
    return "Bearer $authToken";
  }

  static bool validateEmail(String email) => RegExp(
        r'^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        caseSensitive: false,
      ).hasMatch(email);
}
