import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBlurredBg extends StatelessWidget {
  const DefaultAppBlurredBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.2.sh),
      child: Container(
        width: context.screenWidth,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: Insets.large,
        ),
        child: Container(
          height: context.screenHeight * 0.6,
          width: context.screenWidth * 0.75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF434343).withOpacity(0.125),
                spreadRadius: 50,
                blurRadius: 100,
              ),
              BoxShadow(
                color: const Color(0xFF2F2F2F).withOpacity(0.125),
                spreadRadius: 50,
                blurRadius: 100,
              ),
              BoxShadow(
                color: const Color(0xFF535353).withOpacity(0.125),
                spreadRadius: 50,
                blurRadius: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
