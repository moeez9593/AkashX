import 'package:flutter/material.dart';
import 'package:gap/gap.dart' as gap;

final class Gap extends StatelessWidget {
  const Gap(this._size, {super.key});

  factory Gap.xxxxsmall() => const Gap(Insets.xxxxsmall);
  factory Gap.xxxsmall() => const Gap(Insets.xxxsmall);
  factory Gap.xxsmall() => const Gap(Insets.xxsmall);
  factory Gap.xsmall() => const Gap(Insets.xsmall);
  factory Gap.small() => const Gap(Insets.small);
  factory Gap.medium() => const Gap(Insets.medium);
  factory Gap.mediumLarge() => const Gap(Insets.mediumLarge);
  factory Gap.large() => const Gap(Insets.large);
  factory Gap.xlarge() => const Gap(Insets.xlarge);
  factory Gap.xxlarge() => const Gap(Insets.xxlarge);
  factory Gap.xxxlarge() => const Gap(Insets.xxxlarge);
  factory Gap.xxxxlarge() => const Gap(Insets.xxxxlarge);

  final double _size;

  @override
  Widget build(BuildContext context) => gap.Gap(_size);
}

final class Insets {
  const Insets._();

  static const double _scale = 1;
  // Regular paddings
  static const double zero = 0;
  static const double xxxxsmall = _scale * 1;
  static const double xxxsmall = _scale * 2;
  static const double xxsmall = _scale * 4;
  static const double xsmall = _scale * 8;
  static const double small = _scale * 12;
  static const double medium = _scale * 16;
  static const double mediumLarge = _scale * 20;
  static const double large = _scale * 24;
  static const double xlarge = _scale * 32;
  static const double xxlarge = _scale * 48;
  static const double xxxlarge = _scale * 64;
  static const double xxxxlarge = _scale * 80;
  static const double infinity = double.infinity;
}
