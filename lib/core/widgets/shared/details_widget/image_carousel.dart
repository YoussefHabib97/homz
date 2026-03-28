import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/buttons/rounded_button.dart' show RoundedButton;

class ImageCarousel extends StatefulWidget {
  final List<String> imagesPaths;
  
  const ImageCarousel({super.key, required this.imagesPaths});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        fit: StackFit.expand,
        children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: PageView.builder(
              itemCount: widget.imagesPaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imagesPaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors:[Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 24.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imagesPaths.length, (index) {
                bool isActive = _currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 6.w,
                  width: 6.w,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          Positioned(
            bottom: 16.h,
            right: 16.w,
            child: RoundedButton(backgroundColor: AppColors.primary[500]!, iconPath: kIconSendTo, onPressed: (){}),

          )
        ],
      ),
    );
  }
}