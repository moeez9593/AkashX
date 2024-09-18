import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_dialog.dart';
import 'package:akashx/core/presentation/widgets/default_dropdown.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/core/presentation/widgets/default_white_label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTradeAlertsDialog extends StatelessWidget {
  const FilterTradeAlertsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return DefaultDialog(
      child: Column(
        children: [
          DefaultWhiteLabelTextWithIcon(
            text: l10n.filter,
            textStyle: textTheme.titleLarge?.copyWith(fontSize: 16.sp, fontWeight: AppFontWeight.semibold),
          ),
          Gap.medium(),
          DefaultDropdown(hintText: l10n.educator),
          Gap.small(),
          DefaultDropdown(hintText: l10n.assetType),
          Gap.large(),
          Row(
            children: [
              Expanded(
                child: DefaultIconGradientButton(
                  text: l10n.cancel,
                  colors: const [Color(0xFF3F432F), Color(0xFF6E7453)],
                  onPressed: () {},
                ),
              ),
              Gap.medium(),
              Expanded(
                child: DefaultIconGradientButton(
                  text: l10n.apply,
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
