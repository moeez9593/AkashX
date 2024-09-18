import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/routes/screens.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar_title_text.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/dashboard/presentation/dashboard_screen.dart';
import 'package:akashx/features/sessions/presentation/widgets/dialogs/filter_session_dialog.dart';
import 'package:akashx/features/sessions/presentation/widgets/sessions_card.dart';
import 'package:akashx/features/sessions/presentation/widgets/upcoming_session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        leading: IconButton(
          onPressed: () => dashboardStateKey.currentState?.openDrawer(),
          icon: Assets.svgs.iconDrawer.svg(),
        ),
        title: const DefaultAppBarTitleText(text: 'Live Sessions (47)'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const FilterSessionsDialog();
                },
              );
            },
            icon: Assets.svgs.iconFilter.svg(),
          ),
        ],
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
            physics: const RangeMaintainingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  top: Insets.large,
                  left: Insets.small,
                  right: Insets.small,
                ),
                sliver: SliverToBoxAdapter(
                  child: UpcomingSessionCard(
                    onUpcommingSessionPressed: () {
                      Navigator.pushNamed(context, ScreenLiveSessions().route);
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap.medium(),
                    DefaultWhiteLabelText(
                      text: l10n.mondaySessions,
                      textStyle: textTheme.headlineLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
                      padding: AppTheme.defaultHorizontalPadding,
                    ),
                    Gap.medium(),
                    SizedBox(
                      height: 0.315.sh,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: AppTheme.defaultHorizontalPadding,
                        itemCount: 10,
                        separatorBuilder: (context, index) => Gap.medium(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 0.45.sw,
                            child: SessionCard(width: 0.45.sw),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap.medium(),
                    DefaultWhiteLabelText(
                      text: l10n.tuesdaySessions,
                      textStyle: textTheme.headlineLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
                      padding: AppTheme.defaultHorizontalPadding,
                    ),
                    Gap.medium(),
                    SizedBox(
                      height: 0.315.sh,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: AppTheme.defaultHorizontalPadding,
                        itemCount: 10,
                        separatorBuilder: (context, index) => Gap.medium(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 0.44.sw,
                            child: SessionCard(width: 0.44.sw),
                          );
                        },
                      ),
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
