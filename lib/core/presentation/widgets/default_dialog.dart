import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/glass_backdrop.dart';
import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: Insets.medium),
          backgroundColor: Colors.transparent,
          child: GlassBackground(
            child: Container(
              padding: padding ?? const EdgeInsets.all(Insets.large),
              decoration: BoxDecoration(
                color: const Color(0xFF3F432F).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
