import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/features/chat/data/models/chat_message_model.dart';
import 'package:homz/features/chat/ui/widgets/bubbles/bubble_contents.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isGroupedWithPrevious;
  final bool isGroupedWithNext;

  const ChatBubble({
    required this.message,
    required this.isGroupedWithPrevious,
    required this.isGroupedWithNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return message.isMe
        ? _buildOutgoingMessageBubble()
        : _buildIncomingMessageBubble();
  }

  Widget _buildIncomingMessageBubble() {
    // WhatsApp-like: show avatar only on the FIRST bubble of a group.
    final showAvatar = !isGroupedWithPrevious;
    // Keep time inside bubble only on the LAST bubble of a group.
    final showTime = !isGroupedWithNext;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          child: Align(
            alignment: Alignment.topCenter,
            child: showAvatar
                ? const CircleAvatar(radius: 20)
                : const SizedBox(),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: isGroupedWithPrevious
                      ? const Radius.circular(16)
                      : Radius.zero,
                  topRight: const Radius.circular(16),
                  bottomLeft: isGroupedWithNext
                      ? const Radius.circular(6)
                      : const Radius.circular(16),
                  bottomRight: const Radius.circular(16),
                ),
                color: AppColors.primary[300],
              ),
              constraints: BoxConstraints(maxWidth: 0.7.sw),
              padding: const EdgeInsets.all(16),
              child: BubbleContents(
                text: message.text,
                timeLabel: message.timeLabel,
                showTime: showTime,
                timeColor: AppColors.grey[100]!,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOutgoingMessageBubble() {
    final showAvatar = !isGroupedWithPrevious;
    final showTime = !isGroupedWithNext;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Gap(16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: isGroupedWithPrevious
                      ? const Radius.circular(16)
                      : Radius.zero,
                  bottomLeft: const Radius.circular(16),
                  bottomRight: isGroupedWithNext
                      ? const Radius.circular(6)
                      : const Radius.circular(16),
                ),
                color: AppExtraColors.chatBubbleColor,
              ),
              constraints: BoxConstraints(maxWidth: 0.7.sw),
              padding: const EdgeInsets.fromLTRB(16, 12, 12, 10),
              child: BubbleContents(
                text: message.text,
                timeLabel: message.timeLabel,
                showTime: showTime,
                timeColor: AppColors.grey[300]!,
              ),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        SizedBox(
          width: 40,
          child: Align(
            alignment: Alignment.topCenter,
            child: showAvatar
                ? const CircleAvatar(radius: 20)
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
