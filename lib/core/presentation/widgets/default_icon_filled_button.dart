import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultIconFilledButton extends StatelessWidget {
  const DefaultIconFilledButton({
    super.key,
    required this.text,
    required this.color,
    this.icon,
    this.onPressed,
    this.padding,
    this.contentPadding,
    this.textStyle,
  });

  final String text;
  final Color color;
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
            color: color,
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
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        textTheme.bodyLarge?.copyWith(
                          fontSize: 13.sp,
                          fontWeight: AppFontWeight.semibold,
                          color: context.colorScheme.onSurface,
                        ),
                  ),
                  if (icon != null) ...[
                    Gap.xxsmall(),
                    icon!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
