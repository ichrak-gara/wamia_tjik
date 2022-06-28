import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/core/core_shelf.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/extensions/image_path.extension.dart';

import '../../odoo/connection.dart';
import '../const/colors.dart';
import '../widgets/base.dart';
import '../widgets/main_page.dart';
import 'basket.dart';
import 'cart.dart';

class Hisotry extends StatefulWidget {
  @override
  _Hisotry createState() => _Hisotry();
}

class _Hisotry extends State<Hisotry> {
  List<BasketItem> historyItems = [];
  var HistoryItemsString;

  Future<void> save(List<BasketItem> vaa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Encode and store data in SharedPreferences
    var encodedData = BasketItem.encode(vaa);

    prefs.setString("BasketItemes", encodedData);

    // print(encodedData);
    // Fetch and decode data
  }

  load(List<BasketItem> _items) async {
    final prefs = await SharedPreferences.getInstance();

    var HistoryItemsString = prefs.getString("BasketItems");
    print(HistoryItemsString);

    if (prefs.getString("BasketItemes") != null) {
      _items = BasketItem.decode(HistoryItemsString);
    }
  }

  @override
  void initState() {
    historyItems;
    super.initState();
  }

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
    return Consumer<Cart>(
      builder: (context, cart, child) {
        cart.load();

        //save(cart.basketItems);
        historyItems = cart.history;

        return Base(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: hh(context, 50)),
          Padding(
              padding: EdgeInsets.only(left: ww(context, 10)),
              child: Material(
                borderRadius: BorderRadius.circular(hh(context, 50)),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => pushTo(context, MainPage()),
                  borderRadius: BorderRadius.circular(hh(context, 50)),
                  child: Container(
                    padding: EdgeInsets.all(ww(context, 10)),
                    child: SvgPicture.asset(
                      "Left".toIcon,
                      width: ww(context, 22),
                      color: textPrimary(context),
                    ),
                  ),
                ),
              )),
          SizedBox(height: hh(context, 2)),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Historique",
                //style: head36(context, textPrimary(context)),
              )),
          SizedBox(height: hh(context, 30)),
          cart.history.length == 0
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Ch9awlek techri taw',
                    //style: head36(context, AppColors.secondary),
                  ))
              : Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListView.builder(
                        itemCount: cart.history.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: ww(context, 80),
                                    height: ww(context, 80),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ww(context, 10)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${orpc.baseURL}/web/image?model=product.template&id=${cart.history[index].id.toString()}&field=image&unique=${cart.history[index].last.toString()}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: w20(context)),
                                  Container(
                                    height: hh(context, 80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          cart.history[index].name,
                                         //style: head18(context, textPrimary(context)),
                                        ),
                                        Text(
                                          "${cart.history[index].seller.toString().substring(4, cart.history[index].seller.toString().length - 1)}",
                                          //style: head18(context, AppColors.primary),
                                        ),
                                        Text(
                                          "${cart.history[index].price.toString()} DT",
                                          //style: head24(context, AppColors.primary),
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
                                  SizedBox(height: hh(context, 30)),
                                  Row(
                                    children: [
                                      Text(
                                        " QUANTITE : ${cart.history[index].qte.toString()}",
                                        //style: head18(context, textPrimary(context)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ))),
        ]));
      },
    );
  }
}
