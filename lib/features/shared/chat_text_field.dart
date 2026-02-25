import 'package:flutter/material.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onAttach;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onAttach,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: const Icon(Icons.attach_file), onPressed: onAttach),
        Expanded(
          child: BaseTextFormField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Message'),
          ),
        ),
        IconButton(icon: const Icon(Icons.send), onPressed: onSend),
      ],
    );
  }
}
