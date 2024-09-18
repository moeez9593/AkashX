import 'package:akashx/app/extensions/extensions.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/themes.dart';
import 'package:akashx/core/presentation/widgets/default_icon_gradient_button.dart';
import 'package:akashx/features/home/presentation/widgets/dialogs/connect_your_account_dialog.dart';
import 'package:akashx/features/home/presentation/widgets/user_status_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoCard extends StatefulWidget {
  const UserInfoCard({
    super.key,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  late GradientButtonType type;

  @override
  void initState() {
    super.initState();
    type = GradientButtonType.notConnected;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return Card(
      color: Colors.transparent,
      margin: widget.padding ?? EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: colorScheme.secondaryContainer),
            padding: const EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.small),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: AppSizes.size32),
                Gap.medium(),
                Expanded(
                  child: Align(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.semibold,
                          ),
                        ),
                        Gap.xxxsmall(),
                        Text(
                          'johndoe28',
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 12.sp,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        Gap.xxsmall(),
                        Row(
                          children: [
                            Assets.svgs.iconAddressCard.svg(),
                            Gap.xxsmall(),
                            Expanded(
                              child: Text(
                                '223471245',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontSize: 12.sp,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Gap.xxsmall(),
                UserStatusGradientButton(
                  type: type,
                  onPressed: () {
                    setState(() {
                      type = GradientButtonType.connecting;
                    });
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        type = GradientButtonType.connected;
                      });
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: colorScheme.tertiaryContainer),
            padding: const EdgeInsets.symmetric(vertical: Insets.small, horizontal: Insets.small),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.accountBalance,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 13.sp,
                          color: colorScheme.onTertiary,
                        ),
                      ),
                      Text(
                        'N/A',
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: AppFontWeight.semibold,
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultIconGradientButton(
                  text: l10n.connect,
                  colors: const [
                    Color(0xFF3F432F),
                    Color(0xFF6E7453),
                  ],
                  icon: Assets.svgs.iconArrowRotate.svg(),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ConnectYourAccountDialog();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
