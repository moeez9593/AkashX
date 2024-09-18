import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultLabelledCheckbox extends StatelessWidget {
  const DefaultLabelledCheckbox({
    super.key,
    required this.label,
    this.onChanged,
    this.padding,
    this.tristate = false,
    this.initialChecked = false,
  });

  final String label;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final bool initialChecked;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultCheckbox(
            initialChecked: initialChecked,
            onChanged: onChanged,
            tristate: tristate,
          ),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: AppFontWeight.regular,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
