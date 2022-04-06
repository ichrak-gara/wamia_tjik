import 'package:flutter/material.dart';
import 'package:signin_signup/screen/menuScreen.dart';
import 'package:signin_signup/widgets/searchBox.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class PromotionScreen extends StatelessWidget {
  static const routeName ='/promotionScreen';

  const PromotionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgcolor,
        title: Text("Promotions", style: TextStyle(color: Colors.black, fontSize: 18),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MenuScreen.routeName);
          },
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBox(onChanged: (String value) { },),
                  SizedBox(
                    height: 15,
                  ),
                  DessertCard(
                    image: Image.asset("assets/images/apple_pie.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "French Apple Pie",
                    shop: "Minute by tuk tuk",
                    rating: "4.9",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DessertCard(
                    image: Image.asset("assets/images/dessert2.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "Dark Chocolate Cake",
                    shop: "Cakes by Tella",
                    rating: "4.7",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DessertCard(
                    image: Image.asset("assets/images/dessert4.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "Street Shake",
                    shop: "Cafe Racer",
                    rating: "4.9",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DessertCard(
                    image: Image.asset("assets/images/dessert5.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "Fudgy Chewy Brownies",
                    shop: "Minute by tuk tuk",
                    rating: "4.9",
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DessertCard extends StatelessWidget {

  final String _name;
  final String _rating;
  final String _shop;
  final Image _image;

  const DessertCard({
    required String name,
    required String rating,
    required String shop,
    required Image image,
  })  : _name = name,
        _rating = rating,
        _shop = shop,
        _image = image;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: _image,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: Helper.getTheme(context).headline4?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/star_filled.png"
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _rating,
                        style: TextStyle(color: AppColor.red),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _shop,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          ".",
                          style: TextStyle(color: AppColor.red),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Desserts",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}