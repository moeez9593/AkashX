import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar_title_text.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/features/dashboard/presentation/dashboard_screen.dart';
import 'package:akashx/features/tap_to_trade/presentation/widgets/dialogs/approve_trade_dialog.dart';
import 'package:akashx/features/tap_to_trade/presentation/widgets/tap_to_trade_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapToTradeScreen extends StatelessWidget {
  const TapToTradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        leading: IconButton(
          onPressed: () => dashboardStateKey.currentState?.openDrawer(),
          icon: Assets.svgs.iconDrawer.svg(),
        ),
        title: DefaultAppBarTitleText(text: l10n.tapToTrade),
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(Insets.mediumLarge),
            child: Column(
              children: [
                TapToTradeCard(
                  isActive: true,
                  isSellMarket: true,
                  onApproveTradePressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ApproveTradeDialog(
                          isActive: true,
                          isSellMarket: true,
                        );
                      },
                    );
                  },
                ),
                Gap.medium(),
                const TapToTradeCard(
                  isActive: false,
                  isSellMarket: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
