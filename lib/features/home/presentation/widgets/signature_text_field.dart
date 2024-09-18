import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignatureTextField extends HookWidget {
  const SignatureTextField({
    super.key,
    this.initialText = '',
    this.onChanged,
  });

  final String initialText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    final textController = useTextEditingController(text: initialText);

    const defaultBorder = OutlineInputBorder(
      borderRadius: AppTheme.defaultBoardRadius,
      borderSide: BorderSide.none,
    );

    return Stack(
      children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: l10n.writeYourSignatureHere,
            hintStyle: textTheme.bodyLarge?.copyWith(
              fontSize: 15.sp,
              color: colorScheme.onTertiary,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.xsmall),
            filled: true,
            border: defaultBorder,
            enabledBorder: defaultBorder,
            focusedBorder: defaultBorder,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder,
          ),
          maxLines: 3,
          onChanged: onChanged,
        ),
        Positioned(
          right: Insets.medium,
          top: Insets.xsmall,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            minSize: 22,
            onPressed: textController.clear,
            child: Text(
              l10n.clear,
              style: textTheme.labelLarge?.copyWith(fontSize: 16.sp, color: colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
