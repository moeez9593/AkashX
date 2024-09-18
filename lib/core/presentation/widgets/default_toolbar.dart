import 'package:flutter/material.dart';

import '../../../app/themes/app_spacing.dart';

class DefaultToolbar extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  const DefaultToolbar({
    super.key,
    this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.xxsmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading ?? const SizedBox(),
          Expanded(child: title ?? const SizedBox()),
          actions != null
              ? Row(
                  children: actions!,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
