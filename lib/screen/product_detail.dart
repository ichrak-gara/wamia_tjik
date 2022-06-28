import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:signin_signup/core/core_shelf.dart';
import 'package:signin_signup/screen/favoriteScreen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:signin_signup/screen/basket.dart';
import '../const/colors.dart';
import '../main.dart';
import '../utils/helper.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/base.dart';
import 'package:signin_signup/screen/cart.dart';
import 'package:signin_signup/core/init/metrics.dart';
import '../widgets/main_page.dart';


class ProductDetail extends StatelessWidget {
  var id;
  var description;
  var name;
  var price;
  var last;
  var seller;
  var ids;
  var altern;
  var image;
  ProductDetail(var id, var description, var name, var price, var last,
      var seller, var ids, var altern, var image) {
    this.id = id;
    this.description = description;
    this.name = name;
    this.price = price;
    this.last = last;
    this.seller = seller;
    this.ids = ids;
    this.altern = altern;
    this.image = image;
  }
  var n = _QuantityPriceState.n;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Jumbotron(id, last, name, seller),
            Expanded(
                child: ListView(children: [
              Container(
                //height: 80,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
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
                  children: [
                    ProductHeader(name, seller),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                LastPrix(price),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    ProductDescription(description),
                    SizedBox(height: 20),
                    QuantityPrice(price),
                    SizedBox(height: 20),
                    horizontalpadding(
                      context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Plus d'information",
                              style:
                                  Helper.getTheme(context).headline4?.copyWith(
                                        fontSize: 16,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ProductImage(ids),
                    // horizontalpadding(
                    //   context,
                    //   child: Text(
                    //     "Ch9awlek zeda te5o",
                    //     //style: label(context, textPrimary(context)),
                    //   ),
                    // ),
                    // ProductAltern(altern),
                    horizontalpadding(
                      context,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(StadiumBorder(
                              side: BorderSide(color: AppColor.red, width: 1.5),
                            )),
                          ),
                          onPressed: () {
                            cart.add(BasketItem(
                              id: id,
                              last: last,
                              name: name,
                              price: price * _QuantityPriceState.getn(),
                              qte: _QuantityPriceState.getn(),
                              seller: seller,
                            ));
                            pushTo(context, MainPage());
                            _QuantityPriceState.init();
                            final snackBar = showTopSnackBar(
                              context,
                              CustomSnackBar.success(
                                message: "Produit ajouté au panier",
                              ),
                            );
                          },
                          child: Text(
                            "Ajouter au panier ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hh(context, 10)),
                  ],
                ),
              ),
            ])),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }
}

class LastPrix extends StatefulWidget {
  var lastPrix;
  LastPrix(var lastPrix) {
    this.lastPrix = lastPrix;
  }
  @override
  State<LastPrix> createState() => _LastPrixState();
}

class _LastPrixState extends State<LastPrix> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${(widget.lastPrix).toString()} DT',
      style: TextStyle(
        color: AppColor.primary,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      //style: head24(context, AppColors.primary),
    );
  }
}

class QuantityPrice extends StatefulWidget {
  var price;
  QuantityPrice(var price) {
    this.price = price;
  }
  @override
  State<QuantityPrice> createState() => _QuantityPriceState();
}

class _QuantityPriceState extends State<QuantityPrice> {
  static int n = 1;
  void add() {
    setState(() {
      n++;
    });
  }

  void minus() {
    setState(() {
      if (n != 1) n--;
    });
  }

  static int getn() {
    return n;
  }

  static void init() {
    n = 1;
  }

  @override
  Widget build(BuildContext context) {
    return horizontalpadding(
      context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre de portions",
                style: Helper.getTheme(context).headline4?.copyWith(
                      fontSize: 16,
                    ),
              ),
              SizedBox(height: hh(context, 5)),
              Container(
                width: ww(context, 140),
                height: hh(context, 40),
                child: Row(
                  children: <Widget>[
                    new FloatingActionButton(
                      onPressed: minus,
                      child: new Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      backgroundColor: AppColor.red,
                    ),
                    new Text(
                      '$n',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.red,
                      ),
                      //style: head18(context, textPrimary(context))
                    ),
                    new FloatingActionButton(
                      onPressed: add,
                      child: new Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: AppColor.red,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  //color: panier(context),
                  borderRadius: BorderRadius.circular(hh(context, 40)),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Totale",
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                //style: label(context, textPrimary(context)),
              ),
              SizedBox(height: hh(context, 10)),
              Text(
                '${(widget.price * n).toString()} DT',
                style: TextStyle(
                  color: AppColor.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                //style: head24(context, AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  var description;
  ProductDescription(var description) {
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    return horizontalpadding(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: Helper.getTheme(context).headline4?.copyWith(
                  fontSize: 16,
                ),
          ),
          SizedBox(height: hh(context, 10)),
          Text(
            description.toString(),
            style: TextStyle(fontSize: 17, color: Colors.black),
            //style: body(context, textSecondary),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: AppColor.placeholder,
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  var id;
  var last;
  ImageDialog(var id, var last) {
    this.id = id;
    this.last = last;
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 330,
        height: 330,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    '${orpc.baseURL}/web/image?model=product.image&id=${id.toString()}&field=image&unique=${last.toString()}'),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  var ids;
  ProductImage(var ids) {
    this.ids = ids;
  }
  Future<dynamic> fetchImages() async {
    return orpc.callKw({
      'model': 'product.image',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          'id',
          'name',
          'image',
          'product_tmpl_id',
          '__last_update',
        ],
        'limit': 80,
      },
    });
  }

  Widget buildList(Map<String, dynamic> record, BuildContext context) {
    return Column(children: <Widget>[
      Container(
          width: 150,
          height: 150,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Stack(alignment: Alignment.center, children: <Widget>[
                InkWell(
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                              record['id'], record['__last_update']));
                    },
                    child: Image(
                        image: NetworkImage(
                            '${orpc.baseURL}/web/image?model=product.image&id=${record['id'].toString()}&field=image&unique=${record['__last_update'].toString()}'),
                        fit: BoxFit.fill,
                        color: Colors.white.withOpacity(1.0),
                        colorBlendMode: BlendMode.modulate)),
              ])))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return horizontalpadding(
      context,
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
                  height: 200.0,
                  child: Center(
                      child: FutureBuilder(
                          future: fetchImages(),
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
                                    if (ids.contains(record['id']))
                                      return buildList(record, context);
                                    else
                                      return Container();
                                  });
                            } else {
                              if (snapshot.hasError)
                                return const Text('Unable to fetch data');
                              return const CircularProgressIndicator(
                                  color: AppColor.red);
                            }
                          })))),
        ],
      ),
    );
  }
}

class ProductAltern extends StatelessWidget {
  var altern;
  ProductAltern(var altern) {
    this.altern = altern;
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

  Widget buildList(Map<String, dynamic> record, BuildContext context) {
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
                  //style: head66(context, AppColors.secondary),
                )),
              ])))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return horizontalpadding(
      context,
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
                  height: 200.0,
                  child: Center(
                      child: FutureBuilder(
                          future: fetchProducts(),
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

                                    if (altern.contains(record['id']))
                                      return GestureDetector(
                                        onTap: () {},
                                        // => pushTo(
                                        //     context,
                                        //     ProductDetail(
                                        //         record['id'],
                                        //         record['description_sale'],
                                        //         record['name'],
                                        //         record['lst_price'],
                                        //         record['__last_update'],
                                        //         record['marketplace_seller_id'],
                                        //         record['product_image_ids'],
                                        //         record[
                                        //         'optional_product_ids'])),
                                        child: buildList(record, context),
                                      );
                                    else
                                      return Container();
                                  });
                            } else {
                              if (snapshot.hasError)
                                return const Text('Unable to fetch data');
                              return const CircularProgressIndicator(
                                  color: AppColor.red);
                            }
                          })))),
        ],
      ),
    );
  }
}

class Productprice extends StatelessWidget {
  var price;
  Productprice(var price) {
    this.price = price;
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

  Widget buildList(Map<String, dynamic> record, BuildContext context) {
    return Column(children: <Widget>[
      Stack(alignment: Alignment.center, children: <Widget>[
        Center(
            child: Text(
          "${record['lst_price']}",
          textAlign: TextAlign.center,
          //style: head66(context, AppColors.secondary),
        )),
      ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return horizontalpadding(
      context,
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
                  height: 200.0,
                  child: Center(
                      child: FutureBuilder(
                          future: fetchProducts(),
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

                                    if (price.contains(record['id']))
                                      return GestureDetector(
                                        onTap: () {},
                                        // => pushTo(
                                        //     context,
                                        //     ProductDetail(
                                        //         record['id'],
                                        //         record['description_sale'],
                                        //         record['name'],
                                        //         record['lst_price'],
                                        //         record['__last_update'],
                                        //         record['marketplace_seller_id'],
                                        //         record['product_image_ids'],
                                        //         record[
                                        //         'optional_product_ids'])),
                                        child: buildList(record, context),
                                      );
                                    else
                                      return Container();
                                  });
                            } else {
                              if (snapshot.hasError)
                                return const Text('Unable to fetch data');
                              return const CircularProgressIndicator(
                                  color: AppColor.red);
                            }
                          })))),
        ],
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  var nom;
  var seller;
  ProductHeader(var nom, var seller) {
    this.nom = nom;
    this.seller = seller;
  }
//seller.toString().substring(1, 2)
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
          'seller_id'
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItem(Map<String, dynamic> record, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        seller.toString().substring(4, seller.toString().length - 1),
        //style: label(context, AppColors.primary),
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColor.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return horizontalpadding(
      context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nom.toString(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                //style: head36(context, textPrimary(context)),
              ),
              Row(children: [
                SizedBox(
                    height: 20.0,
                    child: Center(
                        child: FutureBuilder(
                            future: fetchShops(),
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
                                      print(record['seller_id']);
                                      if (seller.toString() ==
                                          record['seller_id'].toString()) {
                                        return GestureDetector(
                                          onTap: () {},
                                          // => pushTo(
                                          //     context,
                                          //     Shop(
                                          //         record['id'],
                                          //         record['__last_update'],
                                          //         record['seller_product_ids'],
                                          //         record['name'],
                                          //         record['city'])),
                                          child: buildListItem(record, context),
                                        );
                                      } else
                                        return Container();
                                    });
                              } else {
                                if (snapshot.hasError)
                                  return const Text('Unable to fetch data');
                                return const CircularProgressIndicator(
                                    color: AppColor.red);
                              }
                            })))
              ])
            ],
          ),
        ],
      ),
    );
  }
}

class Jumbotron extends StatefulWidget {
  var id;
  var last;
  var name;
  var seller;
  Jumbotron(var id, var last, var name, var seller) {
    this.id = id;
    this.last = last;
    this.name = name;
    this.seller = seller;
  }

  @override
  State<Jumbotron> createState() => _JumbotronState();
}

class _JumbotronState extends State<Jumbotron> {
  bool _isFavorited = false;
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
    return Consumer<Carte>(builder: (context, cart, child) {
      return Container(
        height: hh(context, 300),
        child: Stack(
          children: [
            SizedBox(
              height: Helper.getScreenHeight(context) * 0.5,
              width: Helper.getScreenWidth(context),
              child: Container(
                width: w(context),
                height: hh(context, 300),
                child: Image.network(
                  '${orpc.baseURL}/web/image?model=product.template&id=${widget.id.toString()}&field=image&unique=${widget.last.toString()}',
                  fit: BoxFit.cover,
                ),
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
            SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          popTo(context);
                          _QuantityPriceState.init();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 70),
                      IconButton(
                          // onPressed: _toggleFavorite,
                          onPressed: () {
                            cart.add(BasketIteme(
                              id: widget.id,
                              last: widget.last,
                              name: widget.name,
                              seller: widget.seller,

                            ));
                            cart.save();

                            final snackBar = showTopSnackBar(
                              context,
                              CustomSnackBar.success(
                                message: "Produit ajouté à la liste des favoris ",
                              ),
                            );
                          },
                          icon: (_isFavorited
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border)),
                          iconSize: 30,
                          color: AppColor.red),
                      Badge(
                        badgeContent: Text(
                          '0',
                          style: TextStyle(color: Colors.white),
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.30,
                ),
              ],
            ))
          ],
        ),

        // Stack(
        //   children: [
        //     Container(
        //       width: w(context),
        //       height: hh(context, 300),
        //       child: Image.network(
        //         '${orpc.baseURL}/web/image?model=product.template&id=${widget.id.toString()}&field=image&unique=${widget.last.toString()}',
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Positioned(
        //       top: hh(context, 50),
        //       left: w20(context),
        //       right: w20(context),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           ClipRRect(
        //             borderRadius: BorderRadius.circular(hh(context, 5)),
        //             child: BackdropFilter(
        //               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //               child: GestureDetector(
        //                 onTap: () {
        //                   // popTo(context);
        //                   // _QuantityPriceState.init();
        //                 },
        //                 child: Container(
        //                   width: ww(context, 32),
        //                   height: ww(context, 32),
        //                   padding: EdgeInsets.all(hh(context, 2)),
        //                   // child: SvgPicture.asset(
        //                   //   "Left".toIcon,
        //                   //   color: Colors.black,
        //                   // ),
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(hh(context, 5)),
        //                     color: Colors.white.withOpacity(0.1),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           ClipRRect(
        //             borderRadius: BorderRadius.circular(hh(context, 5)),
        //             child: BackdropFilter(
        //                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //                 child: GestureDetector(
        //                   onTap: () {
        //                     // cart.add(BasketIteme(
        //                     //   id: widget.id,
        //                     //   last: widget.last,
        //                     //   name: widget.name,
        //                     //   seller: widget.seller,
        //                     // ));
        //                     // cart.save();
        //                     //
        //                     // final snackBar = showTopSnackBar(
        //                     //   context,
        //                     //   CustomSnackBar.success(
        //                     //     message: "That fel favoris !",
        //                     //   ),
        //                     // );
        //                   },
        //                   child: Container(
        //                     width: ww(context, 32),
        //                     height: ww(context, 32),
        //                     padding: EdgeInsets.all(hh(context, 2)),
        //                     // child: SvgPicture.asset(
        //                     //   "Options".toIcon,
        //                     //   color: Colors.red,
        //                     // ),
        //                     decoration: BoxDecoration(
        //                       borderRadius:
        //                       BorderRadius.circular(hh(context, 5)),
        //                       color: Colors.white.withOpacity(0.2),
        //                     ),
        //                   ),
        //                 )),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      );
    });
  }
}
