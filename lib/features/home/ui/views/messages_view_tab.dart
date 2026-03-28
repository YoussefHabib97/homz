import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/layout/default_app_padding.dart';
import 'package:homz/core/shared/layout/sticky_header_delegate.dart';
import 'package:homz/core/shared/widgets/text_fields/custom_text_form_field.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';

class MessagesViewTab extends StatelessWidget {
  const MessagesViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
            vertical: kPaddingVertical,
          ),
          sliver: SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeaderDelegate(
              child: CustomTextFormField.search(
                controller: TextEditingController(),
              ),
              height: kToolbarHeight,
            ),
          ),
        ),
        SliverList.separated(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Ink(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kViewChat);
                },
                child: DefaultPadding(
                  child: Row(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(radius: 32),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name placeholder",
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Message subtitle placeholder",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("09:00 AM"),
                          CircleAvatar(radius: 16, child: Text("1")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return DefaultPadding(
              verticalOffset: 0,
              child: Divider(color: AppColors.grey[700]),
            );
          },
        ),
      ],
    );

    //? Implement Condition Builder later on
    // return UnpopulatedNavTabBody(
    //   imagePath: kImageMessagesInboxIllustration,
    //   title: "Inbox empty",
    //   subtitle:
    //       "You have no messages yet.\nBe the first to start a conversation",
    // );
  }
}
