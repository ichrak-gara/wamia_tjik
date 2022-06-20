import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/screen/boissonScreen.dart';
import 'package:signin_signup/screen/dessertScreen.dart';
import 'package:signin_signup/screen/productScreen.dart';
import 'package:signin_signup/screen/promotionScreen.dart';
import 'package:signin_signup/screen/restoProfile.dart';
import 'package:signin_signup/utils/helper.dart';

import '../const/colors.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/searchBox.dart';
import 'HomeScreen.dart';
import 'alimentScreen.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menuScreen';

  final restaurant_detail_name;
  final restaurant_detail_image;
  final restaurant_detail_address;

  MenuScreen(
      {this.restaurant_detail_name,
      this.restaurant_detail_image,
      this.restaurant_detail_address});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  get restaurant_detail_name => restaurant_detail_name;
  get restaurant_detail_image => restaurant_detail_image;
  get restaurant_detail_address => restaurant_detail_address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgcolor,
          title: Text(
            "Menu",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Stack(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                  child: SafeArea(
                child: Column(
                  children: [
                    // SearchBox(onChanged: (String value) { },),
                    // Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //     child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "Bienvenue chez  ",
                    //             style: TextStyle(
                    //               fontSize: 25,
                    //               color: AppColor.primary,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             widget.restaurant_detail_name,
                    //             style: TextStyle(
                    //                 fontSize: 25,
                    //                 color: AppColor.red,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             "  :) ",
                    //             style: TextStyle(
                    //                 fontSize: 25,
                    //                 color: AppColor.primary,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ])),
                    SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // GestureDetector(
                            //   onTap: () => Navigator.of(context)
                            //       .push(new MaterialPageRoute(
                            //           builder: (context) => new SellerProfileScreen())),
                            //   child: restaurantCard(
                            //     imageResto: ClipPath(
                            //       clipper: CustomDiamond(),
                            //       child: Container(
                            //         height: 80,
                            //         width: 80,
                            //         child: Image.network(
                            //             widget.restaurant_detail_image),
                            //       ),
                            //     ),
                            //     name: widget.restaurant_detail_name,
                            //     // address: widget.restaurant_detail_address,
                            //   ),
                            // ),

                            //*****  loutani lkol ********
                            SizedBox(height: 150),
                            SizedBox(
                              height: Helper.getScreenHeight(context) * 0.5,
                              width: Helper.getScreenWidth(context),
                              child: Stack(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 100,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                        ),
                                      ),
                                      color: AppColor.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    ProductScreen.routeName);
                                          },
                                          child: MenuCard(
                                            imageShape: ClipPath(
                                              clipper: CustomTriangle(),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                child: Image.asset(
                                                  "assets/images/food.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            name: "Aliments",
                                            count: "100",
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    ProductScreen.routeName);
                                          },
                                          child: MenuCard(
                                            imageShape: ClipPath(
                                              clipper: CustomTriangle(),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                child: Image.asset(
                                                  "assets/images/dessert.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            name: "Desserts",
                                            count: "20",
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    ProductScreen.routeName);
                                          },
                                          child: MenuCard(
                                            imageShape: ClipPath(
                                              clipper: CustomTriangle(),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                child: Image.asset(
                                                  "assets/images/coffee2.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            name: "Boisson",
                                            count: "50",
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    ProductScreen.routeName);
                                          },
                                          child: MenuCard(
                                            imageShape: ClipPath(
                                              clipper: CustomTriangle(),
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                child: Image.asset(
                                                  "assets/images/hamburger3.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            name: "Promotions",
                                            count: "30",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ))),
        ]));
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    required String name,
    required String count,
    required Widget imageShape,
  })  : _name = name,
        _count = count,
        _imageShape = imageShape;

  final String _name;
  final String _count;
  final Widget _imageShape;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: AppColor.bgcolor,
            boxShadow: [
              BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(0, 5),
                  blurRadius: 10)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_name,
                  style: Helper.getTheme(context)
                      .headline3
                      ?.copyWith(color: AppColor.primary)),
              SizedBox(height: 5),
              Text("$_count Éléments")
            ],
          ),
        ),
        SizedBox(
          height: 70,
          child: Align(
            alignment: Alignment.centerLeft,
            child: _imageShape,
          ),
        ),
        SizedBox(
          height: 70,
          child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                width: 40,
                decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: AppColor.bgcolor,
                    shadows: [
                      BoxShadow(
                        color: AppColor.placeholder,
                        offset: Offset(0, 2),
                        blurRadius: 5,
                      )
                    ]),
                child: Icon(Icons.arrow_forward_ios, color: AppColor.red),
              )),
        ),
      ],
    );
  }
}

class restaurantCard extends StatelessWidget {
  final Widget imageResto;
  final String name;

  restaurantCard({
    required this.imageResto,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: AppColor.bgcolor,
            boxShadow: [
              BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(0, 5),
                  blurRadius: 10)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: Helper.getTheme(context)
                      .headline3
                      ?.copyWith(color: AppColor.primary)),
              SizedBox(height: 5),
            ],
          ),
        ),
        SizedBox(
          height: 70,
          child: Align(
            alignment: Alignment.centerLeft,
            child: imageResto,
          ),
        ),
        SizedBox(
          height: 70,
          child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                width: 40,
                decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: AppColor.bgcolor,
                    shadows: [
                      BoxShadow(
                        color: AppColor.placeholder,
                        offset: Offset(0, 2),
                        blurRadius: 5,
                      )
                    ]),
                child: Icon(Icons.arrow_forward_ios, color: AppColor.red),
              )),
        ),
      ],
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomDiamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1000000, size.height * 0.4400000);
    path.quadraticBezierTo(size.width * 0.0243800, size.height * 0.5247000,
        size.width * 0.1000000, size.height * 0.6000000);
    path.quadraticBezierTo(size.width * 0.3550000, size.height * 0.8250000,
        size.width * 0.4400000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.5140600, size.height * 0.9574800,
        size.width * 0.5800000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.8200000, size.height * 0.6450000,
        size.width * 0.9000000, size.height * 0.5600000);
    path.quadraticBezierTo(size.width * 0.9500400, size.height * 0.5009400,
        size.width * 0.9000000, size.height * 0.4200000);
    path.quadraticBezierTo(size.width * 0.6450000, size.height * 0.1800000,
        size.width * 0.5600000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.5029400, size.height * 0.0446800,
        size.width * 0.4200000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.3400000, size.height * 0.1850000,
        size.width * 0.1000000, size.height * 0.4400000);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
