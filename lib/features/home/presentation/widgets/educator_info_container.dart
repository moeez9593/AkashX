import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducatorInfoContainer extends StatelessWidget {
  const EducatorInfoContainer({
    super.key,
    required this.infoTitle,
    required this.infoSubtitle,
  });

  final String infoTitle;
  final String infoSubtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1D1D1F),
        borderRadius: AppTheme.defaultBoardRadius,
      ),
      padding: const EdgeInsets.all(Insets.small),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            infoTitle,
            style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
          ),
          Gap.xxsmall(),
          Text(
            infoSubtitle,
            style: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, fontWeight: AppFontWeight.semibold),
          )
        ],
      ),
    );
  }
}
