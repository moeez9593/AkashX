import 'package:akashx/app/themes/app_colors.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/app/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  const AppTheme._();

  /// Standard `ThemeData` for App UI.
  static final ThemeData _baseTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: _textTheme,
  );

  static final ThemeData lightTheme = _baseTheme.copyWith(
    colorScheme: AppColors.lightColorScheme,
    scaffoldBackgroundColor: AppColors.white,
    buttonTheme: const ButtonThemeData(alignedDropdown: true),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: defaultButtonShape,
        disabledBackgroundColor: AppColors.defaultDisabledButtonColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: defaultButtonShape,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightColorScheme.primary,
        shape: defaultButtonShape,
        side: defaultBorderSide,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightColorScheme.secondary,
      foregroundColor: AppColors.lightColorScheme.onSecondary,
      shape: const CircleBorder(),
    ),
    cardTheme: const CardTheme(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: defaultBoardRadius,
      ),
      elevation: 4,
    ),
    iconTheme: const IconThemeData(applyTextScaling: true),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.lightColorScheme.secondary,
    ),
    checkboxTheme: CheckboxThemeData(
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(color: AppColors.lightColorScheme.secondary),
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.lightColorScheme.secondary;
          }
          return null;
        },
      ),
    ),
  );

  static final ThemeData darkTheme = _baseTheme.copyWith(
    colorScheme: AppColors.darkColorScheme,
    scaffoldBackgroundColor: AppColors.darkColorScheme.surface,
    textTheme: _darkTextTheme,
    cardTheme: const CardTheme(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: defaultBoardRadius,
      ),
      elevation: 4,
    ),
    iconTheme: const IconThemeData(applyTextScaling: true),
    splashColor: AppColors.defaultSplashColor,
    splashFactory: InkSplash.splashFactory,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkColorScheme.surface.withOpacity(0.5),
    ),
  );

  static final TextTheme _textTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    displaySmall: AppTextStyles.displaySmall,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.darkColorScheme.onSurface),
    displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.darkColorScheme.onSurface),
    displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.darkColorScheme.onSurface),
    headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.darkColorScheme.onSurface),
    headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.darkColorScheme.onSurface),
    headlineSmall: AppTextStyles.headlineSmall.copyWith(color: AppColors.darkColorScheme.onSurface),
    titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.darkColorScheme.onSurface),
    titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.darkColorScheme.onSurface),
    titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.darkColorScheme.onSurface),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.darkColorScheme.onSurface),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkColorScheme.onSurface),
    bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.darkColorScheme.onSurface),
    labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.darkColorScheme.onSurface),
    labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.darkColorScheme.onSurface),
    labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.darkColorScheme.onSurface),
  );

  static const double defaultRadius = 12;
  static const double defaultNavBarHeight = 80;
  static final double defaultAppBarHeight = AppBar().preferredSize.height;
  static const BorderRadius defaultBoardRadius = BorderRadius.all(Radius.circular(defaultRadius));
  static const EdgeInsetsGeometry defaultHorizontalPadding = EdgeInsetsDirectional.symmetric(horizontal: Insets.large);
  static const List<BoxShadow> defaultBoxShadow = <BoxShadow>[
    BoxShadow(
      color: AppColors.defaultBoxShadow,
      offset: Offset(0, 5),
      blurRadius: 10,
    ),
  ];
  static const OutlinedBorder defaultButtonShape = RoundedRectangleBorder(borderRadius: defaultBoardRadius);
  static final BorderSide defaultBorderSide = BorderSide(color: AppColors.lightColorScheme.primary);
}
