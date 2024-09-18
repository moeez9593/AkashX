import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultWhiteLabelTextWithIcon extends StatelessWidget {
  const DefaultWhiteLabelTextWithIcon({
    super.key,
    required this.text,
    this.icon,
    this.padding,
    this.textStyle,
  });

  final String text;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, Gap.xsmall()],
          Text(
            text,
            style: textStyle ??
                textTheme.titleLarge?.copyWith(
                  fontSize: 22.sp,
                  fontWeight: AppFontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class DefaultWhiteLabelText extends StatelessWidget {
  const DefaultWhiteLabelText({
    super.key,
    required this.text,
    this.icon,
    this.padding,
    this.textStyle,
    this.textAlign,
  });

  final String text;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: textStyle ?? textTheme.titleLarge?.copyWith(fontSize: 13.sp),
        textAlign: textAlign,
      ),
    );
  }
}
