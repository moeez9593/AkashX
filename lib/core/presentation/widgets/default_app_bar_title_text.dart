import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBarTitleText extends StatelessWidget {
  const DefaultAppBarTitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Text(
      text,
      style: textTheme.labelLarge?.copyWith(
        fontSize: 16.sp,
        fontWeight: AppFontWeight.bold,
      ),
    );
  }
}
