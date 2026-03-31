import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/layout/default_app_padding.dart';
import 'package:homz/core/shared/widgets/buttons/custom_button.dart';
import 'package:homz/core/shared/widgets/default_app_bar.dart';
import 'package:homz/core/shared/widgets/text_fields/custom_text_form_field.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: DefaultPadding(
          child: CustomButton.delete(text: "Delete Account", onPressed: () {}),
        ),
      ),
      appBar: DefaultAppBar(title: Text("Account Details")),
      body: DefaultPadding(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Ink(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(128),
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 80,
                          foregroundImage: AssetImage(
                            kImageMessagesInboxIllustration,
                          ),
                        ),
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        // TODO: Implement change profile pic logic
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
                CustomTextFormField.name(controller: TextEditingController()),
                CustomTextFormField.phone(controller: TextEditingController()),
                CustomButton.primary(text: "Save", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
