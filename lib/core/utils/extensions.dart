import 'package:flutter/material.dart';

extension Spacing on Size {
  Widget smallVerticalSpacing() => SizedBox(
        height: height * 0.005,
      );

  Widget smallHorizontalSpacing() => SizedBox(
        width: height * 0.005,
      );

  Widget mediumVerticalSpacing() => SizedBox(
        height: height * 0.008,
      );

  Widget mediumHorizontalSpacing() => SizedBox(
        width: height * 0.008,
      );

  Widget standardVerticalSpacing() => SizedBox(
        height: height * 0.01,
      );

  Widget standardHorizontalSpacing() => SizedBox(
        width: height * 0.01,
      );

  Widget mLargeVerticalSpacing() => SizedBox(
        height: height * 0.015,
      );

  Widget mLargeHorizontalSpacing() => SizedBox(
        width: height * 0.015,
      );

  Widget largeVerticalSpacing() => SizedBox(
        height: height * 0.025,
      );

  Widget largeHorizontalSpacing() => SizedBox(
        width: height * 0.025,
      );

  Widget xLargeVerticalSpacing() => SizedBox(
        height: height * 0.035,
      );

  Widget xLargeHorizontalSpacing() => SizedBox(
        width: height * 0.035,
      );

  Widget xxLargeVerticalSpacing() => SizedBox(
        height: height * 0.05,
      );

  Widget xxLargeHorizontalSpacing() => SizedBox(
        width: height * 0.05,
      );
}

extension AllPadding on Size {
  EdgeInsets standardPadding() => EdgeInsets.all(
        height * 0.015,
      );

  EdgeInsets mediumPadding() => EdgeInsets.all(
        height * 0.0075,
      );

  EdgeInsets smallPadding() => EdgeInsets.all(
        height * 0.005,
      );

  EdgeInsets largePadding() => EdgeInsets.all(
        height * 0.05,
      );

  EdgeInsets mLargePadding() => EdgeInsets.all(
        height * 0.025,
      );

  EdgeInsets mmLargePadding() => EdgeInsets.all(
        height * 0.035,
      );

  EdgeInsets xLargePadding() => EdgeInsets.all(
        height * 0.075,
      );

  EdgeInsets xxLargePadding() => EdgeInsets.all(
        height * 0.08,
      );

  EdgeInsets xxxLargePadding() => EdgeInsets.all(
        height * 0.085,
      );
}
