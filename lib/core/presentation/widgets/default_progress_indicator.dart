import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultProgressIndicator extends StatelessWidget {
  const DefaultProgressIndicator({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF312F43),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            height: 8.h,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFEDD27C),
                  Color(0xFFA57E00),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            height: 8.h,
            width: (1.sw * value) - Insets.xxlarge,
          ),
        ],
      ),
    );
  }
}
