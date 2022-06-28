import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/page_provider.dart';
import '../screen/HomeScreen.dart';
import '../screen/basket.dart';
import '../screen/favoriteScreen.dart';
import '../screen/landingScreen.dart';
import '../screen/profilScreen.dart';
import '../screen/search.dart';
import 'base.dart';
import 'bottomNavBar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, PageProvider page, child) {
      return Base(
        child: Stack(
          children: [
            pages[page.p],
            BottomNavBar(),
          ],
        ),
      );
    });
  }

  void initState() {
    checkIfLoggedIn();
    super.initState();
  }

  Future<void> checkIfLoggedIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth_token = prefs.getString('auth_token');
    if (auth_token == null) {
      setState(() {
        pages[4] = LandingScreen();
      });
    }
  }

  var id;
  var description;
  var name;
  var price;
  var last;
  var piece;
  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    Basket(),
    FavoriteScreen(),
    ProfilScreen(),

  ];
}
