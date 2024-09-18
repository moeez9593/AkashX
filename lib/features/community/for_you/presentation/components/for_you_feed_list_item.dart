import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/features/community/presentation/widgets/user_name_icon_item.dart';
import 'package:flutter/material.dart';

class ForYouFeedListItem extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String description;
  final String? image;

  const ForYouFeedListItem({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.medium),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.small),
          color: context.colorScheme.secondaryContainer,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Insets.small,
                vertical: Insets.xsmall,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: context.colorScheme.onSecondaryContainer,
                      width: 0.125),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: UserNameIconItem(
                      name: "Akashx",
                      image: "",
                      isVerified: true,
                    ),
                  ),
                  Text(
                    '$date $time',
                    style: textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  Gap.xsmall(),
                  Icon(
                    Icons.more_vert_outlined,
                    color: context.colorScheme.onSecondaryContainer,
                    size: 24,
                  )
                ],
              ),
            ),
            if (image != null)
              Image.network(
                image!,
                height: 250,
                width: size.width,
                fit: BoxFit.fill,
              ),
            Padding(
              padding: const EdgeInsets.all(Insets.medium),
              child: Text(
                description,
                style: textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
