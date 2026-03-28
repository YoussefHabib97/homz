import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/buttons/rounded_button.dart';
import 'package:homz/core/widgets/shared/details_widget/section_item.dart';

class ApartmentNameAndSections extends StatelessWidget {
  const ApartmentNameAndSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Cilinial Nissano',
                    style: context.bodyMedium.copyWith(
                      color: AppColors.grey[50],
                    ),
                  ),
                  Spacer(),
                  RoundedButton(
                    backgroundColor: Colors.transparent,
                    iconPath: kIconHeart,
                    iconColor: AppColors.grey[50],
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                '450 Elm Avenue, Nissano, NY 105',
                style: context.bodySmall.copyWith(color: AppColors.grey[400]),
              ),
              VerticalGap(16),
             Row(

              children: [
              SectionItem(iconPath: kIconBath, label: '4 Bath'),
              SectionItem(iconPath: kIconBedroom, label: '6 Beds'),
              SectionItem(iconPath: kIconRoomSize, label: '550m'),
              ],
             ),
            ],
          ),
        ),
      ],
    );
  }
}
