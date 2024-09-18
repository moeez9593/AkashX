import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:flutter/material.dart';

class DefaultCounterBox extends StatelessWidget {
  final String count;

  const DefaultCounterBox({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      width: 21,
      height: 21,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(context.screenWidth)
      ),
      padding: const EdgeInsets.all(Insets.xxsmall),
      alignment: Alignment.center,
      child: Text(
        count,
        style: textTheme.labelMedium?.copyWith(
          color: context.colorScheme.onSecondary,
        ),
      ),
    );
  }
}
