import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/features/dashboard/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsTab extends StatelessWidget {
  final bool isCurrentUser;

  const PostsTab({
    super.key,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isCurrentUser) Gap.small(),
        if (isCurrentUser)
          Padding(
            padding: AppTheme.defaultHorizontalPadding,
            child: Text(
              l10n.posts,
              style: textTheme.labelLarge?.copyWith(
                  fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
            ),
          ),
        Gap.small(),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            padding: AppTheme.defaultHorizontalPadding,
            separatorBuilder: (_, __) => Gap.medium(),
            itemBuilder: (_, index) {
              return const PostCard();
            },
          ),
        ),
      ],
    );
  }
}
