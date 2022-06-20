import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/screen/cartScreen.dart';
import 'package:signin_signup/screen/productScreen.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/bottomNavBar.dart';

class IndivItem extends StatefulWidget {
  final product_detail_id;
  final product_detail_name;
  final product_detail_image;
  final product_detail_price;
  final product_detail_description;

  IndivItem({
    required this.product_detail_id,
    required this.product_detail_name,
    required this.product_detail_image,
    required this.product_detail_price,
    required this.product_detail_description,
  });
  static const routeName = '/indivScreen';

  @override
  State<IndivItem> createState() => _IndivItemState();
}

class _IndivItemState extends State<IndivItem> {
  int _counter = 1;
  late int _price_total;

  get productName => product_detail_name;
  get product_detail_id => product_detail_id;
  get product_detail_image => product_detail_image;

  @override
  initState() {
    _price_total = 1;
  }

  void _calculation() {
    setState(
      () {
        _price_total = _counter * int.parse(product_detail_price.text);
      },
    );
    print(_price_total);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  bool _isFavorited = false;

  get product_detail_name => product_detail_name;
  get product_detail_price => product_detail_price;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: Helper.getScreenHeight(context) * 0.5,
                          width: Helper.getScreenWidth(context),
                          child: Image.network(
                            widget.product_detail_image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: Helper.getScreenHeight(context) * 0.5,
                          width: Helper.getScreenWidth(context),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.4],
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        ProductScreen.routeName);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 70),
                                IconButton(
                                    onPressed: _toggleFavorite,
                                    icon: (_isFavorited
                                        ? const Icon(Icons.favorite)
                                        : const Icon(Icons.favorite_border)),
                                    color: AppColor.red),
                                // IconButton(
                                //   icon: Icon(Icons.shopping_cart_outlined,
                                //       color: Colors.white),
                                //   onPressed: () {},
                                // ),
                                Badge(
                                  badgeContent: Text(
                                    '0',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  animationDuration:
                                      Duration(milliseconds: 300),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                CartScreen.routeName);
                                      },
                                      child: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Helper.getScreenHeight(context) * 0.35,
                          ),
                          SizedBox(
                            height: 800,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    height: 700,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            widget.product_detail_name,
                                            style: Helper.getTheme(context)
                                                .headline5,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/star_filled.png",
                                                        color: AppColor.red,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        "assets/images/star_filled.png",
                                                        color: AppColor.red,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        "assets/images/star_filled.png",
                                                        color: AppColor.red,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        "assets/images/star_filled.png",
                                                        color: AppColor.red,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Image.asset(
                                                        "assets/images/star.png",
                                                        color: AppColor.red,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "4 étoiles",
                                                    style: TextStyle(
                                                      color: AppColor.red,
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      widget
                                                          .product_detail_price
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: AppColor.primary,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            "Description",
                                            style: Helper.getTheme(context)
                                                .headline4
                                                ?.copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            widget.product_detail_description,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Divider(
                                            color: AppColor.placeholder,
                                            thickness: 1.5,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 20),
                                        //   child: Text(
                                        //       "Personnalisez votre commande",
                                        //     style: Helper.getTheme(context)
                                        //         .headline4
                                        //         ?.copyWith(
                                        //       fontSize: 16,
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 20),
                                        //   child: Container(
                                        //     height: 50,
                                        //     width: double.infinity,
                                        //     padding: const EdgeInsets.only(
                                        //         left: 30, right: 10),
                                        //     decoration: ShapeDecoration(
                                        //       shape: RoundedRectangleBorder(
                                        //         borderRadius:
                                        //         BorderRadius.circular(5),
                                        //       ),
                                        //       color: AppColor.placeholderBg,
                                        //     ),
                                        //     child: DropdownButtonHideUnderline(
                                        //       child: DropdownButton(
                                        //         hint: Row(
                                        //           children: [
                                        //             Text(
                                        //                 "-Sélectionnez la taille de la portion-"),
                                        //           ],
                                        //         ),
                                        //         value: "default",
                                        //         onChanged: (_) {},
                                        //         items: [
                                        //           DropdownMenuItem(
                                        //             child: Text(
                                        //                 "-Sélectionnez la taille de la portion-"),
                                        //             value: "default",
                                        //           ),
                                        //         ],
                                        //         icon: Image.asset("assets/images/dropdown.png"
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 20),
                                        //   child: Container(
                                        //     height: 50,
                                        //     width: double.infinity,
                                        //     padding: const EdgeInsets.only(
                                        //         left: 30, right: 10),
                                        //     decoration: ShapeDecoration(
                                        //       shape: RoundedRectangleBorder(
                                        //         borderRadius:
                                        //         BorderRadius.circular(5),
                                        //       ),
                                        //       color: AppColor.placeholderBg,
                                        //     ),
                                        //     child: DropdownButtonHideUnderline(
                                        //       child: DropdownButton(
                                        //         hint: Row(
                                        //           children: [
                                        //             Text(
                                        //                 "-Sélectionnez les ingrédients-"),
                                        //           ],
                                        //         ),
                                        //         value: "default",
                                        //         onChanged: (_) {},
                                        //         items: [
                                        //           DropdownMenuItem(
                                        //             child: Text(
                                        //                 "-Sélectionnez les ingrédients-"),
                                        //             value: "default",
                                        //           ),
                                        //         ],
                                        //         icon: Image.asset("assets/images/dropdown.png"
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Nombre de portions",
                                                style: Helper.getTheme(context)
                                                    .headline4
                                                    ?.copyWith(
                                                      fontSize: 16,
                                                    ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    FloatingActionButton(
                                                      onPressed:
                                                          _decrementCounter,
                                                      heroTag: "-",
                                                      child: const Icon(
                                                        Icons.horizontal_rule,
                                                        color: Colors.white,
                                                      ),
                                                      backgroundColor:
                                                          AppColor.red,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 55,
                                                      width: 55,
                                                      decoration:
                                                          ShapeDecoration(
                                                        shape: StadiumBorder(
                                                          side: BorderSide(
                                                              color:
                                                                  AppColor.red),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '$_counter',
                                                            style: TextStyle(
                                                              color:
                                                                  AppColor.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    FloatingActionButton(
                                                      onPressed:
                                                          _incrementCounter,
                                                      heroTag: "+",
                                                      child: const Icon(
                                                          Icons.add,
                                                          color: Colors.white),
                                                      backgroundColor:
                                                          AppColor.red,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        SizedBox(
                                          height: 150,
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 120,
                                                decoration: ShapeDecoration(
                                                  color: AppColor.red,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(40),
                                                      bottomRight:
                                                          Radius.circular(40),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                  ),
                                                  child: Container(
                                                    height: 160,
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 50,
                                                      right: 40,
                                                    ),
                                                    decoration: ShapeDecoration(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      shadows: [
                                                        BoxShadow(
                                                          color: AppColor
                                                              .placeholder
                                                              .withOpacity(0.3),
                                                          offset: Offset(0, 5),
                                                          blurRadius: 5,
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Prix total",
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          widget
                                                              .product_detail_price
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        SizedBox(
                                                          width: 200,
                                                          child: ElevatedButton(
                                                              onPressed: () {},
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Image.asset(
                                                                    "assets/images/add_to_cart.png",
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder: (context) => CartScreen(
                                                                        )),
                                                                      );
                                                                    },
                                                                    // => Navigator.of(context).push(new MaterialPageRoute(
                                                                    //     builder: (context) => new CartScreen())),
                                                                    child: Text(
                                                                      "    Ajouter au panier",
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 20,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shadows: [
                                                        BoxShadow(
                                                          color: AppColor
                                                              .placeholder
                                                              .withOpacity(0.3),
                                                          offset: Offset(0, 5),
                                                          blurRadius: 5,
                                                        ),
                                                      ],
                                                      shape: CircleBorder(),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/cart_filled.png",
                                                      color: AppColor.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    // child: ClipShadow(
                                    //   clipper: CustomTriangle(),
                                    //   boxShadow: [
                                    //     BoxShadow(
                                    //       color: AppColor.placeholder,
                                    //       offset: Offset(0, 5),
                                    //       blurRadius: 5,
                                    //     ),
                                    //   ],
                                    //   child: Container(
                                    //     width: 60,
                                    //     height: 60,
                                    //     color: Colors.white,
                                    //     child: Image.asset("assets/images/fav_filled.png"
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

// class BodyItem extends StatefulWidget {
//   @override
//   State<BodyItem> createState() => _BodyItemState();
// }

// class Product {
//   final product_detail_id;
//   final product_detail_name;
//   final proct_detail_image;
//
//   Product({
//     required this.product_detail_id,
//     required this.product_detail_name,
//     required this.proct_detail_image,
//   });
// }

// class _BodyItemState extends State<BodyItem> {
//   bool _isFavorited = false;
//
//   get product_detail_name => product_detail_name ;
//
//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorited) {
//         _isFavorited = false;
//       } else {
//         _isFavorited = true;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: Helper.getScreenHeight(context) * 0.5,
//                         width: Helper.getScreenWidth(context),
//                         // child: Image.asset(widget.proct_detail_image,
//                         //   fit: BoxFit.cover,
//                         // ),
//                       ),
//                       Container(
//                         height: Helper.getScreenHeight(context) * 0.5,
//                         width: Helper.getScreenWidth(context),
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             stops: [0.0, 0.4],
//                             colors: [
//                               Colors.black.withOpacity(0.9),
//                               Colors.black.withOpacity(0.0),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SafeArea(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).pushReplacementNamed(ProductScreen.routeName);
//                                 },
//                                 child: Icon(
//                                   Icons.arrow_back_ios_rounded,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Image.asset("assets/images/cart_white.png"),
//                               // _AddButton()
//                               IconButton(
//                                   onPressed: _toggleFavorite,
//                                   icon: (_isFavorited
//                                       ? const Icon(Icons.favorite)
//                                       : const Icon(Icons.favorite_border)),
//                                   color: AppColor.red),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Helper.getScreenHeight(context) * 0.35,
//                         ),
//                         SizedBox(
//                           height: 800,
//                           width: double.infinity,
//                           child: Stack(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 30.0),
//                                 child: Container(
//                                   height: 700,
//                                   width: double.infinity,
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 30),
//                                   decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(40),
//                                         topRight: Radius.circular(40),
//                                       ),
//                                     ),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Text('Name: $product_detail_name',
//                                           style: Helper.getTheme(context)
//                                               .headline5,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/images/star_filled.png",
//                                                       color: AppColor.red,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     Image.asset(
//                                                       "assets/images/star_filled.png",
//                                                       color: AppColor.red,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     Image.asset(
//                                                       "assets/images/star_filled.png",
//                                                       color: AppColor.red,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     Image.asset(
//                                                       "assets/images/star_filled.png",
//                                                       color: AppColor.red,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                     Image.asset(
//                                                       "assets/images/star.png",
//                                                       color: AppColor.red,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 8,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                                 Text(
//                                                   "4 étoiles",
//                                                   style: TextStyle(
//                                                     color: AppColor.red,
//                                                     fontSize: 12,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             Expanded(
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   SizedBox(
//                                                     height: 20,
//                                                   ),
//                                                   Text(
//                                                     "20.000 dt",
//                                                     style: TextStyle(
//                                                       color: AppColor.primary,
//                                                       fontSize: 30,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                     ),
//                                                   ),
//                                                   Text("/par postion")
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Text(
//                                           "Description",
//                                           style: Helper.getTheme(context)
//                                               .headline4
//                                               ?.copyWith(
//                                                 fontSize: 16,
//                                               ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Text(
//                                           "La pizza quatre saisonsest une variété de pizza préparée en quatre portions comportant des ingrédients différents, chaque portion représentant une saison de l'année. Très populaire en Italie, il s'agit d'un « classique ».",
//                                           style: TextStyle(
//                                               fontSize: 17,
//                                               color: Colors.black),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Divider(
//                                           color: AppColor.placeholder,
//                                           thickness: 1.5,
//                                         ),
//                                       ),
//                                       // SizedBox(
//                                       //   height: 10,
//                                       // ),
//                                       // Padding(
//                                       //   padding: const EdgeInsets.symmetric(
//                                       //       horizontal: 20),
//                                       //   child: Text(
//                                       //       "Personnalisez votre commande",
//                                       //     style: Helper.getTheme(context)
//                                       //         .headline4
//                                       //         ?.copyWith(
//                                       //       fontSize: 16,
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                       // SizedBox(
//                                       //   height: 10,
//                                       // ),
//                                       // Padding(
//                                       //   padding: const EdgeInsets.symmetric(
//                                       //       horizontal: 20),
//                                       //   child: Container(
//                                       //     height: 50,
//                                       //     width: double.infinity,
//                                       //     padding: const EdgeInsets.only(
//                                       //         left: 30, right: 10),
//                                       //     decoration: ShapeDecoration(
//                                       //       shape: RoundedRectangleBorder(
//                                       //         borderRadius:
//                                       //         BorderRadius.circular(5),
//                                       //       ),
//                                       //       color: AppColor.placeholderBg,
//                                       //     ),
//                                       //     child: DropdownButtonHideUnderline(
//                                       //       child: DropdownButton(
//                                       //         hint: Row(
//                                       //           children: [
//                                       //             Text(
//                                       //                 "-Sélectionnez la taille de la portion-"),
//                                       //           ],
//                                       //         ),
//                                       //         value: "default",
//                                       //         onChanged: (_) {},
//                                       //         items: [
//                                       //           DropdownMenuItem(
//                                       //             child: Text(
//                                       //                 "-Sélectionnez la taille de la portion-"),
//                                       //             value: "default",
//                                       //           ),
//                                       //         ],
//                                       //         icon: Image.asset("assets/images/dropdown.png"
//                                       //         ),
//                                       //       ),
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                       // SizedBox(
//                                       //   height: 5,
//                                       // ),
//                                       // Padding(
//                                       //   padding: const EdgeInsets.symmetric(
//                                       //       horizontal: 20),
//                                       //   child: Container(
//                                       //     height: 50,
//                                       //     width: double.infinity,
//                                       //     padding: const EdgeInsets.only(
//                                       //         left: 30, right: 10),
//                                       //     decoration: ShapeDecoration(
//                                       //       shape: RoundedRectangleBorder(
//                                       //         borderRadius:
//                                       //         BorderRadius.circular(5),
//                                       //       ),
//                                       //       color: AppColor.placeholderBg,
//                                       //     ),
//                                       //     child: DropdownButtonHideUnderline(
//                                       //       child: DropdownButton(
//                                       //         hint: Row(
//                                       //           children: [
//                                       //             Text(
//                                       //                 "-Sélectionnez les ingrédients-"),
//                                       //           ],
//                                       //         ),
//                                       //         value: "default",
//                                       //         onChanged: (_) {},
//                                       //         items: [
//                                       //           DropdownMenuItem(
//                                       //             child: Text(
//                                       //                 "-Sélectionnez les ingrédients-"),
//                                       //             value: "default",
//                                       //           ),
//                                       //         ],
//                                       //         icon: Image.asset("assets/images/dropdown.png"
//                                       //         ),
//                                       //       ),
//                                       //     ),
//                                       //   ),
//                                       // ),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               "Nombre de portions",
//                                               style: Helper.getTheme(context)
//                                                   .headline4
//                                                   ?.copyWith(
//                                                     fontSize: 16,
//                                                   ),
//                                             ),
//                                             Expanded(
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   ElevatedButton(
//                                                     style: ButtonStyle(
//                                                         elevation:
//                                                             MaterialStateProperty
//                                                                 .all(5.0)),
//                                                     onPressed: () {},
//                                                     child: Text("-"),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Container(
//                                                     height: 35,
//                                                     width: 55,
//                                                     decoration: ShapeDecoration(
//                                                       shape: StadiumBorder(
//                                                         side: BorderSide(
//                                                             color:
//                                                                 AppColor.red),
//                                                       ),
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Text(
//                                                           "2",
//                                                           style: TextStyle(
//                                                             color: AppColor.red,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   ElevatedButton(
//                                                     style: ButtonStyle(
//                                                         elevation:
//                                                             MaterialStateProperty
//                                                                 .all(5.0)),
//                                                     onPressed: () {},
//                                                     child: Text("+"),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(height: 40),
//                                       SizedBox(
//                                         height: 150,
//                                         width: double.infinity,
//                                         child: Stack(
//                                           children: [
//                                             Container(
//                                               width: 120,
//                                               decoration: ShapeDecoration(
//                                                 color: AppColor.red,
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.only(
//                                                     topRight:
//                                                         Radius.circular(40),
//                                                     bottomRight:
//                                                         Radius.circular(40),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Align(
//                                               alignment: Alignment.centerRight,
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                   horizontal: 20,
//                                                 ),
//                                                 child: Container(
//                                                   height: 160,
//                                                   width: double.infinity,
//                                                   margin: const EdgeInsets.only(
//                                                     left: 50,
//                                                     right: 40,
//                                                   ),
//                                                   decoration: ShapeDecoration(
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                         topLeft:
//                                                             Radius.circular(40),
//                                                         bottomLeft:
//                                                             Radius.circular(40),
//                                                         topRight:
//                                                             Radius.circular(10),
//                                                         bottomRight:
//                                                             Radius.circular(10),
//                                                       ),
//                                                     ),
//                                                     shadows: [
//                                                       BoxShadow(
//                                                         color: AppColor
//                                                             .placeholder
//                                                             .withOpacity(0.3),
//                                                         offset: Offset(0, 5),
//                                                         blurRadius: 5,
//                                                       ),
//                                                     ],
//                                                     color: Colors.white,
//                                                   ),
//                                                   child: Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Text(
//                                                         "Prix total",
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Text(
//                                                         "40.000",
//                                                         style: TextStyle(
//                                                           color:
//                                                               AppColor.primary,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                       SizedBox(height: 10),
//                                                       SizedBox(
//                                                         width: 200,
//                                                         child: ElevatedButton(
//                                                             onPressed: () {},
//                                                             child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: [
//                                                                 Image.asset(
//                                                                   "assets/images/add_to_cart.png",
//                                                                   color: Colors
//                                                                       .white,
//                                                                 ),
//                                                                 Text(
//                                                                   "    Ajouter au panier",
//                                                                 )
//                                                               ],
//                                                             )),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                 right: 20,
//                                               ),
//                                               child: Align(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 child: Container(
//                                                   width: 60,
//                                                   height: 60,
//                                                   decoration: ShapeDecoration(
//                                                     color: Colors.white,
//                                                     shadows: [
//                                                       BoxShadow(
//                                                         color: AppColor
//                                                             .placeholder
//                                                             .withOpacity(0.3),
//                                                         offset: Offset(0, 5),
//                                                         blurRadius: 5,
//                                                       ),
//                                                     ],
//                                                     shape: CircleBorder(),
//                                                   ),
//                                                   child: Image.asset(
//                                                     "assets/images/cart_filled.png",
//                                                     color: AppColor.red,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                   right: 20,
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment.topRight,
//                                   // child: ClipShadow(
//                                   //   clipper: CustomTriangle(),
//                                   //   boxShadow: [
//                                   //     BoxShadow(
//                                   //       color: AppColor.placeholder,
//                                   //       offset: Offset(0, 5),
//                                   //       blurRadius: 5,
//                                   //     ),
//                                   //   ],
//                                   //   child: Container(
//                                   //     width: 60,
//                                   //     height: 60,
//                                   //     color: Colors.white,
//                                   //     child: Image.asset("assets/images/fav_filled.png"
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

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
