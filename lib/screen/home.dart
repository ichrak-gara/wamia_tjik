import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signin_signup/screen/home_items.dart';
import '../models/item_model.dart';
import '../provider/favorite_provider.dart';
import '../provider/item_provider.dart';
import 'favoriteScreen.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);
    List<ItemModel> itemsList = itemsProvider.models;

    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_add_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Consumer<FavoriteProvider>(
            builder: (_, favorite, ch) => Badge(
              badgeColor: Colors.white,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                favorite.getFavoriteItems.length.toString(),
                style: TextStyle(color: Colors.red),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  //Navigator.of(context).pushNamed(FavoriteScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1 / 0.6,
        children: List.generate(itemsList.length, (index) {
          return ChangeNotifierProvider.value(
            value: itemsList[index],
            child: HomeItems(),
          );
        }),
      ),
    );
  }
}
