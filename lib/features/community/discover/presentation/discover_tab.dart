import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/routes/screens.dart';
import 'package:akashx/app/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../app/themes/app_spacing.dart';
import 'components/discover_user_list_item.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.mediumLarge(),
          Text(
            context.l10n.recommendedForYou,
            style: textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: AppFontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, pos) => DiscoverUserListItem(
                isVerified: pos % 2 == 0,
                onClick: () {
                  Navigator.of(context).pushNamed(
                    ScreenProfile().route,
                    arguments: false,
                  );
                },
              ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
