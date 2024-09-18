import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultGradientButton extends StatelessWidget {
  const DefaultGradientButton({
    super.key,
    required this.text,
    this.textStyle,
    this.contentPadding,
    this.padding,
    this.textColor,
    this.onPressed,
    this.isExpanded = false,
    this.isEnabled = true,
  });

  final String text;
  final bool isEnabled;
  final bool isExpanded;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    final textStyle = textTheme.bodyLarge?.copyWith(
      fontSize: 14.sp,
      color: isEnabled ? colorScheme.onSurface : colorScheme.onTertiary,
    );

    final colors = isEnabled ? [const Color(0x90A78C00), const Color(0x905B4700)] : [const Color(0x503F432F), const Color(0x506E7453)];

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSizes.size40)),
          ),
          child: InkWell(
            onTap: onPressed,
            splashColor: AppColors.defaultSplashColor,
            customBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.size40))),
            child: Container(
              width: isExpanded ? double.infinity : null,
              padding: contentPadding ?? const EdgeInsets.all(Insets.small),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
