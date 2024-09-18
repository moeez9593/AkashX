import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_dialog.dart';
import 'package:akashx/core/presentation/widgets/default_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_icon_filled_button.dart';
import 'package:akashx/core/presentation/widgets/default_labelled_text_field.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/tap_to_trade/presentation/widgets/default_count_down_timer.dart';
import 'package:akashx/features/tap_to_trade/presentation/widgets/entry_price_tap_to_trade_container.dart';
import 'package:akashx/features/tap_to_trade/presentation/widgets/gray_yellow_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApproveTradeDialog extends StatelessWidget {
  const ApproveTradeDialog({
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
            padding: const EdgeInsets.symmetric(vertical: Insets.medium, horizontal: Insets.medium),
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
            padding: const EdgeInsets.symmetric(vertical: Insets.medium, horizontal: Insets.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                            Gap.medium(),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF1D1D1F),
                                borderRadius: AppTheme.defaultBoardRadius,
                              ),
                              width: 0.6.sw,
                              padding: const EdgeInsets.all(Insets.small),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      l10n.expiration,
                                      style: textTheme.labelLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                                    ),
                                  ),
                                  Gap.xsmall(),
                                  DefaultCountDownTimer(
                                    duration: isActive ? const Duration(minutes: 1, seconds: 23) : Duration.zero,
                                  ),
                                ],
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
                            EntryPriceTapToTradeContainer(title: l10n.entryPrice, price: '1.11103'),
                            Gap.xsmall(),
                            EntryPriceTapToTradeContainer(title: l10n.stopLoss, price: '1.11103'),
                            Gap.xsmall(),
                            EntryPriceTapToTradeContainer(title: l10n.entryPrice, price: '1.11103'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap.medium(),
                Row(
                  children: [
                    Expanded(
                      child: GrayYellowText(
                        grayText: l10n.livePrice_,
                        yellowText: '1.11325',
                      ),
                    ),
                    Gap.xxxsmall(),
                    Expanded(
                      child: GrayYellowText(
                        grayText: l10n.pips_,
                        yellowText: '103',
                      ),
                    ),
                    Gap.xxxsmall(),
                    Expanded(
                      child: GrayYellowText(
                        grayText: l10n.created,
                        yellowText: '1 hour ago',
                      ),
                    ),
                  ],
                ),
                Gap.large(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Insets.small, vertical: Insets.medium),
                  decoration: const BoxDecoration(
                    borderRadius: AppTheme.defaultBoardRadius,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF3F432F),
                        Color(0xFF6E7453),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: l10n.accountBalance_,
                      style: textTheme.labelLarge?.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xFF6FDC66),
                      ),
                      children: [
                        TextSpan(
                          text: '\$106,250.00',
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.semibold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap.large(),
                const DefaultLabelledTextField(
                  labelText: 'Lot Size',
                  hintText: 'Lot Size',
                ),
                Gap.small(),
                const DefaultLabelledTextField(
                  labelText: 'Risk%',
                  hintText: 'Risk%',
                ),
                Gap.mediumLarge(),
                DefaultGradientButton(
                  text: l10n.approveTrade,
                  isExpanded: true,
                  onPressed: () {},
                ),
                Gap.medium(),
                DefaultWhiteLabelText(
                  text: 'Disclaimer',
                  textStyle: textTheme.bodyLarge?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
                Gap.xxsmall(),
                DefaultGraySubtitleText(
                  text:
                      'All content and information provided on this website are for educational and informational purposes only, specifically relating to trading in financial markets. They should not be construed as specific investment recommendations, endorsements, or solicitations to buy or sell securities or any other investment instruments. It’s emphasized that trading in financial markets carries inherent risks, and potential traders are advised not to invest more than they can afford to lose. Trading Futures, Options on Futures and FOREX involves substantial risk of loss and is not suitable for all investors. Opinions, market data, and recommendations are subject to change without notice. Past performance is not indicative of future results.',
                  textStyle: textTheme.bodyLarge?.copyWith(fontSize: 12.sp, color: colorScheme.onTertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
