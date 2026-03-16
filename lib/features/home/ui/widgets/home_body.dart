import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/features/home/ui/widgets/app_bar_widget.dart';
import 'package:homz/features/home/ui/widgets/commercial_residential_shops.dart';
import 'package:homz/features/home/ui/widgets/rent_buy_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            VerticalGap(29),
            AppBarWidget(),
            VerticalGap(21),
            RentBuyButton(),
            Expanded(child: CommercialResidentialShops()),
          ],
        ),
      ),
    );
  }
}
