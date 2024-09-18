import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:akashx/features/community/inbox/presentation/chat_detail/chat_detail_screen.dart';
import 'package:akashx/features/community/inbox/presentation/chats_list/components/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/generated/assets.gen.dart';
import '../../../../../core/presentation/widgets/default_app_bar_title_text.dart';
import '../../../../../core/presentation/widgets/default_app_blurred_bg.dart';
import '../../../../dashboard/presentation/dashboard_screen.dart';
import '../../../presentation/widgets/community_search_box_placeholder.dart';

class ChatsListScreen extends HookWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearching = useState(false);
    final l10n = context.l10n;
    return Scaffold(
      appBar: DefaultAppBar(
        leading: IconButton(
          onPressed: () => dashboardStateKey.currentState?.openDrawer(),
          icon: Assets.svgs.iconDrawer.svg(),
        ),
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: isSearching.value
              ? const CommunitySearchBoxPlaceholder()
              : DefaultAppBarTitleText(text: l10n.community),
        ),
        actions: [
          if (!isSearching.value)
            IconButton(
              onPressed: () {
                isSearching.value = !isSearching.value;
              },
              icon: Icon(
                Icons.search_rounded,
                size: 26,
                color: context.colorScheme.onSurface,
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          Assets.svgs.homeBackground.svg(
            height: 0.4.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          const DefaultAppBlurredBg(),
          Container(
            color: context.colorScheme.surface.withAlpha(99),
            child: Column(
              children: [
                const Divider(
                  height: 0.75,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ChatListItem(
                        count: (index % 2).toString(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatDetailScreen(index: index),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
