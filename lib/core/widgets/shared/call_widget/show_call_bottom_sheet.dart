import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:url_launcher/url_launcher.dart';

class CallActionHelper {
  
   /// The function that actually makes the call
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      debugPrint('Could not launch $launchUri');
    }
  }

  static void showCallBottomSheet(BuildContext context, String phoneNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, 
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); 
                  makePhoneCall(phoneNumber); 
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color:  AppColors.grey[700], 
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.phone_outlined, color: Colors.white, size: 24.w),
                      HorizontalGap(12),
                      Text(
                        'Call $phoneNumber',
                        style: context.bodyMedium.copyWith(
                          color: AppColors.primary[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              VerticalGap(12), 
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); 
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: AppColors.grey[700],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style: context.bodyMedium.copyWith(
                          color: AppColors.primary[300],
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}