import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntryPriceTapToTradeContainer extends StatelessWidget {
  const EntryPriceTapToTradeContainer({
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
      width: double.infinity,
      padding: const EdgeInsets.all(Insets.small),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
          ),
          Gap.xsmall(),
          Text(
            price,
            style: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, fontWeight: AppFontWeight.semibold),
          ),
        ],
      ),
    );
  }
}
