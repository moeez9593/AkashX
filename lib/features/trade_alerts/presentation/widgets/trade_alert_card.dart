import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_icon_filled_button.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeAlertsCard extends StatelessWidget {
  const TradeAlertsCard({
    super.key,
    required this.isActive,
    required this.isSellMarket,
    this.onOpenAlertPressed,
  });

  final bool isActive;
  final bool isSellMarket;
  final VoidCallback? onOpenAlertPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: colorScheme.tertiaryContainer),
            padding: const EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.small),
            child: Row(
              children: [
                Assets.images.tradeAlertsFlags.image(),
                Gap.medium(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EURUSD',
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: AppFontWeight.semibold,
                        ),
                      ),
                      Text(
                        isActive ? l10n.active : l10n.expired,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 12.sp,
                          fontWeight: AppFontWeight.medium,
                          color: isActive ? const Color(0xFF6FDC66) : const Color(0xFFFF7F7F),
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultIconFilledButton(
                  text: isSellMarket ? l10n.sellMarket : l10n.buyMarket,
                  color: (isSellMarket ? colorScheme.errorContainer : const Color(0xFF14FF00)).withOpacity(0.5),
                  icon: (isSellMarket ? Assets.svgs.iconArrowTrendDown : Assets.svgs.iconArrowTrendUp).svg(),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Divider(color: const Color(0xFF454544).withOpacity(0.8), height: 0, thickness: 1),
          Container(
            decoration: BoxDecoration(color: colorScheme.secondaryContainer),
            padding: const EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.small),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(radius: AppSizes.size32),
                    Gap.medium(),
                    Expanded(
                      child: Text(
                        'John Doe',
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: AppFontWeight.semibold,
                        ),
                      ),
                    ),
                    Gap.xxsmall(),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF1D1D1F),
                        borderRadius: AppTheme.defaultBoardRadius,
                      ),
                      padding: const EdgeInsets.all(Insets.small),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.entryPrice,
                                style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                              ),
                              Gap.xsmall(),
                              Text(
                                '1.11103',
                                style: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, fontWeight: AppFontWeight.semibold),
                              )
                            ],
                          ),
                          Gap.large(),
                          Assets.svgs.iconContentCopy.svg(),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap.small(),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: l10n.created_,
                        style: textTheme.labelLarge?.copyWith(
                          fontSize: 12,
                          color: colorScheme.onTertiary,
                        ),
                        children: [
                          TextSpan(
                            text: '1 hour ago',
                            style: textTheme.bodyLarge?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    DefaultIconGradientButton(
                      text: l10n.openAlert,
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: colorScheme.primary,
                      ),
                      colors: const [
                        Color(0xFFA78C00),
                        Color(0xFF5B4700),
                      ],
                      padding: EdgeInsets.zero,
                      contentPadding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.xsmall),
                      onPressed: onOpenAlertPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
