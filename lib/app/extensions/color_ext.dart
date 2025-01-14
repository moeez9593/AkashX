import 'dart:math';

import 'package:flutter/material.dart';

extension ColorExt on Color {
  String _generateAlpha({required int alpha, required bool withAlpha}) => withAlpha ? alpha.toRadixString(16).padLeft(2, '0') : '';

  String toHex({bool hashSign = false, bool withAlpha = false}) => '${hashSign ? '#' : ''}'
          '${_generateAlpha(alpha: alpha, withAlpha: withAlpha)}'
          '${red.toRadixString(16).padLeft(2, '0')}'
          '${green.toRadixString(16).padLeft(2, '0')}'
          '${blue.toRadixString(16).padLeft(2, '0')}'
      .toUpperCase();

  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String getRandomLightColorHex() {
    final Random random = Random();

    // Generate light color components
    int r = 100 + random.nextInt(100); // 100-119 range
    int g = 100 + random.nextInt(100); // 100-119 range
    int b = 100 + random.nextInt(100); // 100-119 range

    // Convert to hex string
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}';
  }
}
