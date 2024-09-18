import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultIconGradientButton extends StatelessWidget {
  const DefaultIconGradientButton({
    super.key,
    required this.text,
    this.icon,
    required this.colors,
    this.onPressed,
    this.padding,
    this.contentPadding,
    this.textStyle,
  });

  final String text;
  final List<Color> colors;
  final Widget? icon;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

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
            customBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.size40))),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: Insets.small, vertical: Insets.xsmall),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    Gap.xsmall(),
                  ],
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle ?? textTheme.bodyLarge?.copyWith(fontSize: 13.sp, color: context.colorScheme.onSurface),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
