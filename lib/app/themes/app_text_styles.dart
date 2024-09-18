import 'package:akashx/app/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

final class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle _baseTextStyle = TextStyle(
    fontWeight: AppFontWeight.regular,
    fontFamily: FontFamily.sFPro,
  );

  /// Display Large Text Style
  static final TextStyle displayLarge = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: AppFontWeight.regular,
  );

  /// Display Medium Text Style
  static final TextStyle displayMedium = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: AppFontWeight.regular,
  );

  /// Display Small Text Style
  static final TextStyle displaySmall = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline Large Text Style
  static final TextStyle headlineLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline Medium Text Style
  static final TextStyle headlineMedium = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.regular,
  );

  /// Headline Small Text Style
  static final TextStyle headlineSmall = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.regular,
  );

  /// Title Large Text Style
  static final TextStyle titleLarge = _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: AppFontWeight.regular,
  );

  /// Title Medium Text Style
  static final TextStyle titleMedium = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.medium,
  );

  /// Title Small Text Style
  static final TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
  );

  /// Label Large Text Style
  static final TextStyle labelLarge = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
  );

  /// Label Medium Text Style
  static final TextStyle labelMedium = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: AppFontWeight.medium,
  );

  /// Label Small Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: AppFontWeight.medium,
  );

  /// Body Large Text Style
  static final TextStyle bodyLarge = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.regular,
  );

  /// Body Medium Text Style
  static final TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
  );

  /// Body Small Text Style
  static final TextStyle bodySmall = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: AppFontWeight.regular,
  );
}

class AppFontWeight {
  const AppFontWeight._();

  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight heavy = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semibold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight ultralight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}
