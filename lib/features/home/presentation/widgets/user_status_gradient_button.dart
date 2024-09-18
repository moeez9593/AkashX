import 'dart:math' as math;

import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserStatusGradientButton extends StatefulWidget {
  const UserStatusGradientButton({
    super.key,
    required this.type,
    this.onPressed,
    this.padding,
    this.contentPadding,
    this.animateIcon = false,
  });

  final GradientButtonType type;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final bool animateIcon;

  @override
  State<UserStatusGradientButton> createState() => _UserStatusGradientButtonState();
}

class _UserStatusGradientButtonState extends State<UserStatusGradientButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UserStatusGradientButton oldWidget) {
    if (widget.type == GradientButtonType.connecting) {
      _animationController.repeat();
    } else {
      _animationController.reset();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = widget.type.value(context);
    final textTheme = context.textTheme;

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: value.colors,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSizes.size40)),
          ),
          child: InkWell(
            onTap: widget.onPressed,
            customBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.size40))),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              padding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: Insets.small, vertical: Insets.xsmall),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animationController.value * 2.0 * math.pi,
                        child: value.icon,
                      );
                    },
                  ),
                  Gap.xsmall(),
                  Text(
                    value.name,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, color: context.colorScheme.onSurface),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
