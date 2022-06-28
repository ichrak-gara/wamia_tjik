import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/core/core_shelf.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/extensions/image_path.extension.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const/colors.dart';
import '../widgets/base.dart';
import 'cart.dart';
import 'confirmation.dart';


class ConfirmCheckout extends StatefulWidget {
  @override
  _ConfirmCheckout createState() => _ConfirmCheckout();
}

class _ConfirmCheckout extends State<ConfirmCheckout> {
  var res;
  bool isChecked = false;
  double coin = 0;
  double dinar = 0;
  Future<void> getinfos() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      password = prefs.getString('password');
    });
  }

  login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse("http://localhost:8069/api/auth/token"),
        headers: {"login": email, "password": password, "db": "test"});
    final data = jsonDecode(response.body);

    double coins = data['wk_website_loyalty_points'];
    saveCoin(coins);
  }

  saveCoin(double coin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setDouble("wk_website_loyalty_points", coin);
      preferences.commit();
    });
  }

  Future<void> getname() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getInt('partner_id');
    });
  }

  int name = 0;
  String email = "";
  String password = "";
  save(List<dynamic> resp) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var body = jsonEncode({
      "jsonrpc": "2.0",
      "params": {
        "partner_id": name,
        "bool": isChecked,
        "new": coin,
        "order_line": res
      }
    });
    print(body);
    final response = await http.post(
        Uri.parse("http://localhost:8069/api/create_order"),
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    print(response.body);

    if (response.statusCode == 200) {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Confirmation()),
        );
      });

      resp.clear();

      registerToast("WAMIA W TJIK MEKELTEK");
    } else {
      registerToast("Fama mouchkel");
    }
  }

  registerToast(String toast) {
    return showTopSnackBar(
      context,
      toast == "WAMIA W TJIK MEKELTEK"
          ? CustomSnackBar.success(
              message: toast,
            )
          : CustomSnackBar.error(
              message: toast,
            ),
    );
  }

  Future<void> getcoins() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      coin = prefs.getDouble('wk_website_loyalty_points');
      dinar = coin * 0.5;
    });
  }

  Future<void> getinfo() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phone');
      street = prefs.getString('street');
      city = prefs.getString('city');
    });
  }

  double calcul(double total) {
    setState(() {
      total = total - dinar;
      if (total < 0) {
        total = 0;
      }
      print(total);
    });
    return total;
  }

  double coins = 0;
  String phone = "";
  String street = "";
  String city = "";
  void initState() {
    getinfos();
    getname();
    getinfo();
    getcoins();
    coins = coin;
    super.initState();
  }

  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      res = cart.respo;
      total = cart.totalPrice;
      return Base(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: hh(context, 50)),
            Padding(
              padding: EdgeInsets.only(left: ww(context, 10)),
              child: Material(
                borderRadius: BorderRadius.circular(hh(context, 50)),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => popTo(context),
                  borderRadius: BorderRadius.circular(hh(context, 50)),
                  child: Container(
                    padding: EdgeInsets.all(ww(context, 10)),
                    child: SvgPicture.asset(
                      "Left".toIcon,
                      width: ww(context, 22),
                      //color: textPrimary(context),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: hh(context, 50)),
            horizontalpadding(
              context,
              child: Text(
                "CONFIRMATION",
                //style: head36(context, textPrimary(context)),
              ),
            ),
            SizedBox(height: hh(context, 50)),
            horizontalpadding(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BCH NKALMOUK ALA NOUMROUK",
                    //style: head38(context, textPrimary(context)),
                  ),
                  Text(
                    phone,
                    //style: head36(context, AppColors.primary),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(context, 50)),
            horizontalpadding(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bch tjik lena",
                    //style: head38(context, textPrimary(context)),
                  ),
                  Text(
                    city,
                    //style: head36(context, AppColors.primary),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(context, 50)),
            horizontalpadding(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bedhabt Lena",
                    //style: head38(context, textPrimary(context)),
                  ),
                  Text(
                    street,
                    //style: head36(context, AppColors.primary),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  horizontalpadding(
                    context,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Prix",
                          //style: label(context, textPrimary(context)),
                        ),
                        Text(
                          "${cart.totalPrice} DT",
                          //style: head36(context, AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                  horizontalpadding(
                    context,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: <Widget>[
                          // Checkbox(
                          //     checkColor: Colors.white,
                          //     activeColor: AppColor.primary,
                          //     value: isChecked,
                          //     onChanged: (bool value) {
                          //       setState(() {
                          //         isChecked = value;
                          //         calcul(total);
                          //         total;
                          //       });
                          //     }),
                          Text(
                            "Nestamel l Coins",
                            //style: head38(context, textPrimary(context)),
                          ),
                        ]),
                        Row(children: <Widget>[
                          Text(
                            "3andek " + coin.toStringAsFixed(3),
                            //style: label(context, textPrimary(context)),
                          ),
                          SvgPicture.asset(
                            "coin".toIcon,
                            width: ww(context, 22),
                            //color: AppColors.primary,
                          ),
                          Text(
                            " = " + dinar.toStringAsFixed(3) + "DT",
                            //style: label(context, textPrimary(context)),
                          ),
                        ]),
                        if (isChecked)
                          Row(
                            children: <Widget>[
                              Text(
                                "Prix Jdid  ",
                                //style: head24(context, AppColors.primary),
                              ),
                              (total - dinar) < 0
                                  ? Text(
                                      "0 DT",
                                      //style:label(context, textPrimary(context)),
                                    )
                                  : Text(
                                      ((total - dinar)).toString() + "DT",
                                      //style: label(context, textPrimary(context)),
                                    )
                            ],
                          ),
                      ],
                    ),
                  ),
                ]),
            SizedBox(height: hh(context, 50)),
            SolidBorderedButton(
              onTap: () {
                if (isChecked) {
                  setState(() {
                    if (cart.totalPrice < dinar) {
                      coin = (dinar - cart.totalPrice) / 2;
                      res.add([
                        0,
                        0,
                        {
                          "product_id": 9,
                          "product_uom_qty": 1,
                          "price_unit": -cart.totalPrice
                        }
                      ]);
                    } else {
                      coin = (cart.totalPrice - dinar);
                      res.add([
                        0,
                        0,
                        {
                          "product_id": 9,
                          "product_uom_qty": 1,
                          "price_unit": -dinar
                        }
                      ]);
                    }
                  });
                }
                coin;
                cart.adds(cart.basketItems);
                cart.save();
                save(cart.resp);
                cart.clear();
                login();
                getcoins();
              },
              text: "3ADI",
              bgColor: AppColor.primary,
              borderColor: AppColor.primary,
              textColor: AppColor.white,
            ),
            SizedBox(height: hh(context, 50)),
          ],
        ),
      );
    });
  }
}
