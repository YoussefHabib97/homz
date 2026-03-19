class ChatMessage {
  final String text;
  final DateTime sentAt;
  final bool isMe;

  const ChatMessage({
    required this.text,
    required this.sentAt,
    required this.isMe,
  });

  String get timeLabel {
    final h = sentAt.hour % 12 == 0 ? 12 : sentAt.hour % 12;
    final m = sentAt.minute.toString().padLeft(2, '0');
    final suffix = sentAt.hour >= 12 ? 'pm' : 'am';
    return '$h:$m$suffix';
  }
}
