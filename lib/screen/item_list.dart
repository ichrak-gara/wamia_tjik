import 'package:flutter/material.dart';
import 'package:signin_signup/screen/item_card.dart';

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
            title: 'Nos Pizza',
            svgSrc: 'assets/images/pizza.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Nos Burger',
            svgSrc: 'assets/images/burger.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Nos Plats',
            svgSrc: 'assets/images/repa.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Nos Chicken',
            svgSrc: 'assets/images/chicken.svg',
            press: () {},
          ),
          ItemCard(
            title: 'Nos Salades',
            svgSrc: 'assets/images/salade.svg',
            press: () {},
          ),
        ],
      ),
    );
  }
}
