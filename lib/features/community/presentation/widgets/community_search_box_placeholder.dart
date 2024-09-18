import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:flutter/material.dart';

class CommunitySearchBoxPlaceholder extends StatelessWidget {
  const CommunitySearchBoxPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: context.screenWidth * 0.5,
              height: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: context.colorScheme.onSurface.withAlpha(40),
                    blurRadius: 70,
                    spreadRadius: 50)
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: Insets.mediumLarge,
            ),
            child: Container(
              width: context.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.xxlarge),
                color: context.colorScheme.surface
              ),
              padding: const EdgeInsets.symmetric(
                vertical: Insets.xsmall,
              ),
              child: Text(
                context.l10n.search,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
          Positioned(
            right: Insets.xlarge,
            child: Icon(
              Icons.search,
              size: 24,
              color: context.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
