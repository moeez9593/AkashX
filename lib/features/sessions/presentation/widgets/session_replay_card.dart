import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionReplayCard extends StatelessWidget {
  const SessionReplayCard({
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
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorScheme.secondaryContainer, width: 2),
        borderRadius: AppTheme.defaultBoardRadius,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Assets.images.sessionReplayBackground.image(
              height: 200.h,
              width: 380.w,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(Insets.medium),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DefaultWhiteLabelTextWithIcon(
                          text: '1- Basics of Forex',
                          textStyle: textTheme.titleLarge?.copyWith(fontSize: 15.sp, fontWeight: AppFontWeight.semibold),
                        ),
                        Gap.xxsmall(),
                        DefaultYellowLabelTextWithIcon(
                          text: '11 AM, JAN 29, 2022 | IST',
                          icon: Assets.svgs.iconCalendar.svg(),
                          textStyle: textTheme.titleLarge?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: AppFontWeight.semibold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Assets.svgs.iconCirclePlay.svg(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
