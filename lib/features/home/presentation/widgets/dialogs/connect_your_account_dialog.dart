import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_dialog.dart';
import 'package:akashx/core/presentation/widgets/default_dropdown.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_labelled_dropdown.dart';
import 'package:akashx/core/presentation/widgets/default_text_field.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/home/presentation/widgets/dialogs/risk_disclaimer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectYourAccountDialog extends StatelessWidget {
  const ConnectYourAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return DefaultDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultWhiteLabelTextWithIcon(
            text: l10n.connectYourAccount,
            textStyle: textTheme.titleLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
          ),
          Gap.medium(),
          DefaultGraySubtitleText(
            text: l10n
                .tapToTradeIsCompatibleWithMetatrader45AndTradelockerSimplyConnectYourAccountAndYouWillBeAbleToApproveTradeAlertsFromTheApp,
            textStyle: textTheme.titleLarge?.copyWith(fontSize: 13.sp, color: colorScheme.onTertiary),
            textAlign: TextAlign.center,
          ),
          Gap.large(),
          DefaultDropdown(
            hintText: l10n.selectTrade,
            items: ['Meta Trader 4', 'Meta Trader 5', 'Trade Locker']
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
          Gap.small(),
          DefaultTextField(hintText: l10n.accountNumber),
          Gap.small(),
          DefaultTextField(hintText: l10n.accountPassword),
          Gap.small(),
          DefaultTextField(hintText: l10n.passwordConfirm),
          Gap.small(),
          DefaultLabelledDropdown(
            labelText: l10n.brokerName,
            hintText: l10n.selectBroker,
            onChanged: (value) {},
          ),
          Gap.small(),
          DefaultLabelledDropdown(
            labelText: l10n.brokerServer,
            hintText: l10n.selectServer,
            onChanged: (value) {},
          ),
          Gap.large(),
          Row(
            children: [
              Expanded(
                child: DefaultIconGradientButton(
                  text: l10n.cancel,
                  colors: const [Color(0xFF3F432F), Color(0xFF6E7453)],
                ),
              ),
              Gap.medium(),
              Expanded(
                child: DefaultIconGradientButton(
                  text: l10n.connect,
                  icon: Assets.svgs.iconArrowRotate.svg(),
                  colors: const [Color(0xFFA78C00), Color(0xFF5B4700)],
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const RiskDisclaimerDialog();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
