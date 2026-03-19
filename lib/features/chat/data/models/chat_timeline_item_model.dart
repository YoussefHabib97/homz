import 'chat_message_model.dart';

sealed class ChatTimelineItem {
  const ChatTimelineItem();
}

class ChatTimelineDateChip extends ChatTimelineItem {
  final String label;
  const ChatTimelineDateChip(this.label);
}

class ChatTimelineMessage extends ChatTimelineItem {
  final ChatMessage message;
  final bool isGroupedWithPrevious;
  final bool isGroupedWithNext;

  const ChatTimelineMessage({
    required this.message,
    required this.isGroupedWithPrevious,
    required this.isGroupedWithNext,
  });
}
