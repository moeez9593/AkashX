import 'package:flutter/material.dart';

class SlideUpAnimationPageRoute extends PageRouteBuilder {
  final Widget child;

  SlideUpAnimationPageRoute({required this.child, required RouteSettings settings})
      : super(
            pageBuilder: (c, a, ac) => child,
            transitionDuration: const Duration(milliseconds: 250),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween(begin: const Offset(0, 1), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}
