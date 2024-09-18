import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/features/dashboard/presentation/widgets/acievement_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementsTab extends StatelessWidget {
  const AchievementsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.small(),
        Padding(
          padding: AppTheme.defaultHorizontalPadding,
          child: Text(
            l10n.achievements,
            style: textTheme.labelLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
          ),
        ),
        Gap.small(),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            padding: AppTheme.defaultHorizontalPadding,
            separatorBuilder: (_, __) => Gap.medium(),
            itemBuilder: (_, index) {
              return AchievementCard(
                isIncreased: index != 1,
              );
            },
          ),
        ),
      ],
    );
  }
}
