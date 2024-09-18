import 'package:akashx/app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrayYellowText extends StatelessWidget {
  const GrayYellowText({
    super.key,
    required this.grayText,
    required this.yellowText,
  });

  final String grayText;
  final String yellowText;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    final defaultTextStyle = textTheme.bodyLarge?.copyWith(fontSize: 13.sp);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: grayText,
        style: defaultTextStyle?.copyWith(color: colorScheme.onTertiary),
        children: [
          TextSpan(
            text: yellowText,
            style: defaultTextStyle?.copyWith(color: colorScheme.primary),
          )
        ],
      ),
    );
  }
}
