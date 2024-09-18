import 'package:akashx/app/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  void hideKeyboard() {
    if (mediaQueryViewInsets.bottom > 0) SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  void removeFocus() {
    FocusScope.of(this).unfocus();
  }
}
