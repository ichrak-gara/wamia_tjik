import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/core/core_shelf.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/extensions/image_path.extension.dart';

import '../../odoo/connection.dart';
import '../const/colors.dart';
import '../widgets/bottomNavBar.dart';
import 'cart.dart';
import 'favorite_empty_list.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = "/favoriteScreen";
  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  List<BasketIteme> basketItemes = [];
  var basketItemesString;

  Future<void> save(List<BasketIteme> vaa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var encodedData = BasketIteme.encode(vaa);
    prefs.setString("BasketItemes_key", encodedData);

  }

  load(List<BasketIteme> _items) async {
    final prefs = await SharedPreferences.getInstance();

    var basketItemesString = prefs.getString("BasketItemes_key");
    print(basketItemesString);

    if (prefs.getString("BasketItemes_key") != null) {
      _items = BasketIteme.decode(basketItemesString);
    }
  }

  @override
  void initState() {
    basketItemes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Carte>(
      builder: (context, cart, child) {
        cart.load();
        //save(cart.basketItems);
        basketItemes = cart.basketItems.cast<BasketIteme>();

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Mes Favories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
          bottomNavigationBar: BottomNavBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: hh(context, 20)),
              Text(
                "Liste de votre Favories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: hh(context, 15)),
              cart.basketItems.length == 0
                  ? FavoriteEmptyList()
                  : Expanded(
                  child: ListView.builder(
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
                                        '${orpc.baseURL}/web/image?model=product.template&id=${basketItemes[index].id.toString()}&field=image&unique=${basketItemes[index].last.toString()}',
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
                                      '${basketItemes[index].seller.toString().substring(4, basketItemes[index].seller.toString().length - 1)}',
                                      style:TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),

                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      basketItemes[index].name,
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
                                      cart.save();
                                    }, // Image tapped
                                  child: Icon(Icons.clear, color: Colors.white, size: 20,),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.red,
                                  borderRadius:
                                  BorderRadius.circular(ww(context, 30)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )),
            ]),
          ),
        );
      },
    );
  }
}

class BasketIteme extends StatelessWidget {
  var id;
  var last;
  var name;
  var seller;
  var price;

  // ignore: use_key_in_widget_constructors
  BasketIteme({this.id, this.last, this.name, this.seller, this.price});
  factory BasketIteme.fromJson(Map<String, dynamic> jsonData) {
    return BasketIteme(
      id: jsonData['id'],
      last: jsonData['last'],
      name: jsonData['name'],
      seller: jsonData['seller'],
      price: jsonData['price'],
    );
  }

  static Map<String, dynamic> toMap(BasketIteme basketIteme) => {
    'id': basketIteme.id,
    'last': basketIteme.last,
    'name': basketIteme.name,
    'seller': basketIteme.seller,
    'price': basketIteme.price,

  };

  static String encode(List<BasketIteme> basketItemes) => json.encode(
    basketItemes
        .map<Map<String, dynamic>>(
            (basketIteme) => BasketIteme.toMap(basketIteme))
        .toList(),
  );

  static List<BasketIteme> decode(String basketItemes) =>
      (json.decode(basketItemes) as List<dynamic>)
          .map<BasketIteme>((item) => BasketIteme.fromJson(item))
          .toList();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

