import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsetsDirectional.all(Insets.xxsmall),
      child: child,
    );
  }
}
