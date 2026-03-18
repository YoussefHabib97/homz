import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/text_form_fields/custom_text_form_field.dart';
import 'package:homz/features/chat/data/models/chat_message.dart';
import 'package:homz/features/chat/data/models/chat_timeline_item.dart';
import 'package:homz/features/chat/utils/chat_utils.dart';

import 'widgets/chat_bubble.dart';
import 'widgets/date_chip.dart';

//? TODO: Refactor to use Slivers & CustomScrollView

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Anytime!",
      sentAt: DateTime.now().subtract(Duration(hours: 19, minutes: 8)),
      isMe: false,
    ),
    ChatMessage(
      text: "Anyhow, thank you for the convo!",
      sentAt: DateTime.now().subtract(Duration(hours: 19, minutes: 9)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Good to know. A reliable developer reduces risks and makes the investment more secure.",
      sentAt: DateTime.now().subtract(Duration(hours: 19, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Lastly, the developer’s reputation is solid. Past projects have high occupancy and appreciation rates.",
      sentAt: DateTime.now().subtract(Duration(hours: 19, minutes: 30)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Yes, storage is a lifesaver. Keeps the living space clean and uncluttered.",
      sentAt: DateTime.now().subtract(Duration(hours: 19, minutes: 50)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "I also noticed the storage units included in some apartments. Very handy for families with extra belongings.",
      sentAt: DateTime.now().subtract(Duration(hours: 20, minutes: 10)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Absolutely. Plus, with smart home and eco-friendly features, these units are appealing to modern buyers.",
      sentAt: DateTime.now().subtract(Duration(hours: 20, minutes: 30)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Great! I think this will attract a lot of investors looking for luxury rentals or long-term homes.",
      sentAt: DateTime.now().subtract(Duration(hours: 20, minutes: 50)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Yes, I checked. Early-bird discounts are around 5%, and there’s flexible financing options too.",
      sentAt: DateTime.now().subtract(Duration(hours: 21, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Do you know about the investment packages? Some buyers can get discounted rates if they pay early or buy multiple units.",
      sentAt: DateTime.now().subtract(Duration(hours: 21, minutes: 30)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Exactly. Also, cycling paths and pedestrian-friendly streets encourage healthier lifestyles.",
      sentAt: DateTime.now().subtract(Duration(hours: 21, minutes: 50)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Transportation is excellent — right next to the metro and bus routes. Makes commuting to downtown and other areas very convenient.",
      sentAt: DateTime.now().subtract(Duration(hours: 22)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Yes, I love when developers focus on building a lifestyle, not just apartments. It adds value beyond the physical space.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 0, minutes: 30)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "The community itself has annual events and social gatherings. Really adds a sense of belonging to residents.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 0, minutes: 50)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Good point. Proper ventilation and smart thermostats should handle that. Also, tinted windows help reduce heat gain.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 1, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "One thing to consider: some units face west, which can make them hotter in summer. But the AC systems are very efficient.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 1, minutes: 30)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Yes, I saw that. Makes me want to host a small party there already. The skyline at sunset looks incredible from up there.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 1, minutes: 50)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Oh, and the rooftop terrace! Amazing for social events, with 360-degree views and BBQ facilities. Perfect for entertaining.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 10)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "That’s important. High maintenance fees can really offset investment gains if you’re not careful.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 30)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Maintenance fees are reasonable too, considering the amenities provided. Gym, pool, landscaping, and security all included.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 50)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Wow, that’s really next level. Also, smart home integration is included — lights, blinds, and temperature can all be controlled via app.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 3, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Some units even have private elevators. That’s insane. Gives a hotel-like feel when you enter your apartment.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 3, minutes: 30)),
      isMe: false,
    ),
    ChatMessage(
      text: "Definitely. With all the amenities, it’s a strong investment.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 3, minutes: 50)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Do you think these units will appreciate fast? I’m thinking long-term investment.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 4, minutes: 10)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Absolutely. And the bathrooms are all marble, with rain showers and heated floors. Definitely a luxury touch.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 4, minutes: 30)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "I was also impressed by the interior finishes — hardwood floors, high ceilings, and smart lighting systems. Really modern design.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 4, minutes: 50)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Yes! Very inviting for morning jogs or evening walks. Makes the place feel more like a community than just a building.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 5, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "I was also impressed by the landscaping outside? They have a walking path and green spaces along the waterfront.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 5, minutes: 30)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Yes, surprisingly quiet. The building is slightly set back from the main road, and soundproof windows make a huge difference.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 5, minutes: 50)),
      isMe: true,
    ),
    ChatMessage(
      text: "Do you know about noise levels? Waterfront areas can be bustling.",
      sentAt: DateTime.now().subtract(Duration(days: 1, hours: 6)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "That’s a huge advantage. I love the idea of everything being within walking distance, especially groceries and daily essentials.",
      sentAt: DateTime.now().subtract(Duration(days: 2, hours: 1, minutes: 10)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "Another highlight is the gym and spa area. Fully equipped, modern, and with a great view. People are actually buying just for these facilities sometimes.",
      sentAt: DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 50)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "I noticed that as well. Also, parking space is included, which is a big plus in this neighborhood.",
      sentAt: DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 30)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "It’s semi-furnished, mostly kitchen and bathroom essentials. But the living room and bedrooms are empty so buyers can style it themselves.",
      sentAt: DateTime.now().subtract(Duration(days: 2, hours: 3, minutes: 30)),
      isMe: false,
    ),
    ChatMessage(
      text:
          "Wow, does it include the furniture or is it semi-furnished? Because furnishing something like that could be quite expensive.",
      sentAt: DateTime.now().subtract(Duration(days: 2, hours: 3, minutes: 50)),
      isMe: true,
    ),
    ChatMessage(
      text:
          "I also saw a penthouse listing with 5 bedrooms, a private pool, and a terrace. The space is enormous, more than enough for hosting friends and family.",
      sentAt: DateTime.now().subtract(Duration(days: 2, hours: 4)),
      isMe: false,
    ),
    // ...continue reversing the rest similarly
  ];

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
    final items = buildTimelineItems(_messages);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Placeholder'),
        actions: [IconButton(onPressed: () {}, icon: CircleAvatar())],
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
