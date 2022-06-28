// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/core/core_shelf.dart';
import 'package:signin_signup/screen/product_detail.dart';
import 'package:signin_signup/screen/shop.dart';
import 'package:signin_signup/widgets/bottomNavBar.dart';

import '../../odoo/connection.dart';
import '../const/colors.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/searchScreen";

  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> with TickerProviderStateMixin {
  Future<dynamic> fetchShops() async {
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
          'city',
          'phone',
          'seller_product_ids',
          'shop_logo',
          'shop_banner',
          '__last_update',
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItemss(Map<String, dynamic> record, BuildContext context) {
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //color: bako(context),
                boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    record['name'].toString(),
                    //style: head69(context, textPrimary(context))
                  ),
                  Text(
                    "${record['city'].toString()} ",
                    //style: body(context, AppColors.secondary),
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    width: 150,
                    height: 150,
                    image: NetworkImage(
                        '${orpc.baseURL}/web/image?model=seller.shop&id=${record['id'].toString()}&field=shop_logo&unique=${record['__last_update'].toString()}'),
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ));
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
          'public_categ_ids',
          'marketplace_seller_id',
          'lst_price',
          'image',
          'description_sale',
          '__last_update',
          'product_image_ids',
          'optional_product_ids'
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItems(Map<String, dynamic> record) {
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //color: bako(context),
                boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    record['name'].toString(),
                    //style: head69(context, textPrimary(context))
                  ),
                  Text(
                    '${record['marketplace_seller_id'].toString().substring(4, record['marketplace_seller_id'].toString().length - 1)}',
                    //style: body(context, AppColors.secondary),
                  ),
                  Text(
                    "A partir de ",
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  Text(
                    "${record['lst_price'].toString()} DT",
                    //style: body(context, AppColors.secondary),
                  )
                ],
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    height: 150,
                    width: 150,
                    image: NetworkImage(
                        '${orpc.baseURL}/web/image?model=product.template&id=${record['id'].toString()}&field=image&unique=${record['__last_update'].toString()}'),
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ));
  }

  String searchString = "";
  TextEditingController searchController = TextEditingController();
  ScrollController controller = ScrollController();
  bool closeTopContainer = true;
  double topContainer = 0;
  @override
  Widget build(BuildContext context)  {
    TabController _tabController = TabController (length: 2, vsync: this);
    
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Recherche',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        backgroundColor: AppColor.bg2color,
        body: horizontalpadding(context,
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppColor.red,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Restaurants",),
                        Tab(text: "aliments",),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Text("hi"),
                      Text("hello")
                    ],
                  ),
                ),
                SizedBox(height: hh(context, 70)),
                TextField(
                    onChanged: (value) {
                      setState(() {
                        searchString = value;
                      });
                    },
                    controller: searchController,
                    style: TextStyle(color: AppColor.primary),
                    cursorColor: AppColor.primary,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColor.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.primary, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textPrimary(context), width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ))),
                SizedBox(height: hh(context, 20)),
                horizontalpadding(
                  context,
                  child: Text(
                    "RESTAURANTS",
                    //style: label(context, textPrimary(context)),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: fetchShops(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              controller: controller,
                              itemCount: snapshot.data.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final record = snapshot.data[index]
                                    as Map<String, dynamic>;
                                double scale = 1.0;
                                if (topContainer > 0.5) {
                                  scale = index + 0.5 - topContainer;
                                  if (scale < 0) {
                                    scale = 0;
                                  } else if (scale > 1) {
                                    scale = 1;
                                  }
                                }
                                if (record['name']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchString.toLowerCase())) {
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
                                      child: Opacity(
                                        opacity: scale,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..scale(scale, scale),
                                          alignment: Alignment.bottomCenter,
                                          child: Align(
                                              heightFactor: 0.7,
                                              alignment: Alignment.topCenter,
                                              child: buildListItemss(
                                                  record, context)),
                                        ),
                                      ));
                                } else {
                                  return Container();
                                }
                              });
                        } else {
                          if (snapshot.hasError)
                            return Text('Unable to fetch data');
                          return CircularProgressIndicator(
                              color: AppColor.primary);
                        }
                      }),
                ),
                SizedBox(height: hh(context, 20)),
                SizedBox(height: hh(context, 20)),
                horizontalpadding(
                  context,
                  child: Text(
                    "MEKLA",
                    //style: label(context, textPrimary(context)),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: fetchProducts(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              controller: controller,
                              itemCount: snapshot.data.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final record = snapshot.data[index]
                                    as Map<String, dynamic>;
                                double scale = 1.0;
                                if (topContainer > 0.5) {
                                  scale = index + 0.5 - topContainer;
                                  if (scale < 0) {
                                    scale = 0;
                                  } else if (scale > 1) {
                                    scale = 1;
                                  }
                                }
                                if (record['name']
                                        .toString()
                                        .toLowerCase()
                                        .contains(searchString.toLowerCase()) &&
                                    record['id'].toString() != "1" &&
                                    record['id'].toString() != "2") {
                                  return GestureDetector(
                                      onTap: () => pushTo(
                                          context,
                                          ProductDetail(
                                            record['id'],
                                            record['description_sale'],
                                            record['name'],
                                            record['lst_price'],
                                            record['__last_update'],
                                            record['marketplace_seller_id'],
                                            record['product_image_ids'],
                                            record['optional_product_ids'],
                                            record['image'],
                                          )),
                                      child: Opacity(
                                        opacity: scale,
                                        child: Transform(
                                          transform: Matrix4.identity()
                                            ..scale(scale, scale),
                                          alignment: Alignment.bottomCenter,
                                          child: Align(
                                              heightFactor: 0.7,
                                              alignment: Alignment.topCenter,
                                              child: buildListItems(record)),
                                        ),
                                      ));
                                } else {
                                  return Container();
                                }
                              });
                        } else {
                          if (snapshot.hasError)
                            return Text('Unable to fetch data');
                          return CircularProgressIndicator(
                              color: AppColor.primary);
                        }
                      }),
                ),
                SizedBox(height: hh(context, 100)),
              ],
            )));
  }
}
