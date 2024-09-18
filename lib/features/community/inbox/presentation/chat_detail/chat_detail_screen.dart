import 'package:akashx/features/community/inbox/presentation/chat_detail/components/chat_item_message.dart';
import 'package:akashx/features/community/inbox/presentation/chat_detail/components/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/generated/assets.gen.dart';
import 'package:akashx/app/themes/app_spacing.dart';
import 'package:akashx/app/themes/app_text_styles.dart';
import 'package:akashx/core/presentation/widgets/default_app_bar.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ChatDetailScreen extends StatelessWidget {
  final int index;

  ChatDetailScreen({super.key, required this.index});

  List<ChatMessage> messages = dummyMessages;

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: DefaultAppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 20),
            Gap.small(),
            Text(
              "Akashx",
              style: textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: AppFontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
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
          // const DefaultAppBlurredBg(),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatMessageItem(
                        message: messages[messages.length - index - 1]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          filled: true,
                          hintText: "Send message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SvgPicture.asset(
                              'assets/svgs/faceemoji.svg',
                            ),
                          ),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Assets.svgs.iconPlus.svg(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap.large(),
            ],
          ),
        ],
      ),
    );
  }
}
