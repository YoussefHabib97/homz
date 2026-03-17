import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/features/home/ui/widgets/build_carousel_slider.dart';

class CommercialResidentialShops extends StatefulWidget {
  const CommercialResidentialShops({super.key});

  @override
  State<CommercialResidentialShops> createState() =>
      _CommercialResidentialShopsState();
}

class _CommercialResidentialShopsState
    extends State<CommercialResidentialShops> {
  // 0 = Commercial, 1 = Residential, 2 = Shops
  int _selectedIndex = 1;
  final List<String> _categories = ['Commercial', 'Residential', 'Shops'];

  // Sample image lists for each category
  final List<List<String>> _categoryImages = [
    [
      'assets/images/commercial1.png',
      'assets/images/commercial2.png',
      'assets/images/commercial3.png',
    ],
    [
      'assets/images/residential1.png',
      'assets/images/residential2.png',
      'assets/images/residential3.png',
    ],
    [
      'assets/images/shop1.png',
      'assets/images/shop2.png',
      'assets/images/shop3.png',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: IndexedStack(
              index: _selectedIndex,
              children: List.generate(_categoryImages.length, (index) {
                return BuildCarouselSlider(imagePaths: _categoryImages[index]);
              }),
            ),
          ),
        ),
        VerticalGap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_categories.length, (index) {
              bool isActive = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  child: Text(
                    _categories[index],
                    style: context.bodyMedium.copyWith(
                      color: isActive
                          ? AppColors.grey[50]
                          : AppColors.grey[400],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        VerticalGap(48),
      ],
    );
  }
}
