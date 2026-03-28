import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/buttons/custom_button.dart';
import 'package:homz/core/widgets/shared/call_widget/show_call_bottom_sheet.dart';
import 'package:homz/core/widgets/shared/details_widget/apartment_name_and_sections.dart';
import 'package:homz/core/widgets/shared/details_widget/description_text_with_read_more.dart';
import 'package:homz/core/widgets/shared/details_widget/image_carousel.dart';
import 'package:homz/core/widgets/shared/details_widget/main_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  List<String> imagesPath = [
    'assets/images/res1.png',
    'assets/images/res2.png',
    'assets/images/res3.png',
    'assets/images/res4.png',
    'assets/images/res5.png',
    'assets/images/res6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MainDetailsScreen(
      imagesPath: imagesPath,
      screenNameAppBar: "Appartment Details",
    );
  }
}
