import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWebsiteLinkShare extends StatelessWidget {
  const UserWebsiteLinkShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultGraySubtitleText(
                text: l10n.yourWebsiteLink,
                textStyle: textTheme.bodyMedium?.copyWith(fontSize: 15.sp, color: colorScheme.onTertiary),
              ),
              Gap.xxsmall(),
              DefaultWhiteLabelTextWithIcon(
                text: 'https://www.akashx.com/johndoe28',
                textStyle: textTheme.labelLarge?.copyWith(fontSize: 15.sp),
              ),
            ],
          ),
        ),
        Gap.xxxsmall(),
        DefaultIconGradientButton(
          text: l10n.share,
          icon: Assets.svgs.iconShare.svg(),
          colors: const [
            Color(0xFF3F432F),
            Color(0xFF6E7453),
          ],
          contentPadding: const EdgeInsets.symmetric(horizontal: Insets.large, vertical: Insets.xsmall),
          onPressed: () {},
        ),
      ],
    );
  }
}
