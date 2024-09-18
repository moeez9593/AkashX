import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_text_field.dart';
import 'package:akashx/core/presentation/widgets/default_yellow_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultLabelledTextField extends StatelessWidget {
  const DefaultLabelledTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.padding,
    this.controller,
    this.inputFormatters,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.fillColor,
    this.isPassword = false,
  });

  final String labelText;
  final String hintText;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultYellowLabelText(
          padding: padding,
          text: labelText,
        ),
        Gap.xxsmall(),
        DefaultTextField(
          padding: padding,
          hintText: hintText,
          controller: controller,
          inputFormatters: inputFormatters,
          isPassword: isPassword,
          onChanged: onChanged,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          fillColor: fillColor,
        ),
      ],
    );
  }
}
