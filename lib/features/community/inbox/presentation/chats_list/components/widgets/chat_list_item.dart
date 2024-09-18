import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/app/themes/app_text_styles.dart';
import 'package:akashx/core/presentation/widgets/default_counter_box.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final String count;
  final VoidCallback onTap;

  const ChatListItem({super.key, required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.medium,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: Insets.small),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.25,
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
            color: context.colorScheme.surface.withAlpha(90),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 23,
              ),
              Gap.small(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Akashx",
                      style: textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurface,
                        fontWeight: AppFontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap.xxsmall(),
                    Text(
                      "Hello from akashx",
                      style: textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSecondaryContainer,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Gap.medium(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (int.parse(count) > 0)
                    DefaultCounterBox(count: count)
                  else
                    const SizedBox(height: 21),
                  Gap.xxsmall(),
                  Text(
                    "02:00",
                    style: textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  )
                ],
              ),
              Gap.small(),
              RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: context.colorScheme.primary,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
