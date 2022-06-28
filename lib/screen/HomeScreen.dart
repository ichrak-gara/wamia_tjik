import 'dart:math';
import 'package:select_form_field/select_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/screen/restoProfile.dart';
import 'package:signin_signup/screen/shop.dart';
import 'package:signin_signup/utils/helper.dart';
import '../core/init/metrics.dart';
import '../location_controller.dart';
import '../main.dart';

import '../utils/navigate.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/searchBox.dart';
import 'map_screen.dart';
import 'menuScreen.dart';
import 'navBar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: AppColor.bg2color,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "Wamia",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.primary,
                  ),
                ),
                TextSpan(
                  text: "Tjik",
                  style: TextStyle(
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
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List data = [
    {
      "title": "Profiter ",
      "url": "assets/images/p2.jpg"
      // "https://cdn.pixabay.com/photo/2020/11/08/09/41/deer-5723225_960_720.jpg"
    },
    {
      "title": "Profiter",
      "url": "assets/images/p1.jpg"
      //"https://cdn.pixabay.com/photo/2020/11/01/19/41/autumn-5704791_960_720.jpg"
    },
    {
      "title": "Profiter",
      "url": "assets/images/p3.jpg"
      //"https://cdn.pixabay.com/photo/2020/04/11/14/55/houses-5030731_960_720.jpg"
    },
    {
      "title": "Profiter",
      "url": "assets/images/p5.jpg"
      //"https://cdn.pixabay.com/photo/2020/11/16/16/05/hoverfly-5749361_960_720.jpg"
    },
    {
      "title": "Profiter",
      "url": "assets/images/p4.jpeg"
      //"https://cdn.pixabay.com/photo/2020/04/19/12/26/thread-5063401_960_720.jpg"
    },
  ];

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Sousse',
      'label': 'Sousse',
    },
    {
      'value': 'Monastir',
      'label': 'Monastir',
    },
    {
      'value': 'Tunis',
      'label': 'Tunis',
    },
    {
      'value': 'Sfax',
      'label': 'Sfax',
    },
    {
      'value': 'Kairouan',
      'label': 'Kairouan',
    },
    {
      'value': 'Gabes',
      'label': 'Gabes',
    },
    {
      'value': 'Hammamet',
      'label': 'Hammamet',
    },
    {
      'value': 'Nabeul',
      'label': 'Nabeul',
    },
    {
      'value': 'Mahdia',
      'label': 'Mahdia',
    },
    {
      'value': 'All',
      'label': 'All',
    },
  ];

  String city = 'All';
  save(String val) {
    setState(() {
      city = val;
    });
  }

  Future<dynamic> fetchContacts() async {
    final session = await orpc.authenticate(
        'test',
        'ichrakgara3012@gmail.com',
        'ichrak3012'
    );
    return orpc.callKw({
      'model': 'res.partner',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          'id',
          'name',
          'email',
          '__last_update',
          'image_128',
          'seller',
          'street',
          'phone',
          'mobile',
        ],
        'limit': 80,
      }
    });
  }

  Widget buildListItemA(Map<String, dynamic> record) {
    var unique = record['__last_update'] as String;
    unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
    final avatarUrl =
        '${orpc.baseURL}/web/image?model=res.partner&field=image&id=${record["id"]}&unique=$unique';

    var restaurant_name = record['name'];
    var restaurant_image = avatarUrl;
    var restaurant_email = record['email'];
    var restaurant_address = record['street'];
    var restaurant_phone = record['phone'];

    return TextButton(
      onPressed: () {
        session.set('seller_id', record["id"]);
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new SellerProfileScreen(
              resto_name: restaurant_name,
              resto_image: restaurant_image,
              resto_email: restaurant_email ,
              resto_address: restaurant_address,
              resto_phone: restaurant_phone,
            )));
      },
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
                height: 230,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(avatarUrl, fit: BoxFit.cover),
                )),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        record['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        record['email'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColor.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<dynamic> fetchShops() async {
    final session = await orpc.authenticate(
        'test',
        'ichrakgara3012@gmail.com',
        'ichrak3012'
    );
    return orpc.callKw({
      'model': 'seller.shop',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          'id',
          'name',
          'email',
          'city',
          'phone',
          'street',
          'seller_product_ids',
          'shop_logo',
          'shop_banner',
          '__last_update',
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItem(Map<String, dynamic> record) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 230,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Image(
                  image: NetworkImage(
                      '${orpc.baseURL}/web/image?model=seller.shop&id=${record['id'].toString()}&field=shop_logo&unique=${record['__last_update'].toString()}'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      record['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      record['email'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColor.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> fetchCategories() async {
    return orpc.callKw({
      'model': 'product.public.category',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          'id',
          'name',
          'image_medium',
          'sequence',
          '__last_update',
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItems(Map<String, dynamic> record) {
    return Column(children: <Widget>[
      ClipRRect(
        child: Container(
          margin: EdgeInsets.only(left:20, right: 15, top: 1 ,bottom: 25),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,4),
                blurRadius: 15,
                color: Color(0xFFB0CCE1).withOpacity(0.32),
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: <Widget>[
                  Image(
                      image: NetworkImage(
                          '${orpc.baseURL}/web/image?model=product.public.category&id=${record['id'].toString()}&field=image_medium&unique=${record['__last_update'].toString()}'),
                      fit: BoxFit.cover,
                      color: Colors.white.withOpacity(1.0),
                      colorBlendMode: BlendMode.modulate),
                  SizedBox(height: 8),
                  Text(
                    "${record['name']}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10),
                ],),
              ),
            ),
          ),
        ),
      )
      //*****

    ]);
  }



  Future<dynamic> fetchDeals() async {
    return orpc.callKw({
      'model': 'website.deals',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          'id',
          'name',
          'title',
          'pricelist_items',
          'banner',
          'pricelist_items',
          'shop_banner',
          '__last_update',
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItemd(Map<String, dynamic> record) {
    var unique = record['__last_update'] as String;
    unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
    final avatarUrl =
        '${orpc.baseURL}/web/image?model=website.deals&field=banner&id=${record["id"]}&unique=$unique';
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(12.0),
      ),
      child: Image.network(
        avatarUrl,
        fit: BoxFit.fill,
        width: 500,
      ),
    );
  }

  Future<dynamic> fetchProducts() async {
    return orpc.callKw({
      'model': 'product.template',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          'id',
          'name',
          'publis_categ_ids',
          'lst_price',
          'marketplace_seller_id',
          'image',
          'description_sale',
          '__last_update',
          'create_date',
          'product_image_ids',
          'optional_product_ids'
        ],
        'limit': 80,
      },
    });
  }

  Widget buildList(Map<String, dynamic> record) {
    return Column(children: <Widget>[
      Container(
          width: 150,
          height: 150,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Image(
                    image: NetworkImage(
                        '${orpc.baseURL}/web/image?model=product.template&id=${record['id'].toString()}&field=image&unique=${record['__last_update'].toString()}'),
                    fit: BoxFit.fill,
                    color: Colors.white.withOpacity(1.0),
                    colorBlendMode: BlendMode.modulate),
                Center(
                    child: Text(
                      "${record['name']}",
                      textAlign: TextAlign.center,
                    )),
              ])))
    ]);
  }



  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: 2000),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                color: AppColor.red,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 10,),
                            DropdownButtonHideUnderline(
                                child: SizedBox(
                              width: 250,
                              child: SelectFormField(
                                dialogTitle: "Votre localisation actuelle",
                                type: SelectFormFieldType.dialog, // or can be dialog
                                initialValue: 'All',
                                decoration: InputDecoration(
                                  labelText: 'Votre Localisation',
                                  labelStyle: TextStyle(
                                    fontSize: 27,
                                  ),
                                ),

                                items: _items,
                                onChanged: (val) => save(val),

                              ),
                            ),

                            ),
                            Icon(Icons.arrow_drop_down,
                                color: AppColor.red),
                            //style: Helper.getTheme(context).headline4,

                          ],
                        ),


                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //         IconButton(
                        //           onPressed: () {},
                        //           icon: Icon(
                        //             Icons.location_on,
                        //             color: AppColor.red,
                        //           ),
                        //         ),
                        //     horizontalpadding(
                        //       context,
                        //       child: Text(
                        //         "Votre localisation:",
                        //       ),
                        //     ),
                        //     horizontalpadding(context,
                        //         child: Container(
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(15.0),
                        //             ),
                        //             width: 150,
                        //             height: 60,
                        //             child: SelectFormField(
                        //               dialogTitle: 'Localisation',
                        //               //style: label(context, textPrimary(context)),
                        //               type: SelectFormFieldType.dialog, // or can be dialog
                        //               initialValue: 'All',
                        //               labelText: 'Localisation**',
                        //               items: _items,
                        //               onChanged: (val) => save(val),
                        //               //onSaved: (val) => save(val),
                        //             )))
                        //   ],
                        // ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    SearchBox(
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 20),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 400),
                        height: 200,
                      ),
                      items: data.map((item) {
                        return GridTile(
                          child: Image.network(item["url"], fit: BoxFit.cover),
                          footer: Container(
                              padding: const EdgeInsets.all(7),
                              color: Colors.black54,
                              child: Text(
                                item["title"],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                                textAlign: TextAlign.right,
                              )),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Catégorie",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Voir tout",
                                style: TextStyle(color: AppColor.red),
                              ))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                height: 230.0,
                                child: FutureBuilder(
                                    future: fetchCategories(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index) {
                                              final record = snapshot.data[index]
                                              as Map<String, dynamic>;
                                              return GestureDetector(
                                                onTap: () {},
                                                // onTap: () => pushTo(
                                                //     context,
                                                //     Products(
                                                //         record['id'],
                                                //         record['__last_update'],
                                                //         record['name'])),
                                                child: buildListItems(record),
                                              );
                                            });
                                      } else {
                                        if (snapshot.hasError)
                                          return const Text('Unable to fetch data');
                                        return const CircularProgressIndicator(
                                        );
                                      }
                                    }))),
                      ],
                    ),
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
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Voir tout",
                                style: TextStyle(color: AppColor.red),
                              ))
                        ],
                      ),
                    ),

                    SizedBox(height: hh(context, 20)),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                height: 700.0,
                                child: Center(
                                    child: FutureBuilder(
                                        future: fetchShops(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<dynamic> snapshot) {
                                          if (snapshot.hasData) {
                                            return ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  final record = snapshot.data[index]
                                                  as Map<String, dynamic>;
                                                  if (city == 'All') {
                                                    return GestureDetector(
                                                      onTap: () => pushTo(
                                                          context,
                                                          Shop(
                                                              record['id'],
                                                              record['__last_update'],
                                                              record['seller_product_ids'],
                                                              record['name'],
                                                              record['city'],
                                                              record['email'],
                                                              record['phone'],
                                                              record['street'],
                                                          )),
                                                      child: buildListItem(record),
                                                    );
                                                  } else {
                                                    if (city.toLowerCase() ==
                                                        record['city']
                                                            .toString()
                                                            .toLowerCase()) {
                                                      return GestureDetector(
                                                        onTap: () => pushTo(
                                                            context,
                                                            Shop(
                                                                record['id'],
                                                                record['__last_update'],
                                                                record['seller_product_ids'],
                                                                record['name'],
                                                                record['city'],
                                                                record['email'],
                                                                record['phone'],
                                                                record['street'],
                                                            ) ),
                                                        child: buildListItem(record),
                                                      );
                                                    } else
                                                      return Container();
                                                  }
                                                });
                                          } else {
                                            if (snapshot.hasError)
                                              return const Text('Unable to fetch data');
                                            return const CircularProgressIndicator();
                                          }
                                        })))),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Expanded(
                    //   child: FutureBuilder(
                    //       future: fetchContacts(),
                    //       builder: (BuildContext context,
                    //           AsyncSnapshot<dynamic> snapshot) {
                    //         if (snapshot.hasData) {
                    //           return ListView.builder(
                    //               itemCount: snapshot.data.length,
                    //               itemBuilder: (context, index) {
                    //                 final record = snapshot.data[index]
                    //                     as Map<String, dynamic>;
                    //                 if (record['seller'])
                    //                   return buildListItemA(record);
                    //                 else
                    //                   return Container();
                    //               });
                    //         } else {
                    //           if (snapshot.hasError)
                    //             return Text('Unable to fetch data');
                    //           return CircularProgressIndicator();
                    //         }
                    //       }),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       TextButton(
                    //           onPressed: () {},
                    //           child: Text(
                    //             "Voir tout",
                    //             style: TextStyle(
                    //                 color: AppColor.red,
                    //                 fontSize: 22,
                    //                 fontWeight: FontWeight.bold),
                    //           ))
                    //     ],
                    //   ),
                    // ),

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.of(context)
                    //         .pushReplacementNamed(MenuScreen.routeName);
                    //   },
                    //   child: RestaurantCard(
                    //     image: Image.asset("assets/images/miams-sousse.jpg",
                    //         fit: BoxFit.cover),
                    //     name: "Miam's Sousse",
                    //   ),
                    // ),
                    // RestaurantCard(
                    //     image: Image.asset("assets/images/PLAN-B-1.jpg",
                    //         fit: BoxFit.cover),
                    //     name: "Plan B"),
                    // RestaurantCard(
                    //     image: Image.asset("assets/images/allo_montreal.jpeg",
                    //         fit: BoxFit.cover),
                    //     name: "Allo Montreal"),
                    // RestaurantCard(
                    //     image: Image.asset("assets/images/planet_food.jpeg",
                    //         fit: BoxFit.cover),
                    //     name: "Planet Food"),
                    //
                    // // RestaurantCard(
                    // //     image: Image.asset("assets/images/bistro.jpg", fit: BoxFit.cover),
                    // //     name: "Bistro"
                    // // ),
                    // // RestaurantCard(
                    // //     image: Image.asset("assets/images/Mano drink & food.jpeg", fit: BoxFit.cover),
                    // //     name: "Mano drink & food"
                    // // ),
                    // RestaurantCard(
                    //     image: Image.asset("assets/images/Cocktail-food.jpg",
                    //         fit: BoxFit.cover),
                    //     name: "Cocktail Food"),
                    // SizedBox(height: 10),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "Articles récents",
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       TextButton(
                    //         onPressed: () {},
                    //         child: Text("Voir tout"),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 20,
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {},
                    //         child: RecentItemCard(
                    //           image: Image.asset(
                    //             "assets/images/pizza4.jpg",
                    //             fit: BoxFit.cover,
                    //           ),
                    //           name: "Pizza ",
                    //         ),
                    //       ),
                    //       RecentItemCard(
                    //           image: Image.asset(
                    //             "assets/images/tacos.jpeg",
                    //             fit: BoxFit.cover,
                    //           ),
                    //           name: "Tacos"),
                    //       RecentItemCard(
                    //           image: Image.asset(
                    //             "assets/images/makloub.jpg",
                    //             fit: BoxFit.cover,
                    //           ),
                    //           name: "Makloub"),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class RecentItemCard extends StatelessWidget {
//   final String _name;
//   final Image _image;
//
//   const RecentItemCard({
//     required String name,
//     required Image image,
//   })  : _name = name,
//         _image = image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//             width: 80,
//             height: 80,
//             child: _image,
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: Container(
//             height: 100,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _name,
//                   style: Helper.getTheme(context).headline3,
//                 ),
//                 Row(
//                   children: [
//                     Text("Food"),
//                     SizedBox(
//                       height: 10,
//                     ),
//
//                     SizedBox(
//                       width: 20,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       "assets/images/star_filled.png", color: AppColor.red,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "4.9",
//                       style: TextStyle(
//                         color: AppColor.red,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text('Notes')
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

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
                      "assets/images/star_filled.png",
                      color: AppColor.red,
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
