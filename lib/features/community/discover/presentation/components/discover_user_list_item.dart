import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/features/community/presentation/widgets/user_name_icon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../presentation/widgets/default_follow_button.dart';

//TODO: replace with stateless after impl
class DiscoverUserListItem extends HookWidget {
  final bool isVerified;
  final VoidCallback onClick;

  const DiscoverUserListItem({
    super.key,
    required this.onClick,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    final isFollowing = useState(false); //TODO: move to bloc
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.medium),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.medium),
              color: context.colorScheme.secondaryContainer),
          padding: const EdgeInsets.all(
            Insets.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: UserNameIconItem(
                  name: "Akashx",
                  image: "",
                  isVerified: isVerified,
                ),
              ),
              DefaultFollowButton(
                isFollowing: isFollowing.value,
                onClick: () {
                  isFollowing.value = !isFollowing.value;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
