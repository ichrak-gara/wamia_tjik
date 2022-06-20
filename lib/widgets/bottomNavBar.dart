import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_signup/const/colors.dart';

import '../screen/cartScreen.dart';
import '../screen/profilScreen.dart';


class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 42,
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColor.bg2color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 20,
            color: Color(0xFF6DAED9).withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            // icon: SvgPicture.asset("assets/icons/home.svg"),
            icon: Icon(Icons.home),
            iconSize: 30,
            color: AppColor.red,
          ),
          IconButton(
            onPressed: () {},
            //icon: SvgPicture.asset("assets/icons/favorite.svg"),
            icon: Icon(Icons.favorite_border),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                  CartScreen.routeName);
            },
            //icon: SvgPicture.asset("assets/icons/panier.svg"),
            icon: Icon(Icons.shopping_cart_outlined),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(ProfilScreen.routeName);
            },
            //icon: SvgPicture.asset("assets/icons/profil.svg"),
            icon: Icon(Icons.person_pin),
            iconSize: 30,
          ),

        ],
      ),
    );
  }
}