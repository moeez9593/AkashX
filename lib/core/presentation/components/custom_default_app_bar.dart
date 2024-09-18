import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/themes/app_colors.dart';

class CustomDefaultAppBar extends AppBar {
  final Color color;

  CustomDefaultAppBar({super.key, this.color = AppColors.transparent})
      : super(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: color,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          toolbarHeight: 0,
          elevation: 0,
        );
}
