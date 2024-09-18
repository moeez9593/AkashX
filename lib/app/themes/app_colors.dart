import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class AppColors {
  const AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  /// Default colors for shimmer
  static const Color lightShimmerHighlight = Color(0xffE6E8EB);
  static const Color darkShimmerHighlight = Color(0xff2A2C2E);
  static const Color lightShimmerBase = Color(0xffF9F9FB);
  static const Color darkShimmerBase = Color(0xff3A3E3F);

  /// Text url default color
  static const Color defaultTextUrl = Colors.lightBlue;
  static const Color defaultBoxShadow = Color(0x2F000000);

  // Button default color
  static const Color defaultDisabledButtonColor = Color(0xFF939393);

  static final Color defaultSplashColor = const Color(0xFFEDD27C).withOpacity(0.4);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFEDD27C),
    onPrimary: AppColors.white,
    primaryContainer: Color(0xFFD1E4FF),
    onPrimaryContainer: Color(0xFF001D36),
    secondary: Color(0xFF172C6E),
    onSecondary: AppColors.white,
    secondaryContainer: Color(0xFFFFFFFF),
    onSecondaryContainer: Color(0xFF101C2B),
    tertiary: Color(0xFF939393),
    onTertiary: Color(0xFFA7A7A7),
    tertiaryContainer: Color(0xFFF2DAFF),
    onTertiaryContainer: Color(0xFF251431),
    error: Color(0xFFFE4C4C),
    onError: AppColors.white,
    errorContainer: Color(0xFFFFE500),
    onErrorContainer: AppColors.black,
    surface: AppColors.white,
    onSurface: AppColors.white,
    surfaceContainerHighest: Color(0xFFD9D9D9),
    onSurfaceVariant: Color(0xFFD9D9D9),
    surfaceContainer: Color(0xFFEFEFEF),
    outline: Color(0xFFDCDCDC),
    outlineVariant: Color(0xFFC3C7CF),
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.black,
    onInverseSurface: AppColors.white,
    inversePrimary: Color(0xFF9ECAFF),
    surfaceTint: Color(0xFF0061A4),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFEDD27C),
    secondaryContainer: Color(0xFF232320),
    onSecondaryContainer: Color(0xFFB4B4B4),
    onTertiary: Color(0xFFA7A7A7),
    tertiaryContainer: Color(0xFF1D1D1F),
    surface: AppColors.black,
    onPrimary: Color(0xFF003258),
    primaryContainer: Color(0xFF00497D),
    onPrimaryContainer: Color(0xFFD1E4FF),
    secondary: Color(0xFFBBC7DB),
    onSecondary: Color(0xFF253140),
    tertiary: Color(0xFFD6BEE4),
    onTertiaryContainer: Color(0xFFF2DAFF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFFFF0000),
    onErrorContainer: Color(0xFFFFDAD6),
    onSurface: Color(0xFFE2E2E6),
    surfaceContainerHighest: Color(0xFF43474E),
    onSurfaceVariant: Color(0xFFC3C7CF),
    outline: Color(0xFF8D9199),
    outlineVariant: Color(0xFF43474E),
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: Color(0xFFE2E2E6),
    onInverseSurface: Color(0xFF1A1C1E),
    inversePrimary: Color(0xFF0061A4),
    surfaceTint: Color(0xFF9ECAFF),
  );
}

enum GradientButtonType {
  notConnected,
  failed,
  connecting,
  connected,
}

typedef GradientValue = ({List<Color> colors, SvgPicture icon, String name});

extension GradientButtonTypeExt on GradientButtonType {
  GradientValue value(BuildContext context) => switch (this) {
        GradientButtonType.notConnected => (
            colors: [const Color(0xFFA75A00), const Color(0xFF5B2600)],
            icon: Assets.svgs.iconCircleXmark.svg(),
            name: context.l10n.notConnected,
          ),
        GradientButtonType.failed => (
            colors: [const Color(0xFFA70000), const Color(0xFF5B0000)],
            icon: Assets.svgs.iconCircleExclamation.svg(),
            name: context.l10n.failed,
          ),
        GradientButtonType.connecting => (
            colors: [const Color(0xFFA78C00), const Color(0xFF5B4700)],
            icon: Assets.svgs.iconSpinner.svg(),
            name: context.l10n.connecting,
          ),
        GradientButtonType.connected => (
            colors: [const Color(0xFF0DA700), const Color(0xFF075B00)],
            icon: Assets.svgs.iconStarChecked.svg(),
            name: context.l10n.connected,
          ),
      };
}
