import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:akashx/features/sessions/presentation/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.images.thumbnail.image(
            height: 100.h,
            width: width,
            fit: BoxFit.cover,
          ),
          Gap.xsmall(),
          DefaultWhiteLabelText(
            text: 'Brent Badal',
            textStyle: textTheme.bodyLarge?.copyWith(fontSize: 15.sp, fontWeight: AppFontWeight.semibold),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
          ),
          Gap.xxxsmall(),
          DefaultYellowLabelText(
            text: 'Crypto',
            textStyle: textTheme.bodyLarge?.copyWith(
              fontSize: 13.sp,
              fontWeight: AppFontWeight.semibold,
              color: colorScheme.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
          ),
          Gap.small(),
          DefaultGraySubtitleText(
            text: 'Lorem Ipsum is simply dummy text of the printing and type setting industr',
            textStyle: textTheme.bodyLarge?.copyWith(fontSize: 12.sp, color: const Color(0xFFB4B4B4)),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            maxLines: 3,
          ),
          Gap.small(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            child: Row(
              children: [
                const Expanded(child: FilterWidget(text: '06:00 AM')),
                Gap.xsmall(),
                const Expanded(child: FilterWidget(text: 'English')),
              ],
            ),
          ),
          Gap.small(),
          Expanded(
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFA78C00),
                    Color(0xFF5B4700),
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.svgs.iconCirclePlay.svg(height: 16, width: 16),
                    Gap.xxsmall(),
                    Text(
                      'Watch',
                      style: textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
