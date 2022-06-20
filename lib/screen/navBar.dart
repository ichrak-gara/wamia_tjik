import 'package:flutter/material.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/screen/loginScreen.dart';
import 'package:signin_signup/screen/cartScreen.dart';

import 'landingScreen.dart';

class NavBar extends StatelessWidget {
  static const routeName = "/navbarScreen";
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Ichrak Gara"),
            accountEmail: Text("ichrakgara3012@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/user.jpg",
                    width: 90, height: 90, fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
              color: AppColor.bgcolor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Empacement'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('panier'),
            onTap: ()  => Navigator.of(context).pop(null),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoris'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard_outlined),
            title: Text('Commandes'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Factures'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delivery_dining ),
            title: Text('livraison'),
            onTap: () {},
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('informations'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('paramètre'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Déconnexion'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
