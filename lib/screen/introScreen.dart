import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/utils/helper.dart';

import 'HomeScreen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  late int count;
  static List<Map<String, String>> _pages = [
    {
      "image": "assets/images/vector1.png",
      "title": "Find Food You Love",
      "desc":
      "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    },
    {
      "image": "assets/images/vector2.png",
      "title": "Fast Delivery",
      "desc": "Fast food delivery to your home, office wherever you are"
    },
    {
      "image": "assets/images/vector3.png",
      "title": "Live Tracking",
      "desc":
      "Real time tracking of your food on the app once you placed the order"
    },
  ];


  void initState(){
    _controller = new PageController();
    count=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  height: 500,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                      onPageChanged: (value){
                      setState(() {
                        count = value;
                      });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset("assets/images/vector1.png");
                      },
                    itemCount: _pages.length,
                  ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 5, backgroundColor: count ==0? AppColor.red : AppColor.placeholder),
                    SizedBox(width: 5),
                    CircleAvatar(radius: 5, backgroundColor: count ==1? AppColor.red : AppColor.placeholder),
                    SizedBox(width: 5),
                    CircleAvatar(radius: 5, backgroundColor: count ==2? AppColor.red : AppColor.placeholder),
                    SizedBox(width: 5),
                  ],
                ),
                SizedBox(height: 20),
                Text("Find Food You Love",
                  style: Helper.getTheme(context).headline5,
                ),
                SizedBox(height: 20),
                Text("Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",

                textAlign: TextAlign.center,
                ),
                SizedBox(height: 90),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

                    },
                    child: Text("Next"),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

