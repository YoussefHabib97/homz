// ! Deprecated

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:homz/core/theme/app_colors.dart';
// import 'package:homz/core/theme/chat_text_theme.dart';
// import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
// import 'package:homz/core/widgets/shared/text_form_fields/custom_text_form_field.dart';

// class ChatView extends StatefulWidget {
//   const ChatView({super.key});

//   @override
//   State<ChatView> createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   final TextEditingController _messageController = TextEditingController();
//   static const Duration _whatsAppGroupThreshold = Duration(minutes: 5);

//   final List<_ChatMessage> _messages = [
//     // Yesterday (to show the day chip + grouping across multiple bubbles)
//     _ChatMessage(
//       text: 'Hi, John! 👋 How are you doing?',
//       sentAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
//       isMe: false,
//     ),
//     _ChatMessage(
//       text: 'I’m good — are you free to view apartments today?',
//       sentAt: DateTime.now().subtract(
//         const Duration(days: 1, hours: 3, minutes: 2),
//       ),
//       isMe: false,
//     ),
//     _ChatMessage(
//       text: 'Yep! Send me a few options.',
//       sentAt: DateTime.now().subtract(
//         const Duration(days: 1, hours: 3, minutes: 4),
//       ),
//       isMe: true,
//     ),
//     // Not grouped (gap > 5 minutes)
//     _ChatMessage(
//       text: 'Got it. Any preferred area?',
//       sentAt: DateTime.now().subtract(
//         const Duration(days: 1, hours: 3, minutes: 12),
//       ),
//       isMe: false,
//     ),
//     _ChatMessage(
//       text: 'Nasr City or Heliopolis would be great.',
//       sentAt: DateTime.now().subtract(
//         const Duration(days: 1, hours: 3, minutes: 14),
//       ),
//       isMe: true,
//     ),

//     // Today (mix of grouped and non-grouped)
//     _ChatMessage(
//       text: 'Here are 3 listings that match your budget.',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 40)),
//       isMe: true,
//     ),
//     _ChatMessage(
//       text: '1) Duplex — 3 beds — parking & gym',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 38)),
//       isMe: true,
//     ),
//     _ChatMessage(
//       text: '2) Modern apartment — close to metro',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 36)),
//       isMe: true,
//     ),
//     // Not grouped (gap > 5 minutes)
//     _ChatMessage(
//       text: 'Which one do you want to visit first?',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 25)),
//       isMe: true,
//     ),
//     _ChatMessage(
//       text: 'Option 2 looks perfect. Can we schedule for 6pm?',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 22)),
//       isMe: false,
//     ),
//     _ChatMessage(
//       text: 'Sure — I’ll confirm with the owner.',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 18)),
//       isMe: true,
//     ),
//     // Grouped (within 5 minutes)
//     _ChatMessage(
//       text: 'Sending you the location now.',
//       sentAt: DateTime.now().subtract(const Duration(hours: 2, minutes: 16)),
//       isMe: true,
//     ),
//     // Not grouped (gap > 5 minutes)
//     _ChatMessage(
//       text: 'Thanks!',
//       sentAt: DateTime.now().subtract(const Duration(minutes: 12)),
//       isMe: false,
//     ),
//   ];

//   @override
//   void dispose() {
//     _messageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final items = _buildTimelineItems(_messages);

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         //? TODO: Implement the proper icon button
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back_ios_new_rounded),
//         //   onPressed: () => GoRouter.of(context).pop(),
//         // ),
//         title: const Text('Name Placeholder'),
//         actions: const [CircleAvatar(radius: 20), SizedBox(width: 16)],
//       ),
//       body: AppDefaultPadding(
//         verticalOffset: 0,
//         child: Column(
//           children: [
//             SizedBox(height: 16.h),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: items.length,
//                 padding: EdgeInsets.only(bottom: 16.h, top: 8.h),
//                 itemBuilder: (context, index) {
//                   final item = items[index];
//                   final child = switch (item) {
//                     _ChatTimelineDateChip(:final label) => _DateChip(
//                       label: label,
//                     ),
//                     _ChatTimelineMessage(
//                       :final message,
//                       :final isGroupedWithPrevious,
//                       :final isGroupedWithNext,
//                     ) =>
//                       _ChatBubble(
//                         message: message,
//                         isGroupedWithPrevious: isGroupedWithPrevious,
//                         isGroupedWithNext: isGroupedWithNext,
//                       ),
//                   };

//                   final next = index + 1 < items.length
//                       ? items[index + 1]
//                       : null;
//                   final spacing = _spacingAfter(item, next);

//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       child,
//                       if (spacing > 0) SizedBox(height: spacing),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 8.h),
//             CustomTextFormField.chat(
//               controller: _messageController,
//               attachments: [
//                 // _buildAttachmentPreview(Colors.orange),
//                 // _buildAttachmentPreview(Colors.teal),
//                 // _buildAttachmentPreview(Colors.brown),
//               ],
//             ),
//             SizedBox(height: 16.h),
//           ],
//         ),
//       ),
//     );
//   }

//   List<_ChatTimelineItem> _buildTimelineItems(List<_ChatMessage> messages) {
//     final sorted = [...messages]..sort((a, b) => a.sentAt.compareTo(b.sentAt));

//     final items = <_ChatTimelineItem>[];
//     DateTime? lastDay;

//     for (var i = 0; i < sorted.length; i++) {
//       final msg = sorted[i];
//       final day = DateTime(msg.sentAt.year, msg.sentAt.month, msg.sentAt.day);
//       if (lastDay == null || day.isAfter(lastDay)) {
//         items.add(_ChatTimelineDateChip(_formatDayChip(day)));
//         lastDay = day;
//       }

//       final prev = i > 0 ? sorted[i - 1] : null;
//       final next = i + 1 < sorted.length ? sorted[i + 1] : null;

//       final isGroupedWithPrevious = _shouldGroup(prev, msg);
//       final isGroupedWithNext = _shouldGroup(msg, next);

//       items.add(
//         _ChatTimelineMessage(
//           msg,
//           isGroupedWithPrevious: isGroupedWithPrevious,
//           isGroupedWithNext: isGroupedWithNext,
//         ),
//       );
//     }

//     return items;
//   }

//   bool _shouldGroup(_ChatMessage? a, _ChatMessage? b) {
//     if (a == null || b == null) return false;
//     if (a.isMe != b.isMe) return false;

//     final aDay = DateTime(a.sentAt.year, a.sentAt.month, a.sentAt.day);
//     final bDay = DateTime(b.sentAt.year, b.sentAt.month, b.sentAt.day);
//     if (aDay != bDay) return false;

//     final diff = b.sentAt.difference(a.sentAt);
//     return diff >= Duration.zero && diff <= _whatsAppGroupThreshold;
//   }

//   double _spacingAfter(_ChatTimelineItem current, _ChatTimelineItem? next) {
//     if (next == null) return 0;

//     if (current is _ChatTimelineDateChip || next is _ChatTimelineDateChip) {
//       return 16.h;
//     }

//     if (current is _ChatTimelineMessage &&
//         next is _ChatTimelineMessage &&
//         current.message.isMe == next.message.isMe &&
//         next.isGroupedWithPrevious) {
//       return 6.h;
//     }

//     return 16.h;
//   }

//   String _formatDayChip(DateTime day) {
//     final today = DateTime.now();
//     final todayDay = DateTime(today.year, today.month, today.day);
//     final daysAgo = todayDay.difference(day).inDays;

//     if (daysAgo == 0) return 'Today';
//     if (daysAgo == 1) return 'Yesterday';
//     if (daysAgo >= 2 && daysAgo <= 6) {
//       const weekdayNames = <int, String>{
//         DateTime.monday: 'Monday',
//         DateTime.tuesday: 'Tuesday',
//         DateTime.wednesday: 'Wednesday',
//         DateTime.thursday: 'Thursday',
//         DateTime.friday: 'Friday',
//         DateTime.saturday: 'Saturday',
//         DateTime.sunday: 'Sunday',
//       };
//       return weekdayNames[day.weekday] ?? 'Unknown';
//     }

//     final dd = day.day.toString().padLeft(2, '0');
//     final mm = day.month.toString().padLeft(2, '0');
//     final yyyy = day.year.toString();
//     return '$dd/$mm/$yyyy';
//   }
// }

// sealed class _ChatTimelineItem {
//   const _ChatTimelineItem();
// }

// class _ChatTimelineDateChip extends _ChatTimelineItem {
//   final String label;
//   const _ChatTimelineDateChip(this.label);
// }

// class _ChatTimelineMessage extends _ChatTimelineItem {
//   final _ChatMessage message;
//   final bool isGroupedWithPrevious;
//   final bool isGroupedWithNext;

//   const _ChatTimelineMessage(
//     this.message, {
//     required this.isGroupedWithPrevious,
//     required this.isGroupedWithNext,
//   });
// }

// class _ChatMessage {
//   final String text;
//   final DateTime sentAt;
//   final bool isMe;

//   const _ChatMessage({
//     required this.text,
//     required this.sentAt,
//     required this.isMe,
//   });

//   String get timeLabel {
//     final h = sentAt.hour % 12 == 0 ? 12 : sentAt.hour % 12;
//     final m = sentAt.minute.toString().padLeft(2, '0');
//     final suffix = sentAt.hour >= 12 ? 'pm' : 'am';
//     return '$h:$m$suffix';
//   }
// }

// class _DateChip extends StatelessWidget {
//   final String label;

//   const _DateChip({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             color: AppExtraColors.chatDateCardColor.withValues(alpha: 0.85),
//             borderRadius: BorderRadius.circular(999),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black54,
//                 blurRadius: 10,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
//             child: Text(
//               label,
//               style: ChatTextStyles.timestamp.copyWith(
//                 letterSpacing: 0.6,
//                 color: AppColors.grey[100],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ChatBubble extends StatelessWidget {
//   final _ChatMessage message;
//   final bool isGroupedWithPrevious;
//   final bool isGroupedWithNext;

//   const _ChatBubble({
//     required this.message,
//     required this.isGroupedWithPrevious,
//     required this.isGroupedWithNext,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return message.isMe
//         ? _buildOutgoingMessageBubble()
//         : _buildIncomingMessageBubble();
//   }

//   Widget _buildIncomingMessageBubble() {
//     // WhatsApp-like: show avatar only on the FIRST bubble of a group.
//     final showAvatar = !isGroupedWithPrevious;
//     // Keep time inside bubble only on the LAST bubble of a group.
//     final showTime = !isGroupedWithNext;

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 40,
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: showAvatar
//                 ? const CircleAvatar(radius: 20)
//                 : const SizedBox(),
//           ),
//         ),
//         SizedBox(width: 16.w),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             VerticalGap(16),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: isGroupedWithPrevious
//                       ? const Radius.circular(16)
//                       : Radius.zero,
//                   topRight: const Radius.circular(16),
//                   bottomLeft: isGroupedWithNext
//                       ? const Radius.circular(6)
//                       : const Radius.circular(16),
//                   bottomRight: const Radius.circular(16),
//                 ),
//                 color: AppColors.primary[300],
//               ),
//               constraints: BoxConstraints(maxWidth: 0.7.sw),
//               padding: const EdgeInsets.fromLTRB(16, 12, 12, 10),
//               child: _BubbleContents(
//                 text: message.text,
//                 timeLabel: message.timeLabel,
//                 showTime: showTime,
//                 timeColor: AppColors.grey[100]!,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildOutgoingMessageBubble() {
//     final showAvatar = !isGroupedWithPrevious;
//     final showTime = !isGroupedWithNext;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             VerticalGap(16),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(16),
//                   topRight: isGroupedWithPrevious
//                       ? const Radius.circular(16)
//                       : Radius.zero,
//                   bottomLeft: const Radius.circular(16),
//                   bottomRight: isGroupedWithNext
//                       ? const Radius.circular(6)
//                       : const Radius.circular(16),
//                 ),
//                 color: AppExtraColors.chatBubbleColor,
//               ),
//               constraints: BoxConstraints(maxWidth: 0.7.sw),
//               padding: const EdgeInsets.fromLTRB(16, 12, 12, 10),
//               child: _BubbleContents(
//                 text: message.text,
//                 timeLabel: message.timeLabel,
//                 showTime: showTime,
//                 timeColor: AppColors.grey[300]!,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 16.w),
//         SizedBox(
//           width: 40,
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: showAvatar
//                 ? const CircleAvatar(radius: 20)
//                 : const SizedBox(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _BubbleContents extends StatelessWidget {
//   final String text;
//   final String timeLabel;
//   final bool showTime;
//   final Color timeColor;

//   const _BubbleContents({
//     required this.text,
//     required this.timeLabel,
//     required this.showTime,
//     required this.timeColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Use a stack so the timestamp can sit in the bottom-right of the bubble.
//     // Add bottom padding to the text so it doesn't collide with the timestamp.
//     return Stack(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: showTime ? 14.h : 0),
//           child: Text(text, style: ChatTextStyles.message),
//         ),
//         if (showTime)
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Text(
//               timeLabel,
//               style: ChatTextStyles.timestamp.copyWith(
//                 fontSize: 11.w,
//                 color: timeColor,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
