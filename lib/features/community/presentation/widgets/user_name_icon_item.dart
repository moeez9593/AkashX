import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/generated/assets.gen.dart';
import '../../../../app/themes/app_spacing.dart';
import '../../../../app/themes/app_text_styles.dart';

class UserNameIconItem extends StatelessWidget {
  final String name;
  final String image;
  final bool isVerified;

  const UserNameIconItem({
    super.key,
    required this.name,
    required this.image,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 16,
        ),
        Gap.small(),
        Text(
          name,
          style: textTheme.labelLarge?.copyWith(
            fontSize: 18.sp,
            fontWeight: AppFontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
          textAlign: TextAlign.start,
        ),
        if (isVerified)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap.xsmall(),
              Assets.svgs.verifiedIcon.svg(
                height: 16,
                width: 16,
              ),
            ],
          )
      ],
    );
  }
}
