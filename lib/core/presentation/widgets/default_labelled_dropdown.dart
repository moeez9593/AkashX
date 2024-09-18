import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_dropdown.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:flutter/material.dart';

class DefaultLabelledDropdown<T> extends StatelessWidget {
  const DefaultLabelledDropdown({
    super.key,
    required this.labelText,
    required this.hintText,
    this.padding,
    this.items,
    this.onChanged,
  });

  final String labelText;
  final String hintText;
  final EdgeInsetsGeometry? padding;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultYellowLabelText(
          text: labelText,
          padding: padding,
        ),
        Gap.xxsmall(),
        DefaultDropdown<T>(
          hintText: hintText,
          padding: padding,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
