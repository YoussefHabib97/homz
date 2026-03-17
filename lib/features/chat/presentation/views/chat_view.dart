import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/theme/chat_text_theme.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/text_form_fields/custom_text_form_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();

  final List<_ChatMessage> _messages = const [
    _ChatMessage(
      text: 'Hi, John! 👋 How are you doing?',
      time: '2:20pm',
      isMe: false,
    ),
    _ChatMessage(
      text: 'Hi, John! 👋 How are you doing?',
      time: '2:20pm',
      isMe: true,
    ),
    _ChatMessage(
      text: 'Hi, John! 👋 How are you doing?',
      time: '2:20pm',
      isMe: false,
    ),
    _ChatMessage(
      text: 'Hi, John! 👋 How are you doing?',
      time: '2:20pm',
      isMe: true,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  // TODO: Refactor to multiple child widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text('Name Placeholder'),
        actions: const [CircleAvatar(radius: 20), SizedBox(width: 16)],
      ),
      body: SafeArea(
        child: AppDefaultPadding(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _buildDateChip(),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView.separated(
                  itemCount: _messages.length,
                  padding: EdgeInsets.only(bottom: 16.h),
                  separatorBuilder: (_, _) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final msg = _messages[index];
                    return _ChatBubble(message: msg);
                  },
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextFormField.chat(
                controller: _messageController,
                attachments: [
                  _buildAttachmentPreview(Colors.orange),
                  _buildAttachmentPreview(Colors.teal),
                  _buildAttachmentPreview(Colors.brown),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: Replace with actual date
  Widget _buildDateChip() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppExtraColors.chatDateCardColor,
        ),
        child: Text('Today', style: ChatTextStyles.timestamp),
      ),
    );
  }

  //  TODO: replace with actual attachment preview
  Widget _buildAttachmentPreview(Color color) {
    return Container(color: color);
  }
}

class _ChatMessage {
  final String text;
  final String time;
  final bool isMe;

  const _ChatMessage({
    required this.text,
    required this.time,
    required this.isMe,
  });
}

class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return message.isMe
        ? _buildOutgoingMessageBubble()
        : _buildIncomingMessageBubble();
  }

  Widget _buildIncomingMessageBubble() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(radius: 20),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Implement read more functionality
            Text(
              message.time,
              style: ChatTextStyles.timestamp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: AppExtraColors.chatBubbleColor,
              ),
              constraints: BoxConstraints(maxWidth: 0.7.sw),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(message.text, style: ChatTextStyles.message),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOutgoingMessageBubble() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message.time, style: ChatTextStyles.timestamp),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: AppColors.primary[300],
              ),
              constraints: BoxConstraints(maxWidth: 0.7.sw),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                message.text,
                style: ChatTextStyles.message.copyWith(
                  color: AppColors.grey[50],
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        const CircleAvatar(radius: 20),
      ],
    );
  }
}
