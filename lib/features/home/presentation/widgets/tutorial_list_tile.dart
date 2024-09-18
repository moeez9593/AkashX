import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TutorialListTile extends StatelessWidget {
  const TutorialListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Card(
      color: colorScheme.secondaryContainer,
      child: Row(
        children: [
          Container(
            height: 122.h,
            width: 172.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.thumbnail.provider(),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(colorScheme.surface.withOpacity(0.5), BlendMode.srcOver),
              ),
            ),
            child: Center(child: Assets.svgs.iconCirclePlay.svg()),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultWhiteLabelTextWithIcon(
                  text: 'Tuturoial#1',
                  padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                  textStyle: textTheme.titleLarge?.copyWith(fontSize: 15.sp, fontWeight: AppFontWeight.semibold),
                ),
                Gap.small(),
                DefaultGraySubtitleText(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry\'s stand',
                  maxLines: 3,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                  textStyle: textTheme.titleLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onSecondaryContainer),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
