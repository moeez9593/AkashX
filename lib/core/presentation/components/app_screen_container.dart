import 'package:flutter/material.dart';

class AppScreenContainer extends StatelessWidget {
  final Widget child;
  final Widget? drawer;
  final Color? appBarColor;
  final bool resizeToAvoidBottomInset;
  final Widget? topSection;
  final Widget? bottomSection;
  final VoidCallback? topBarCallback;

  const AppScreenContainer({
    super.key,
    required this.child,
    this.drawer,
    this.topBarCallback,
    this.appBarColor,
    this.topSection,
    this.bottomSection,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      // appBar: DefaultAppBar(),
      drawer: drawer,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
