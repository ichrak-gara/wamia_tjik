import 'package:flutter/material.dart';
import 'package:food_mapping/constants.dart';

import 'item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          ItemCard(
            title: 'Pizza',
            svgSrc: 'assets/images/pizza.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Burger',
            svgSrc: 'assets/images/burger.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Chicken',
            svgSrc: 'assets/images/chicken.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Meal',
            svgSrc: 'assets/images/repa.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Sweet',
            svgSrc: 'assets/images/sweet.svg',
            press: () {},
          ),
        ],
      ),
    );
  }
}
