import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultActionTextButton extends StatelessWidget {
  const DefaultActionTextButton({
    super.key,
    required this.text,
    required this.actionText,
    this.onActionPressed,
    this.padding,
  });

  final String text;
  final String actionText;
  final VoidCallback? onActionPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: RichText(
        text: TextSpan(
          text: text,
          style: textTheme.labelLarge?.copyWith(
            fontSize: 14.sp,
            color: colorScheme.onTertiary,
          ),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: CupertinoButton(
                onPressed: onActionPressed,
                padding: const EdgeInsets.only(left: Insets.xxsmall),
                child: Text(
                  actionText,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 15.sp,
                    color: colorScheme.primary,
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
