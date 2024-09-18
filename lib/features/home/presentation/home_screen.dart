import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/routes/screens.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_labelled_progress_indicator.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/dashboard/presentation/dashboard_screen.dart';
import 'package:akashx/features/home/presentation/widgets/educator_list_tile.dart';
import 'package:akashx/features/home/presentation/widgets/tutorial_list_tile.dart';
import 'package:akashx/features/home/presentation/widgets/user_info_card.dart';
import 'package:akashx/features/home/presentation/widgets/user_website_link_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => dashboardStateKey.currentState?.openDrawer(),
              icon: Assets.svgs.iconDrawer.svg(),
            );
          },
        ),
        title: Assets.images.appLogo.image(
          height: 40.h,
          width: 162.w,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.svgs.iconBell.svg(),
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
          // The actual login form
          CustomScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(left: Insets.large, right: Insets.large, top: Insets.large),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const UserInfoCard(),
                      Gap.large(),
                      DefaultWhiteLabelTextWithIcon(
                        text: l10n.refer3YoursIsFree,
                        textStyle: textTheme.titleLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: AppFontWeight.semibold,
                        ),
                      ),
                      Gap.medium(),
                      DefaultLabelledProgressIndicator(labelText: l10n.personallyEnrolled, value: 2, total: 3),
                      Gap.medium(),
                      DefaultLabelledProgressIndicator(labelText: l10n.personallyEnrolledVolume, value: 223, total: 447),
                      Gap.medium(),
                      const UserWebsiteLinkShare(),
                      Divider(height: Insets.xlarge, thickness: 2.h),
                      DefaultWhiteLabelTextWithIcon(
                        text: l10n.gettingStarted,
                        icon: Assets.svgs.iconGraduationCap.svg(
                          colorFilter: ColorFilter.mode(
                            context.colorScheme.onSecondaryContainer,
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
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: Insets.medium, horizontal: Insets.large),
                sliver: SliverList.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const TutorialListTile();
                  },
                  separatorBuilder: (context, index) => Gap.small(),
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
                      text: l10n.ourEducators,
                      icon: Assets.svgs.iconPersonChalkboard.svg(
                        colorFilter: ColorFilter.mode(
                          context.colorScheme.onSecondaryContainer,
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return EducatorListTile(
                      onPressed: () {
                        Navigator.pushNamed(context, ScreenEducatorDetails().route);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Gap.small(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
