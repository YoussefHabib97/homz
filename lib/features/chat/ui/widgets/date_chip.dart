import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/theme/chat_text_theme.dart';

class DateChip extends StatelessWidget {
  final String label;
  const DateChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppExtraColors.chatDateCardColor.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(999),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
            child: Text(
              label,
              style: ChatTextStyles.timestamp.copyWith(
                letterSpacing: 0.6,
                color: AppColors.grey[100],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
