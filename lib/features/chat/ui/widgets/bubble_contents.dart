import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/theme/chat_text_theme.dart';

class BubbleContents extends StatelessWidget {
  final String text;
  final String timeLabel;
  final bool showTime;
  final Color timeColor;

  const BubbleContents({
    required this.text,
    required this.timeLabel,
    required this.showTime,
    required this.timeColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: showTime ? 14.h : 0),
          child: Text(text, style: ChatTextStyles.message),
        ),
        if (showTime)
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              timeLabel,
              style: ChatTextStyles.timestamp.copyWith(
                fontSize: 11.w,
                color: timeColor,
              ),
            ),
          ),
      ],
    );
  }
}
