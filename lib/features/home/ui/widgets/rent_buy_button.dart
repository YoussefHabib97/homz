import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

class RentBuyButton extends StatefulWidget {
  const RentBuyButton({super.key});

  @override
  State<RentBuyButton> createState() => _RentBuyButtonState();
}

class _RentBuyButtonState extends State<RentBuyButton> {
  // true = Rent, false = Buy
  bool isRentSelected = true; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 219.w, 
      height: 43.h, 
      padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h), 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grey[400]!,
          width: 1,
        ),
      ),
      child: Row(
        children:[
          // --- RENT BUTTON ---
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isRentSelected = true;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isRentSelected ? AppColors.primary[500] : Colors.transparent,
                 borderRadius: BorderRadius.circular(12), // Inner rounded corners
                ),
                alignment: Alignment.center,
                child:  Text(
                  'Rent',
                  style: context.bodyMedium.copyWith(color: AppColors.grey[50]),
                ),
              ),
            ),
          ),
          
          // --- BUY BUTTON ---
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isRentSelected = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: !isRentSelected ? AppColors.primary[500] : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child:  Text(
                  'Buy',
                  style: context.bodyMedium.copyWith(color: AppColors.grey[50]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}