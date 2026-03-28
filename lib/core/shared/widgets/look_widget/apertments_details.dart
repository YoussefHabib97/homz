import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/shared/widgets/buttons/rounded_button.dart';
import 'package:homz/core/shared/widgets/look_widget/row_labeled_shared_look_icons.dart';
import 'package:homz/core/theme/app_colors.dart';

class ApertmentsDetails extends StatelessWidget {
  const ApertmentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Araay\nApertments',
                  style: context.headlineMedium.copyWith(
                    color: AppColors.grey[50],
                  ),
                ),
                Text(
                  '\$10000,500',
                  style: context.headlineSmall.copyWith(
                    color: AppColors.grey[50],
                    height: 1.5.h,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RoundedButton(
                  backgroundColor: AppColors.primary[500]!,
                  iconPath: kIconSendTo,
                  onPressed: () {},
                ),
                Gap(8),
                RoundedButton(
                  backgroundColor: AppColors.primary[500]!,
                  iconPath: kIconCall,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        Gap(20),
        RowLabeledSharedLookIcons(),
      ],
    );
  }
}
