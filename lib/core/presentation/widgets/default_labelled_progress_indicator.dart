import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_progress_indicator.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultLabelledProgressIndicator extends StatelessWidget {
  const DefaultLabelledProgressIndicator({
    super.key,
    required this.labelText,
    required this.value,
    required this.total,
    this.padding,
  });

  final String labelText;
  final int value;
  final int total;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: DefaultGraySubtitleText(
                  text: labelText,
                  textStyle: textTheme.bodyMedium?.copyWith(fontSize: 13.sp, color: colorScheme.onTertiary),
                ),
              ),
              Gap.small(),
              DefaultYellowLabelText(
                text: '($value/$total)',
                textStyle: textTheme.bodyMedium?.copyWith(fontSize: 13.sp),
              ),
            ],
          ),
          Gap.xsmall(),
          DefaultProgressIndicator(value: value / total),
        ],
      ),
    );
  }
}
