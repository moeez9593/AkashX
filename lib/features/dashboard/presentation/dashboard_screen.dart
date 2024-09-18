import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/routes/screens.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/core/presentation/widgets/glass_backdrop.dart';
import 'package:akashx/features/dashboard/presentation/widgets/bottom_nav_icon.dart';
import 'package:akashx/features/home/presentation/home_screen.dart';
import 'package:akashx/features/sessions/presentation/sessions_screen.dart';
import 'package:akashx/features/tap_to_trade/presentation/tap_to_trade_screen.dart';
import 'package:akashx/features/trade_alerts/presentation/trade_alerts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../community/inbox/presentation/chats_list/chats_list_screen.dart';

final GlobalKey<ScaffoldState> dashboardStateKey = GlobalKey<ScaffoldState>();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  _DashboardScreen currentScreen = _DashboardScreen.home;

  Widget get bottomNavScreen => [
        const HomeScreen(),
        const SessionsScreen(),
        const TradeAlertsScreen(),
        const TapToTradeScreen(),
        const ChatsListScreen(),
      ].elementAt(currentScreen.index);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    var defaultStyle = textTheme.labelLarge?.copyWith(fontSize: 15.sp);
    return Scaffold(
      key: dashboardStateKey,
      body: bottomNavScreen,
      drawer: GlassBackground(
        borderRadius: AppTheme.defaultBoardRadius,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 370.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF3F432F).withOpacity(0.5),
              borderRadius: AppTheme.defaultBoardRadius,
            ),
            child: CustomScrollView(
              physics: const RangeMaintainingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gap.xxxlarge(),
                      const CircleAvatar(
                        radius: 40,
                      ),
                      Gap.medium(),
                      DefaultWhiteLabelText(
                        text: 'John Doe',
                        textStyle: textTheme.titleLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
                      ),
                      Gap.xxsmall(),
                      DefaultGraySubtitleText(
                        text: '@johntrader19',
                        textStyle: textTheme.labelLarge?.copyWith(fontSize: 13.sp, color: colorScheme.onTertiary),
                      ),
                      Gap.large(),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = _DashboardScreen.home;
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconHome.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Home', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = _DashboardScreen.sessions;
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconSession.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Sessions', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = _DashboardScreen.tradeAlerts;
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconTradeAlerts.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Trade Alerts', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = _DashboardScreen.tapToTrade;
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconTapToTrade.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Tap to Trade', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, ScreenProfile().route);
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconPerson.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('My Profile', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = _DashboardScreen.community;
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconCommunity.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Community', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {},
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconGraduationCap.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Academy', style: defaultStyle),
                      ),
                      ListTile(
                        onTap: () {},
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconNewspaper.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Financial News', style: defaultStyle),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        onTap: () {},
                        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.xlarge),
                        leading: Assets.svgs.iconArrowRightFromBracket
                            .svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop)),
                        title: Text('Sign Out', style: defaultStyle),
                      ),
                      Gap.large(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: BottomNavIcon(child: Assets.svgs.iconHome.svg()),
            activeIcon:
                BottomNavIcon(child: Assets.svgs.iconHome.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop))),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: BottomNavIcon(child: Assets.svgs.iconSession.svg()),
            activeIcon:
                BottomNavIcon(child: Assets.svgs.iconSession.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop))),
            label: l10n.sessions,
          ),
          BottomNavigationBarItem(
            icon: BottomNavIcon(child: Assets.svgs.iconTradeAlerts.svg()),
            activeIcon: BottomNavIcon(
                child: Assets.svgs.iconTradeAlerts.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop))),
            label: l10n.tradeAlerts,
          ),
          BottomNavigationBarItem(
            icon: BottomNavIcon(child: Assets.svgs.iconTapToTrade.svg()),
            activeIcon:
                BottomNavIcon(child: Assets.svgs.iconTapToTrade.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop))),
            label: l10n.tapToTrade,
          ),
          BottomNavigationBarItem(
            icon: BottomNavIcon(child: Assets.svgs.iconCommunity.svg()),
            activeIcon:
                BottomNavIcon(child: Assets.svgs.iconCommunity.svg(colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcATop))),
            label: l10n.community,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface,
        selectedLabelStyle: textTheme.labelLarge?.copyWith(
          fontSize: 12.sp,
          wordSpacing: 0,
          decorationThickness: 0,
        ),
        unselectedLabelStyle: textTheme.labelLarge?.copyWith(
          fontSize: 12.sp,
          wordSpacing: 0,
          decorationThickness: 0,
        ),
        currentIndex: currentScreen.index,
        onTap: (value) {
          setState(() {
            currentScreen = _DashboardScreen.values[value];
          });
        },
      ),
    );
  }
}

enum _DashboardScreen {
  home,
  sessions,
  tradeAlerts,
  tapToTrade,
  community,
}
