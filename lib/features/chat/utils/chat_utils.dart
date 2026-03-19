import 'package:homz/features/chat/data/models/chat_message_model.dart';
import 'package:homz/features/chat/data/models/chat_timeline_item_model.dart';

const whatsAppGroupThreshold = Duration(minutes: 5);

bool shouldGroup(ChatMessage? a, ChatMessage? b) {
  if (a == null || b == null) return false;
  if (a.isMe != b.isMe) return false;

  final aDay = DateTime(a.sentAt.year, a.sentAt.month, a.sentAt.day);
  final bDay = DateTime(b.sentAt.year, b.sentAt.month, b.sentAt.day);
  if (aDay != bDay) return false;

  final diff = b.sentAt.difference(a.sentAt);
  return diff >= Duration.zero && diff <= whatsAppGroupThreshold;
}

// Build timeline items
List<ChatTimelineItem> buildTimelineItems(List<ChatMessage> messages) {
  final sorted = [...messages]..sort((a, b) => a.sentAt.compareTo(b.sentAt));
  final items = <ChatTimelineItem>[];
  DateTime? lastDay;

  for (var i = 0; i < sorted.length; i++) {
    final msg = sorted[i];
    final day = DateTime(msg.sentAt.year, msg.sentAt.month, msg.sentAt.day);

    if (lastDay == null || day.isAfter(lastDay)) {
      items.add(ChatTimelineDateChip(formatDayChip(day)));
      lastDay = day;
    }

    final prev = i > 0 ? sorted[i - 1] : null;
    final next = i + 1 < sorted.length ? sorted[i + 1] : null;

    items.add(
      ChatTimelineMessage(
        message: msg,
        isGroupedWithPrevious: shouldGroup(prev, msg),
        isGroupedWithNext: shouldGroup(msg, next),
      ),
    );
  }

  return items;
}

// Format day labels
String formatDayChip(DateTime day) {
  final today = DateTime.now();
  final todayDay = DateTime(today.year, today.month, today.day);
  final daysAgo = todayDay.difference(day).inDays;

  if (daysAgo == 0) return 'Today';
  if (daysAgo == 1) return 'Yesterday';
  if (daysAgo >= 2 && daysAgo <= 6) {
    const weekdayNames = <int, String>{
      DateTime.monday: 'Monday',
      DateTime.tuesday: 'Tuesday',
      DateTime.wednesday: 'Wednesday',
      DateTime.thursday: 'Thursday',
      DateTime.friday: 'Friday',
      DateTime.saturday: 'Saturday',
      DateTime.sunday: 'Sunday',
    };
    return weekdayNames[day.weekday] ?? 'Unknown';
  }

  final dd = day.day.toString().padLeft(2, '0');
  final mm = day.month.toString().padLeft(2, '0');
  final yyyy = day.year.toString();
  return '$dd/$mm/$yyyy';
}
