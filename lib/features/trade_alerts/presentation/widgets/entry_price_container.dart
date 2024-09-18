import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntryPriceContainer extends StatelessWidget {
  const EntryPriceContainer({
    super.key,
    required this.title,
    required this.price,
    this.isSelected = false,
  });

  final String title;
  final String price;
  final bool isSelected;

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
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                ),
                Gap.xsmall(),
                Row(
                  children: [
                    Text(
                      price,
                      style: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, fontWeight: AppFontWeight.semibold),
                    ),
                    if (isSelected) ...[
                      Gap.xxsmall(),
                      Assets.svgs.iconCheckCircle.svg(),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Gap.large(),
          Assets.svgs.iconContentCopy.svg(),
        ],
      ),
    );
  }
}
