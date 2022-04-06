import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/utils/helper.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/searchBox.dart';
import 'menuScreen.dart';
import 'moreScreen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bg2color,
          leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MoreScreen.routeName);
          },
        ),
        title: Center(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Wamia", style: TextStyle(
                  fontSize: 25,
                  color: AppColor.primary,
                ),
                ),
                TextSpan(text: "Tjik", style: TextStyle(
                  fontSize: 25,
                  color: AppColor.red,
                ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/location.svg"),
                        ),
                        DropdownButtonHideUnderline(
                            child: SizedBox(
                              width: 200,
                              child: DropdownButton(
                                value: "localisation actuelle",
                                items: [
                                  DropdownMenuItem(
                                    child: Text("  Localisation  ", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    value: "localisation actuelle",
                                  ),
                                ],
                                icon: Image.asset("assets/icons/dropdown_filled.png", color: AppColor.red),
                                style: Helper.getTheme(context).headline4,
                                onTap: () {}, onChanged: (String? value) {  },
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                SearchBox(onChanged: (String value) { },),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Restaurants",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(onPressed: () {},
                          child: Text("Voir tout", style: TextStyle(
                              color: AppColor.red),))
                    ],
                  ),
                ),
                SizedBox(height: 5),
                InkWell(
                  onTap: ()
                  {
                    Navigator.of(context).pushReplacementNamed(MenuScreen.routeName);
                  },
                  child: RestaurantCard(
                    image: Image.asset("assets/images/miams-sousse.jpg", fit: BoxFit.cover),
                    name: "Miam's Sousse",
                  ),
                ),
                RestaurantCard(
                    image: Image.asset("assets/images/PLAN-B-1.jpg", fit: BoxFit.cover),
                    name: "Plan B"
                ),
                RestaurantCard(
                    image: Image.asset("assets/images/allo_montreal.jpeg", fit: BoxFit.cover),
                    name: "Allo Montreal"
                ),
                RestaurantCard(
                    image: Image.asset("assets/images/planet_food.jpeg", fit: BoxFit.cover),
                    name: "Planet Food"
                ),

                // RestaurantCard(
                //     image: Image.asset("assets/images/bistro.jpg", fit: BoxFit.cover),
                //     name: "Bistro"
                // ),
                // RestaurantCard(
                //     image: Image.asset("assets/images/Mano drink & food.jpeg", fit: BoxFit.cover),
                //     name: "Mano drink & food"
                // ),
                RestaurantCard(
                    image: Image.asset("assets/images/Cocktail-food.jpg", fit: BoxFit.cover),
                    name: "Cocktail Food"
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Le plus populaire",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Voir tout"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MostPopularCard(
                          name: "Mio Mondo",
                          image: Image.asset("assets/images/dessert3.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        MostPopularCard(
                          name: "Burger by Bella",
                          image: Image.asset("assets/images/hamburger.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        MostPopularCard(
                          image: Image.asset("assets/images/pizza4.jpg",
                            fit: BoxFit.cover,
                          ),
                          name: "Miam's ",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Articles récents",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Voir tout"),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                        },
                        child: RecentItemCard(
                          image: Image.asset("assets/images/pizza4.jpg",
                            fit: BoxFit.cover,
                          ),
                          name: "Pizza ",
                        ),
                      ),
                      RecentItemCard(
                          image: Image.asset("assets/images/tacos.jpeg",
                            fit: BoxFit.cover,
                          ),
                          name: "Tacos"),
                      RecentItemCard(
                          image: Image.asset("assets/images/makloub.jpg",
                            fit: BoxFit.cover,
                          ),
                          name: "Makloub"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class RecentItemCard extends StatelessWidget {
  final String _name;
  final Image _image;

  const RecentItemCard({
    required String name,
    required Image image,
  })  : _name = name,
        _image = image;




  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: _image,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context).headline3,
                ),
                Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Food"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/star_filled.png",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.red,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('Notes')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MostPopularCard extends StatelessWidget {
  final String _name;
  final Image _image;

  const MostPopularCard({
    required String name,
    required Image image,
  })  : _name = name,
        _image = image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 300,
            height: 200,
            child: _image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          _name,
          style: Helper.getTheme(context).headline3,
        ),
        Row(
          children: [
            Text("Café"),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Food"),
            SizedBox(
              width: 20,
            ),
            Image.asset("assets/images/star_filled.png", color: AppColor.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "4.1",
              style: TextStyle(
                color: AppColor.red,
              ),
            )
          ],
        )
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String _name;
  final Image _image;

  const RestaurantCard({
    required String name,
    required Image image,
  })  : _image = image,
        _name = name;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name,
                      style: Helper.getTheme(context).headline3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                    "assets/images/star_filled.png", color: AppColor.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.red,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Notes"),
                    SizedBox(
                      width: 5,
                    ),
                    // Text("Cafe"),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 5.0),
                    //   child: Text(
                    //     ".",
                    //     style: TextStyle(
                    //       color: AppColor.red,
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // Text("Western Food"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}