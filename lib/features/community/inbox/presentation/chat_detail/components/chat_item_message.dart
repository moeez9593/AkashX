import 'package:akashx/app/extensions/build_context_ext.dart';
import 'package:akashx/app/themes/app_sizes.dart';
import 'package:akashx/features/community/inbox/presentation/chat_detail/components/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageItem extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = message.isCurrentUser;
    final alignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final List<Color> colors = isCurrentUser
        ? const [
            Color(0xFF3F432F),
            Color(0xFF6E7453),
          ]
        : const [
            Color(0xFFA78C00),
            Color(0xFF5B4700),
          ];
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(isCurrentUser ? AppSizes.size12 : 0),
      topRight: const Radius.circular(AppSizes.size12),
      bottomLeft: const Radius.circular(AppSizes.size12),
      bottomRight: Radius.circular(isCurrentUser ? 0 : AppSizes.size12),
    );
    final textColor =
        isCurrentUser ? Colors.white : context.colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
              borderRadius: borderRadius,
            ),
            child: Text(
              message.text,
              style: TextStyle(color: textColor),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${message.timeDate.hour}:${message.timeDate.minute.toString().padLeft(2, '0')}",
            style: context.textTheme.bodySmall
                ?.copyWith(color: context.colorScheme.onSecondaryContainer),
          ),
        ],
      ),
    );
  }
}
