import 'package:flutter/material.dart';
import 'package:homz/features/home/ui/widgets/buttons/rent_buy_button.dart';
import 'package:homz/features/home/ui/widgets/sections/commercial_residential_shops.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RentBuyButton(),
          Expanded(child: CommercialResidentialShops()),
        ],
      ),
    );
  }
}
