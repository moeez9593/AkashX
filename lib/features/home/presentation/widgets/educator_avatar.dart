import 'package:flutter/material.dart';

class EducatorAvatar extends StatelessWidget {
  const EducatorAvatar({
    super.key,
    this.imageRadius = 100,
  });
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    final diameter = imageRadius * 2;
    final border = diameter + 10;
    return Container(
      alignment: Alignment.center,
      height: border,
      width: border,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFA57E00),
            Color(0xFFEDD27C),
          ],
        ),
      ),
      child: CircleAvatar(radius: imageRadius),
    );
  }
}
