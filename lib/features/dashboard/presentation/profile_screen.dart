import 'package:akashx/app/constants/app_constants.dart';
import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar_title_text.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/core/presentation/widgets/default_gray_subtitle_text.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/dashboard/presentation/widgets/acievements_tab.dart';
import 'package:akashx/features/dashboard/presentation/widgets/posts_tab.dart';
import 'package:akashx/features/dashboard/presentation/widgets/profile_image.dart';
import 'package:akashx/features/dashboard/presentation/widgets/profile_info_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_icon/path_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;
    final isCurrentUser =
        (ModalRoute.of(context)?.settings.arguments as bool?) ?? true;

    return Scaffold(
      body: Stack(
        children: [
          Assets.svgs.loginBackground.svg(
            height: context.screenHeight,
            width: context.screenWidth,
            fit: BoxFit.cover,
          ),
          const DefaultAppBlurredBg(),
          DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: isCurrentUser
                        ? context.screenHeight * 0.46
                        : context.screenHeight * 0.4,
                    centerTitle: true,
                    pinned: true,
                    stretch: true,
                    title: DefaultAppBarTitleText(
                      text: isCurrentUser ? l10n.myProfile : l10n.profile,
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Column(
                        children: [
                          const Gap(kToolbarHeight + Insets.xxlarge),
                          const ProfileImage(),
                          Gap.medium(),
                          DefaultWhiteLabelText(
                            text: 'John Doe',
                            textStyle: textTheme.titleLarge?.copyWith(
                                fontSize: 16.sp,
                                fontWeight: AppFontWeight.semibold),
                          ),
                          Gap.xxsmall(),
                          DefaultGraySubtitleText(
                            text: '@johntrader19',
                            textStyle: textTheme.labelLarge?.copyWith(
                                fontSize: 13.sp, color: colorScheme.onTertiary),
                          ),
                          Gap.xsmall(),
                          DefaultWhiteLabelText(
                            text: 'Hi, I’m John Doe, an Expert Crypto Trader!',
                            textStyle:
                                textTheme.titleLarge?.copyWith(fontSize: 13.sp),
                          ),
                          Gap.large(),
                          Row(
                            children: [
                              Expanded(
                                child: ProfileInfoText(
                                  labelText: l10n.posts,
                                  value: '25',
                                ),
                              ),
                              Expanded(
                                child: ProfileInfoText(
                                  labelText: l10n.followers,
                                  value: '2,342',
                                ),
                              ),
                              Expanded(
                                child: ProfileInfoText(
                                  labelText: l10n.following,
                                  value: '15',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    bottom: !isCurrentUser
                        ? null
                        : TabBar(
                            tabs: [
                              Tab(icon: PathIcon(postsIconData)),
                              Tab(icon: PathIcon(acievementsIconData)),
                            ],
                            labelColor: colorScheme.onSurface,
                            unselectedLabelColor: colorScheme.onTertiary,
                            indicatorColor: colorScheme.onSurface,
                            indicatorSize: TabBarIndicatorSize.tab,
                            splashFactory: InkSplash.splashFactory,
                          ),
                  )
                ];
              },
              body: TabBarView(
                children: [
                  PostsTab(
                    isCurrentUser: isCurrentUser,
                  ),
                  const AchievementsTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
