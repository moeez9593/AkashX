import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar_title_text.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/sessions/presentation/widgets/live_schedule_card.dart';
import 'package:akashx/features/sessions/presentation/widgets/live_session_card.dart';
import 'package:akashx/features/sessions/presentation/widgets/session_replay_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveSessionScreens extends StatelessWidget {
  const LiveSessionScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        title: DefaultAppBarTitleText(text: l10n.liveSessions),
      ),
      body: Stack(
        children: [
          Assets.svgs.sessionsBackground.svg(
            height: 0.4.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          const DefaultAppBlurredBg(),
          // The actual login form
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const LiveSessionCard(),
                    Gap.medium(),
                    DefaultWhiteLabelTextWithIcon(
                      text: l10n.liveSchedule,
                      icon: Assets.svgs.iconWatch.svg(
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                      textStyle: textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: Insets.medium, horizontal: Insets.large),
                sliver: SliverList.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const LiveScheduleCard();
                  },
                  separatorBuilder: (_, __) => Gap.small(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    DefaultIconGradientButton(
                      text: l10n.showMore,
                      icon: Assets.svgs.iconPlus.svg(),
                      colors: const [
                        Color(0xFF3F432F),
                        Color(0xFF6E7453),
                      ],
                      padding: AppTheme.defaultHorizontalPadding,
                      onPressed: () {},
                    ),
                    Gap.medium(),
                    DefaultWhiteLabelTextWithIcon(
                      text: l10n.sessionReplay,
                      icon: Assets.svgs.iconReplay.svg(
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                      textStyle: textTheme.titleLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                    // Gap.medium(),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: Insets.medium, horizontal: Insets.large),
                sliver: SliverList.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const SessionReplayCard();
                  },
                  separatorBuilder: (_, __) => Gap.medium(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultIconGradientButton(
                      text: l10n.showMore,
                      icon: Assets.svgs.iconPlus.svg(),
                      colors: const [
                        Color(0xFF3F432F),
                        Color(0xFF6E7453),
                      ],
                      padding: AppTheme.defaultHorizontalPadding,
                      onPressed: () {},
                    ),
                    Gap.large(),
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
