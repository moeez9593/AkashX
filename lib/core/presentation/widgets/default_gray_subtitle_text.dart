import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultGraySubtitleText extends StatelessWidget {
  const DefaultGraySubtitleText({
    super.key,
    required this.text,
    this.padding,
    this.maxLines,
    this.textStyle,
    this.textAlign,
  });

  final String text;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
        textAlign: textAlign,
        style: textStyle ??
            textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: AppFontWeight.regular,
              color: colorScheme.onTertiary,
            ),
      ),
    );
  }
}
