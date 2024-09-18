import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC6C6C6),
            Color(0xFF606060),
          ],
        ),
        borderRadius: AppTheme.defaultBoardRadius,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: Insets.xsmall, vertical: Insets.xxsmall),
      child: Text(
        text,
        style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, fontWeight: AppFontWeight.medium),
      ),
    );
  }
}
