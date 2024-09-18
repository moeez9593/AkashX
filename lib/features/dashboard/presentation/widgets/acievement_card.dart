import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    this.isIncreased = true,
  });

  final bool isIncreased;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: AppTheme.defaultBoardRadius),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF3F432F),
              Color(0xFF6E7453),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.medium),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.15, 0.85],
                  colors: [
                    Color(0xFF3F432F),
                    Color(0xFF6E7453),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(Insets.small),
              child: Assets.images.iconTradesWon.image(height: 36.sp, width: 36.sp),
            ),
            Gap.small(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Trade Won',
                    style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                  ),
                  Gap.xxsmall(),
                  Text(
                    '25',
                    style: textTheme.labelLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
                  ),
                ],
              ),
            ),
            Gap.small(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isIncreased
                    ? const Icon(
                        Icons.arrow_upward,
                        color: Color(0xFF6FDC66),
                      )
                    : const Icon(
                        Icons.arrow_downward,
                        color: Color(0xFFFF7F7F),
                      ),
                Text(
                  '30%',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: AppFontWeight.semibold,
                    color: isIncreased ? const Color(0xFF6FDC66) : const Color(0xFFFF7F7F),
                  ),
                ),
              ],
            ),
            Gap.medium(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Increase',
                  style: textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
                ),
                RichText(
                  text: TextSpan(
                    text: 'vs ',
                    style: textTheme.bodyLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                    children: [
                      TextSpan(
                        text: 'last week',
                        style: textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
