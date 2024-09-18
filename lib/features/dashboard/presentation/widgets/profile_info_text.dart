import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoText extends StatelessWidget {
  const ProfileInfoText({
    super.key,
    required this.labelText,
    required this.value,
  });

  final String labelText;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Column(
      children: [
        Text(
          labelText,
          style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
        ),
        Gap.xxsmall(),
        Text(
          value,
          style: textTheme.labelLarge?.copyWith(fontSize: 16.sp, color: colorScheme.primary, fontWeight: AppFontWeight.semibold),
        )
      ],
    );
  }
}
