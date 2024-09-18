import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.enableInteractiveSelection,
    this.onTap,
    this.isPassword = false,
    this.padding,
    this.fillColor,
  });

  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? enableInteractiveSelection;
  final void Function()? onTap;
  final bool isPassword;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;

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
      child: isPassword
          ? DefaultPasswordTextField(
              hintText: hintText,
              controller: controller,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              inputFormatters: inputFormatters,
              enabled: enabled,
              enableInteractiveSelection: enableInteractiveSelection,
              onTap: onTap,
              fillColor: fillColor,
            )
          : TextField(
              controller: controller,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              inputFormatters: inputFormatters,
              enabled: enabled,
              enableInteractiveSelection: enableInteractiveSelection,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textTheme.bodyLarge?.copyWith(
                  fontSize: 15.sp,
                  color: colorScheme.onTertiary,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.xsmall),
                fillColor: fillColor,
                filled: true,
                border: defaultBorder,
                enabledBorder: defaultBorder,
                focusedBorder: defaultBorder,
                errorBorder: defaultBorder,
                focusedErrorBorder: defaultBorder,
              ),
            ),
    );
  }
}

class DefaultPasswordTextField extends HookWidget {
  const DefaultPasswordTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.enableInteractiveSelection,
    this.onTap,
    this.fillColor,
  });

  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? enableInteractiveSelection;
  final void Function()? onTap;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isPasswordHidden = useState<bool>(true);
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    const defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      borderSide: BorderSide.none,
    );

    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      enabled: enabled,
      enableInteractiveSelection: enableInteractiveSelection,
      onTap: onTap,
      obscureText: isPasswordHidden.value,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyLarge?.copyWith(
          fontSize: 15,
          color: colorScheme.onTertiary,
        ),
        suffixIcon: GestureDetector(
          key: const Key('password_icon'),
          onTap: () => isPasswordHidden.value = !isPasswordHidden.value,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: Insets.medium),
            child: Icon(
              isPasswordHidden.value ? Icons.visibility : Icons.visibility_off,
              color: colorScheme.primary,
              // size: AppSizes.size10,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.xsmall),
        fillColor: fillColor,
        filled: true,
        border: defaultBorder,
        enabledBorder: defaultBorder,
        focusedBorder: defaultBorder,
        errorBorder: defaultBorder,
        focusedErrorBorder: defaultBorder,
      ),
    );
  }
}
