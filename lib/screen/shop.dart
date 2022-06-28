import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/screen/indivItem.dart';
import 'package:signin_signup/screen/product_detail.dart';

import '../core/init/metrics.dart';
import '../main.dart';
import '../utils/helper.dart';
import '../utils/navigate.dart';

class Shop extends StatefulWidget {
  var id;
  var last;
  var products;
  var nom;
  var city;
  var email;
  var phone;
  var street;
  Shop(var id, var last, var products, var nom, var city, var email, var phone, var street) {
    this.id = id;
    this.last = last;
    this.products = products;
    this.nom = nom;
    this.city = city;
    this.email = email;
    this.phone = phone;
    this.street = street;
  }

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  Future<dynamic> fetchProducts() async {
    final session = await orpc.authenticate(
        'test', 'ichrakgara3012@gmail.com', 'ichrak3012');
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
          'product_image_ids',
          'optional_product_ids'
        ],
        'limit': 80,
      },
    });
  }

  Widget buildListItems(Map<String, dynamic> record) {
    final avatarUrl =
        '${orpc.baseURL}/web/image?model=product.template&id=${record['id'].toString()}&field=image&unique=${record['__last_update'].toString()}';
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //color: bako(context),
                boxShadow: [
              BoxShadow(color: Colors.grey.withAlpha(100), blurRadius: 10.0),
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
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    //style: head36(context, textPrimary(context)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " ${record['lst_price'].toString()} DT",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
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

  ScrollController controller = ScrollController();
  bool closeTopContainer = true;
  double topContainer = 0;

  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Scaffold(
      //backgroundColor: bgPrimary(context),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(
                          '${orpc.baseURL}/web/image?model=seller.shop&id=${widget.id.toString()}&field=shop_banner&unique=${widget.last.toString()}'),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                top: hh(context, 50),
                left: w20(context),
                right: w20(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(hh(context, 5)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: GestureDetector(
                          onTap: () => popTo(context),
                          child: Container(
                            width: ww(context, 32),
                            height: ww(context, 32),
                            padding: EdgeInsets.all(hh(context, 2)),
                            // child: SvgPicture.asset(
                            //   "Left".toIcon,
                            //   color: Colors.black,
                            // ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(hh(context, 5)),
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              ' ${widget.nom.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.black),
              //style: head36(context, textPrimary(context)),
            ),
            Text(
              '\n ${widget.city.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColor.red),
            ),
          ]),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "A propos",
                  style: Helper.getTheme(context).headline4?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Nom : ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17, color: Colors.redAccent),
                ),
                Text(
                  ' ${widget.nom.toString()}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Email : ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17, color: Colors.redAccent),
                ),
                Text(
                  ' ${widget.email.toString()}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Adresse : ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17, color: Colors.redAccent),
                ),
                Text(
                  ' ${widget.street.toString()}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Numéro de Téléphone : ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17, color: Colors.redAccent),
                ),
                Text(
                  ' ${widget.phone.toString()}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Les Produits Disponibles",
                  style: TextStyle(
                    fontSize: 17,
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
          SizedBox(height: 2),
          Expanded(
            child: FutureBuilder(
                future: fetchProducts(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        controller: controller,
                        itemCount: snapshot.data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final record =
                              snapshot.data[index] as Map<String, dynamic>;
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          if (widget.products.contains(record['id'])) {
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
                    if (snapshot.hasError) return Text('Unable to fetch data');
                    return CircularProgressIndicator(color: AppColor.red);
                  }
                }),
          )
        ],
      ),
    );
  }
}
