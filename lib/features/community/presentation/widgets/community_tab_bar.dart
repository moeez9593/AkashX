import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityTabBar extends StatelessWidget {
  const CommunityTabBar({
    super.key,
    this.initialValue = CommunityTab.forYou,
    this.onTabChanged,
  });

  final CommunityTab initialValue;
  final ValueChanged<CommunityTab>? onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
      child: Row(
        children: [
          Expanded(
            child: TabCommunity(
              tab: CommunityTab.forYou,
              isSelected: initialValue == CommunityTab.forYou,
              onPressed: (tab) => onTabChanged?.call(tab),
            ),
          ),
          Gap.small(),
          Expanded(
            child: TabCommunity(
              tab: CommunityTab.following,
              isSelected: initialValue == CommunityTab.following,
              onPressed: (tab) => onTabChanged?.call(tab),
            ),
          ),
          Gap.small(),
          Expanded(
            child: TabCommunity(
              tab: CommunityTab.discover,
              isSelected: initialValue == CommunityTab.discover,
              onPressed: (tab) => onTabChanged?.call(tab),
            ),
          ),
        ],
      ),
    );
  }
}

class TabCommunity extends StatelessWidget {
  const TabCommunity({
    required this.tab,
    required this.isSelected,
    this.onPressed,
    super.key,
  });

  final CommunityTab tab;
  final bool isSelected;
  final void Function(CommunityTab tab)? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Material(
      type: MaterialType.transparency,
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      clipBehavior: Clip.hardEdge,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isSelected
                ? [
                    const Color(0xFFA78C00),
                    const Color(0xFF5B4700),
                  ]
                : [
              const Color(0xFF3F432F),
              const Color(0xFF3F432F),
              const Color(0x706E7453),
            ],
          ),
        ),
        child: InkWell(
          onTap: () => onPressed?.call(tab),
          child: AbsorbPointer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.small, vertical: 7),
              child: Text(
                tab.value(context),
                style: textTheme.labelLarge?.copyWith(fontSize: 15.sp, fontWeight: AppFontWeight.semibold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CommunityTab {
  forYou,
  following,
  discover,
}

extension _CommunityTabExt on CommunityTab {
  String value(BuildContext context) => switch (this) {
        CommunityTab.forYou => context.l10n.forYou,
        CommunityTab.following => context.l10n.following,
        CommunityTab.discover => context.l10n.discover,
      };
}
