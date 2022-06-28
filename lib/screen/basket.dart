import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/core/core_shelf.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/extensions/image_path.extension.dart';
import 'package:signin_signup/providers/page_provider.dart';
import 'package:signin_signup/screen/HomeScreen.dart';
import 'package:signin_signup/screen/confirm_checkout.dart';
import 'package:signin_signup/screen/panier_empty_list.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../odoo/connection.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import 'cart.dart';
import 'favorite_empty_list.dart';
import 'landingScreen.dart';

class Basket extends StatefulWidget {
  static const routeName = "/basketScreen";

  @override
  _Basket createState() => _Basket();
}

class _Basket extends State<Basket> {
  var token;
  // Future<String> checkIfLoggedIn() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var auth_token = prefs.getString('auth_token');
  //   if (auth_token == null) {
  //     setState(() {
  //       token = auth_token;
  //     });
  //     String getauth() {
  //       return auth_token;
  //     }
  //   }
  // }
  //
  // void initState() {
  //   checkIfLoggedIn();
  //   token = checkIfLoggedIn();
  //   super.initState();
  // }

//cart.basketItems[index]
/* trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              cart.remove(cart.basketItems[index]);
                            },
                          ),*/
  //cart.totalPrice
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, PageProvider page, child) {
      return Consumer<Cart>(builder: (context, cart, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Mon Panier',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(null),
              ),
              actions: [
                Center(
                  child: Badge(
                    badgeContent: Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20.0)
              ],
            ),
            bottomNavigationBar: new Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ListTile(
                    title: new Text(
                      "Totale:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: new Text(
                      "${cart.totalPrice.toString()} DT",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  Expanded(
                      child: new MaterialButton(
                    height: 50,
                    minWidth: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: AppColor.red)),
                    onPressed: cart.basketItems.length == 0
                        ? () {
                            final snackBar = showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                message: "Votre panier est vide",
                              ),
                            );
                          }
                        : token == null
                            ? (() => pushTo(context, HomeScreen()))
                            : (() => pushTo(context, ConfirmCheckout())),
                    child: new Text(
                      "Passer votre Commande",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: AppColor.red,
                  ))
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: hh(context, 20)),
                Text(
                  "Mes produits",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: hh(context, 15)),
                cart.basketItems.length == 0
                    ? PanierEmptyList()
                    : Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                        itemCount: cart.basketItems.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: ww(context, 80),
                                      height: ww(context, 80),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ww(context, 10)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            '${orpc.baseURL}/web/image?model=product.template&id=${cart.basketItems[index].id.toString()}&field=image&unique=${cart.basketItems[index].last.toString()}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: hh(context, 80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${cart.basketItems[index].seller.toString().substring(4, cart.basketItems[index].seller.toString().length - 1)}",
                                          style:TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),

                                          //style: head18(context, textPrimary(context)),
                                        ),
                                        Text(
                                          cart.basketItems[index].name,
                                          style:TextStyle(color: AppColor.primary, fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${cart.basketItems[index].price.toString()} DT",
                                          style:TextStyle(color: AppColor.red, fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: ww(context, 22),
                                    height: ww(context, 22),
                                    padding: EdgeInsets.all(ww(context, 2)),
                                    child: GestureDetector(
                                        onTap: () {
                                          cart.remove(cart.basketItems[index]);
                                        },
                                      child: Icon(Icons.clear, color: Colors.white, size: 20,),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.red,
                                      borderRadius:
                                          BorderRadius.circular(ww(context, 30)),
                                    ),
                                  ),
                                  SizedBox(height: hh(context, 30)),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            " Quantité : ",
                                            style:TextStyle(color: AppColor.primary, fontSize: 17, fontWeight: FontWeight.bold)
                                          ),
                                          Text(
                                            "${cart.basketItems[index].qte.toString()}",
                                            style:TextStyle(color: AppColor.red, fontSize: 17, fontWeight: FontWeight.bold),

                                            //style: head18(context, textPrimary(context)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );

                          },
                      ),

                ),
              ]),
            ));
      });
    });
  }
}

class BasketItem extends StatelessWidget {
  var id;
  var last;
  var name;
  var price;
  var qte;
  var seller;

  BasketItem(
      {this.id, this.last, this.name, this.price, this.qte, this.seller});
  factory BasketItem.fromJson(Map<String, dynamic> jsonData) {
    return BasketItem(
      id: jsonData['id'],
      last: jsonData['last'],
      name: jsonData['name'],
      price: jsonData['price'],
      qte: jsonData['qte'],
      seller: jsonData['seller'],
    );
  }

  static Map<String, dynamic> toMap(BasketItem basketIteme) => {
        'id': basketIteme.id,
        'last': basketIteme.last,
        'name': basketIteme.name,
        'price': basketIteme.price,
        'qte': basketIteme.qte,
        'seller': basketIteme.seller,
      };

  static String encode(List<BasketItem> basketItemes) => json.encode(
        basketItemes
            .map<Map<String, dynamic>>(
                (basketIteme) => BasketItem.toMap(basketIteme))
            .toList(),
      );

  static List<BasketItem> decode(String basketItemes) =>
      (json.decode(basketItemes) as List<dynamic>)
          .map<BasketItem>((item) => BasketItem.fromJson(item))
          .toList();
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
