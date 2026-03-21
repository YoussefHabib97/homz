import 'package:flutter/material.dart';
import 'package:homz/core/utils/mock_messages.dart';
import 'package:homz/core/widgets/common/default_app_bar.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';
import 'package:homz/features/chat/ui/helpers/chat_utils.dart';
import 'package:homz/features/chat/ui/models/chat_timeline_item_model.dart';
import 'package:homz/shared/text_fields/custom_text_form_field.dart';

import '../widgets/bubbles/chat_bubble.dart';
import '../widgets/date_chip.dart';

//? TODO: Refactor to use Slivers & CustomScrollView

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Scroll to bottom after the widgets are laid out
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = buildTimelineItems(mockMessages);

    return Scaffold(
      appBar: AppDefaultAppBar(
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: CircleAvatar())],
        title: const Text('Name Placeholder'),
      ),
      body: AppDefaultPadding(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final next = index + 1 < items.length
                      ? items[index + 1]
                      : null;

                  if (item is ChatTimelineDateChip) {
                    return DateChip(label: item.label);
                  }

                  if (item is ChatTimelineMessage) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: next != null ? 8 : 0),
                      child: ChatBubble(
                        message: item.message,
                        isGroupedWithPrevious: item.isGroupedWithPrevious,
                        isGroupedWithNext: item.isGroupedWithNext,
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
            CustomTextFormField.chat(controller: _messageController),
          ],
        ),
      ),
    );
  }
}
