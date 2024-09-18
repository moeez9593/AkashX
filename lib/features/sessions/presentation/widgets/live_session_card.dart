import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveSessionCard extends StatelessWidget {
  const LiveSessionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;
    return Stack(
      children: [
        SizedBox(
          height: 250.h,
          width: 382.w,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: colorScheme.secondaryContainer, width: 2),
              borderRadius: AppTheme.defaultBoardRadius,
            ),
            margin: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            child: Assets.images.liveSessionCardBackground.image(fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: Insets.small,
          right: Insets.small,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  shape: BoxShape.circle,
                ),
              ),
              Gap.xxsmall(),
              Text(
                l10n.live,
                style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, fontWeight: AppFontWeight.medium),
              )
            ],
          ),
        ),
      ],
    );
  }
}
