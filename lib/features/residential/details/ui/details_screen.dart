import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/features/residential/details/ui/widgets/image_carousel.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  final List<String> imagesPath = [
    'assets/images/res1.png',
    'assets/images/res2.png',
    'assets/images/res3.png',
    'assets/images/res4.png',
    'assets/images/res5.png',
    'assets/images/res6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColors.grey[200],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.w),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          'Apartment Details',
          style: context.headlineSmall.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          VerticalGap(36),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
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
                  VerticalGap(18),
                  ImageCarousel(imagesPaths: imagesPath),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
