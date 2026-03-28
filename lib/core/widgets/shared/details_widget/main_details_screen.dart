import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/buttons/custom_button.dart';
import 'package:homz/core/widgets/shared/call_widget/show_call_bottom_sheet.dart';
import 'package:homz/core/widgets/shared/details_widget/apartment_name_and_sections.dart';
import 'package:homz/core/widgets/shared/details_widget/description_text_with_read_more.dart';
import 'package:homz/core/widgets/shared/details_widget/image_carousel.dart';

class MainDetailsScreen extends StatelessWidget {
  final List<String> imagesPath;
  final String screenNameAppBar;
  const MainDetailsScreen({
    super.key,
    required this.imagesPath,
    required this.screenNameAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey[300],
      appBar: AppBar(
        backgroundColor: AppColors.grey[300],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.w),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          screenNameAppBar,
          style: context.headlineSmall.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Gap(70),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  topRight: Radius.circular(14.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duplex',
                          style: context.bodyMedium.copyWith(
                            color: AppColors.grey[50],
                          ),
                        ),
                        Text(
                          '\$1000,000',
                          style: context.bodyMedium.copyWith(
                            color: AppColors.grey[50],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Gap(18),
                    ImageCarousel(imagesPaths: imagesPath),
                    Gap(16),
                    ApartmentNameAndSections(),
                    Gap(27),
                    DescriptionTextWithReadMore(),
                    Gap(19),
                    //Call And Message Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Call",
                            onPressed: () {
                              CallActionHelper.showCallBottomSheet(
                                context,
                                "+201140353076",
                              );
                            },
                          ),
                        ),
                        Gap(25),
                        Expanded(
                          child: CustomButton(
                            text: "Message",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
