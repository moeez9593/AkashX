import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../../../../app/themes/app_spacing.dart';

class DefaultFollowButton extends StatelessWidget {
  final bool isFollowing;
  final VoidCallback onClick;

  const DefaultFollowButton({
    super.key,
    required this.isFollowing,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isFollowing
                ? [
                    const Color(0xFF3F432F),
                    const Color(0xFF3F432F),
                    const Color(0x706E7453),
                  ]
                : [
                    const Color(0x70A78C00),
                    const Color(0xFF5B4700),
                    const Color(0xFF5B4700),
                  ],
          ),
          borderRadius: BorderRadius.circular(Insets.large),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.medium,
          vertical: Insets.xxsmall,
        ),
        child: InkWell(
          onTap: onClick,
          child: AbsorbPointer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isFollowing ? Icons.check : Icons.add,
                  size: 16,
                  color: context.colorScheme.primary,
                ),
                Gap.xxxsmall(),
                Text(
                  isFollowing ? context.l10n.following : context.l10n.follow,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
