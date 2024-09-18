import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_checkbox.dart';
import 'package:akashx/core/presentation/widgets/default_dialog.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_labelled_text_field.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:akashx/features/home/presentation/widgets/signature_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiskDisclaimerDialog extends StatelessWidget {
  const RiskDisclaimerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return DefaultDialog(
      child: Column(
        children: [
          DefaultWhiteLabelTextWithIcon(
            text: l10n.riskDisclaimer,
            textStyle: textTheme.titleLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
          ),
          Gap.large(),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: AppTheme.defaultBoardRadius,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.surface,
                ),
                const BoxShadow(
                  color: Color(0xFF3F432F),
                  spreadRadius: -1.0,
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Insets.small, top: Insets.xsmall),
                  child: DefaultCheckbox(
                    initialChecked: false,
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RawScrollbar(
                    thumbColor: const Color(0xFF3F432F),
                    radius: const Radius.circular(40),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(Insets.xxsmall, Insets.small, Insets.small, Insets.small),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        l10n.disclaimerText,
                        style: textTheme.bodyLarge?.copyWith(fontSize: 13.sp, color: colorScheme.onTertiary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap.small(),
          DefaultLabelledTextField(labelText: l10n.fullName, hintText: ''),
          Gap.small(),
          const SignatureTextField(),
          Gap.large(),
          Row(
            children: [
              Expanded(
                child: DefaultIconGradientButton(
                  text: l10n.cancel,
                  colors: const [Color(0xFF3F432F), Color(0xFF6E7453)],
                ),
              ),
              Gap.medium(),
              Expanded(
                child: DefaultIconGradientButton(
                  text: l10n.submit,
                  icon: Assets.svgs.iconCheck.svg(height: 16, width: 16),
                  colors: const [Color(0xFFA78C00), Color(0xFF5B4700)],
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
