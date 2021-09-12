import 'package:flutter/material.dart';
import 'package:tasty_burger/constants.dart';
import 'package:tasty_burger/models/burger.dart';
import 'package:tasty_burger/widgets/food_cayegories.dart';
import 'package:tasty_burger/widgets/special_offers.dart';
import 'package:tasty_burger/widgets/top_card_burger.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: kDefaultPadding,
              left: kDefaultPadding,
              bottom: kDefaultPadding,
            ),
            color: kWhiteColor,
            child: FoodCategories(),
          ),
          TopCardBurger(
            title: Burger.burgers[0].name,
            assetName: Burger.burgers[0].assetName,
            price: Burger.burgers[0].price,
            weight: Burger.burgers[0].weight,
            ingredients: Burger.burgers[0].text,
          ),
          SpecialOffers(),
          TopCardBurger(
            title: Burger.burgers[3].name,
            assetName: Burger.burgers[3].assetName,
            price: Burger.burgers[3].price,
            weight: Burger.burgers[3].weight,
            ingredients: Burger.burgers[3].text,
          ),
        ],
      ),
    );
  }
}