import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/app/themes/app_text_styles.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/core/presentation/widgets/default_app_blurred_bg.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:akashx/features/home/presentation/widgets/educator_avatar.dart';
import 'package:akashx/features/home/presentation/widgets/educator_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducatorDetailsScreen extends StatelessWidget {
  const EducatorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(
          l10n.ourEducator,
          style: textTheme.labelLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
        ),
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
                      const Align(
                        alignment: Alignment.center,
                        child: EducatorAvatar(),
                      ),
                      Gap.large(),
                      DefaultWhiteLabelTextWithIcon(
                        text: 'Joel Arias',
                        textStyle: textTheme.bodyLarge?.copyWith(fontSize: 20.sp, fontWeight: AppFontWeight.semibold),
                      ),
                      Gap.large(),
                      Row(
                        children: [
                          Expanded(
                            child: EducatorInfoContainer(
                              infoTitle: l10n.specialities,
                              infoSubtitle: 'Forex',
                            ),
                          ),
                          Gap.medium(),
                          Expanded(
                            child: EducatorInfoContainer(
                              infoTitle: l10n.languages,
                              infoSubtitle: 'English, Espanol',
                            ),
                          ),
                        ],
                      ),
                      Gap.large(),
                      DefaultYellowLabelText(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,but also the leap into electronic typesetting, remaining essentially unchanged.',
                        textStyle: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, color: colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                      Gap.large(),
                      DefaultWhiteLabelText(
                        text:
                            'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        textStyle: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, color: colorScheme.onSurface),
                        textAlign: TextAlign.center,
                      ),
                      Gap.large(),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: Insets.large, right: Insets.large),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DefaultIconGradientButton(
                                text: l10n.sessionReplays,
                                icon: Assets.svgs.iconReplay.svg(),
                                colors: const [Color(0xFF3F432F), Color(0xFF6E7453)],
                                onPressed: () {},
                              ),
                            ),
                            Gap.medium(),
                            Expanded(
                              child: DefaultIconGradientButton(
                                text: l10n.liveSessions,
                                icon: Assets.svgs.iconCirclePlay.svg(
                                  height: 16,
                                  width: 16,
                                ),
                                colors: const [Color(0xFFA78C00), Color(0xFF5B4700)],
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Gap.large(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
