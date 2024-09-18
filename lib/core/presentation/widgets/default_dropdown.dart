import 'dart:math';

import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultDropdown<T> extends StatelessWidget {
  const DefaultDropdown({
    super.key,
    required this.hintText,
    this.items,
    this.onChanged,
    this.padding,
  });

  final String hintText;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    const defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      borderSide: BorderSide.none,
    );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: DropdownButtonFormField2<T>(
        hint: Text(
          hintText,
          style: textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
            color: colorScheme.onTertiary,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Transform.rotate(angle: -pi / 2, child: Icon(Icons.arrow_back_ios_rounded, size: 16.sp)),
          openMenuIcon: Transform.rotate(angle: -pi / 2, child: Icon(Icons.arrow_forward_ios_rounded, size: 16.sp)),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: AppTheme.defaultBoardRadius,
            color: colorScheme.surface,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF3F432F),
                Color(0xFF6E7453),
              ],
            ),
          ),
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(left: 0, right: Insets.medium, top: Insets.xsmall, bottom: Insets.xsmall),
          filled: true,
          hintStyle: textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
            color: colorScheme.onTertiary,
          ),
          border: defaultBorder,
          enabledBorder: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
        ),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
