import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar_title_text.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/features/dashboard/presentation/dashboard_screen.dart';
import 'package:akashx/features/trade_alerts/presentation/widgets/dialogs/filter_trade_alerts_dialog.dart';
import 'package:akashx/features/trade_alerts/presentation/widgets/dialogs/trade_alert_details_dialog.dart';
import 'package:akashx/features/trade_alerts/presentation/widgets/trade_alert_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeAlertsScreen extends StatelessWidget {
  const TradeAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        leading: IconButton(
          onPressed: () => dashboardStateKey.currentState?.openDrawer(),
          icon: Assets.svgs.iconDrawer.svg(),
        ),
        title: DefaultAppBarTitleText(text: l10n.tradeAlerts),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const FilterTradeAlertsDialog();
                },
              );
            },
            icon: Assets.svgs.iconFilter.svg(),
          ),
        ],
      ),
      body: Stack(
        children: [
          Assets.svgs.homeBackground.svg(
            height: 0.4.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          const DefaultAppBlurredBg(),
          // The actual form
          ListView.separated(
            itemCount: 3,
            padding: const EdgeInsets.symmetric(horizontal: Insets.large, vertical: Insets.large),
            itemBuilder: (context, index) {
              return TradeAlertsCard(
                isActive: false,
                isSellMarket: false,
                onOpenAlertPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const TradeAlertDetailsDialog(
                        isActive: true,
                        isSellMarket: true,
                      );
                    },
                  );
                },
              );
            },
            separatorBuilder: (_, __) => Gap.medium(),
          ),
        ],
      ),
    );
  }
}
