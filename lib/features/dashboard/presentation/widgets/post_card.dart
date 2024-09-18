import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      color: colorScheme.secondaryContainer,
      shape: const RoundedRectangleBorder(borderRadius: AppTheme.defaultBoardRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.postBackround.image(
            height: 198.h,
            width: 382.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(Insets.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  style: textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
                ),
                Gap.large(),
                Text(
                  '06/07/2024 10:34 AM',
                  style: textTheme.bodyLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
