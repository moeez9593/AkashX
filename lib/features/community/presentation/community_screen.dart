import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar_title_text.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/features/community/discover/presentation/discover_tab.dart';
import 'package:akashx/features/community/following/presentation/following_tab.dart';
import 'package:akashx/features/community/for_you/presentation/for_you_tab.dart';
import 'package:akashx/features/community/presentation/widgets/community_tab_bar.dart';
import 'package:akashx/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/themes/app_spacing.dart';
import '../../../core/presentation/widgets/default_toolbar.dart';
import 'widgets/community_search_box_placeholder.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  CommunityTab _selectedTab = CommunityTab.forYou;
  final PageController _pageController = PageController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Stack(
        children: [
          Assets.svgs.homeBackground.svg(
            height: 0.4.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          const DefaultAppBlurredBg(),
          Column(
            children: [
              Gap.large(),
              Gap.xxsmall(),
              DefaultToolbar(
                leading: IconButton(
                  onPressed: () => dashboardStateKey.currentState?.openDrawer(),
                  icon: Assets.svgs.iconDrawer.svg(),
                ),
                title: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _isSearching
                      ? const CommunitySearchBoxPlaceholder()
                      : DefaultAppBarTitleText(text: l10n.community),
                ),
                actions: [
                  if (!_isSearching)
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: context.colorScheme.onSurface.withAlpha(50),
                            blurRadius: 70,
                            spreadRadius: 50)
                      ]),
                      child: IconButton(
                        onPressed: () {
                          _isSearching = !_isSearching;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.search_rounded,
                          size: 26,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                ],
              ),
              Gap.small(),
              CommunityTabBar(
                initialValue: _selectedTab,
                onTabChanged: (value) {
                  setState(() {
                    _selectedTab = value;
                  });
                  _pageController.jumpToPage(_selectedTab.index);
                },
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _selectedTab = CommunityTab.values[value];
                    });
                  },
                  children: const [
                    ForYouTab(),
                    FollowingTab(),
                    DiscoverTab(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
