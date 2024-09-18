import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveScheduleCard extends StatelessWidget {
  const LiveScheduleCard({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Material(
      color: colorScheme.secondaryContainer,
      clipBehavior: Clip.hardEdge,
      type: MaterialType.card,
      borderRadius: AppTheme.defaultBoardRadius,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Assets.images.thumbnail.image(
              height: 78.h,
              width: 125.w,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultWhiteLabelTextWithIcon(
                    text: 'Brent Badal',
                    padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                    textStyle: textTheme.titleLarge?.copyWith(fontSize: 15.sp, fontWeight: AppFontWeight.semibold),
                  ),
                  Gap.xxsmall(),
                  DefaultYellowLabelText(
                    text: 'Monday, 4 PM (EST)',
                    padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                    textStyle: textTheme.titleLarge?.copyWith(
                      fontSize: 13.sp,
                      fontWeight: AppFontWeight.semibold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Gap.small(),
            Assets.svgs.iconChevronRight.svg(),
            Gap.medium(),
          ],
        ),
      ),
    );
  }
}
