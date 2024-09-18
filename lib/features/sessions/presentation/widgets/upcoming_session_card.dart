import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/packages/flip_board/app_flip_board_clock.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingSessionCard extends StatelessWidget {
  const UpcomingSessionCard({
    super.key,
    this.onUpcommingSessionPressed,
  });

  final VoidCallback? onUpcommingSessionPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return GestureDetector(
      onTap: onUpcommingSessionPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Stack(
              children: [
                Container(
                  height: 164.h,
                  width: 382.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Assets.images.upcomingSessionBackgroundPlaceholder.provider(),
                      fit: BoxFit.cover,
                    ),
                    color: colorScheme.onTertiary,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: Insets.xxxsmall,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultYellowLabelText(
                        text: l10n.startsIn,
                        textStyle: textTheme.labelLarge?.copyWith(fontSize: 10.sp, color: colorScheme.primary),
                      ),
                      Gap.xsmall(),
                      AppFlipCountdownClock(
                        duration: const Duration(hours: 16),
                        digitSize: 14,
                        width: 20,
                        height: 32,
                        digitColor: colorScheme.onSurface,
                        backgroundColor: colorScheme.surface,
                        separatorColor: colorScheme.onSurface,
                        borderColor: colorScheme.onSurface.withOpacity(0.3),
                        hingeColor: colorScheme.surface.withOpacity(0.3),
                        digitSpacing: EdgeInsets.zero,
                        borderRadius: const BorderRadius.all(Radius.circular(0)),
                        onDone: () {},
                      ),
                      Gap.xsmall(),
                      DefaultIconGradientButton(
                        text: l10n.watch,
                        textStyle: textTheme.bodyLarge?.copyWith(fontSize: 15.sp, color: const Color(0xFF5C4200)),
                        icon: Assets.svgs.iconWatch.svg(),
                        colors: const [Color(0xFFFFF5D0), Color(0xFFDCAB00)],
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.small, vertical: Insets.xxsmall),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
