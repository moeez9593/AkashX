import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_dialog.dart';
import 'package:akashx/core/presentation/widgets/default_icon_filled_button.dart';
import 'package:akashx/features/trade_alerts/presentation/widgets/entry_price_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeAlertDetailsDialog extends StatelessWidget {
  const TradeAlertDetailsDialog({
    super.key,
    required this.isActive,
    required this.isSellMarket,
  });

  final bool isActive;
  final bool isSellMarket;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return DefaultDialog(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.medium),
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
                Gap.medium(),
                Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Assets.svgs.iconCircleXmarkGradient.svg(),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: const Color(0xFF454544).withOpacity(0.8), height: 0, thickness: 1),
          Container(
            padding: const EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.medium),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          ],
                        ),
                        Gap.small(),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF191A14)),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.small),
                                  decoration: BoxDecoration(
                                    color: colorScheme.surface.withOpacity(0.5),
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  child: Text(
                                    l10n.notes,
                                    style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.primary),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.small),
                                    decoration: BoxDecoration(
                                      color: colorScheme.surface.withOpacity(0.35),
                                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                                    ),
                                    child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                      style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap.small(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
                          child: RichText(
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
                        ),
                      ],
                    ),
                  ),
                  Gap.small(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        EntryPriceContainer(title: l10n.entryPrice, price: '1.11103'),
                        Gap.xsmall(),
                        EntryPriceContainer(title: l10n.stopLoss, price: '1.11103'),
                        Gap.xsmall(),
                        const EntryPriceContainer(
                          title: 'Take Profit 1',
                          price: '1.11103',
                          isSelected: true,
                        ),
                        Gap.xsmall(),
                        const EntryPriceContainer(title: 'Take Profit 2', price: '1.11103'),
                        Gap.xsmall(),
                        const EntryPriceContainer(title: 'Take Profit 3', price: '1.11103'),
                        Gap.xsmall(),
                        const EntryPriceContainer(title: 'Take Profit 4', price: '1.11103'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
