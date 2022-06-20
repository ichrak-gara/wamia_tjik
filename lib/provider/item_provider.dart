import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:signin_signup/models/item_model.dart';
import 'package:signin_signup/screen/productScreen.dart';

import '../main.dart';

class ItemsProvider with ChangeNotifier{

  List<ItemModel> _provideritems = [
    ItemModel(
        id: ProductScreen.getById(product_id),
        // name: "hhhhh",
        // price: "bbnjj",
        // image: "hhjjj"
    )
  ];

  static get product_id => product_id;

  List<ItemModel> get provideritems {
    return [..._provideritems];
  }

  ItemModel findById(String itemId){
    return _provideritems.firstWhere((element) => element.id == itemId);
  }
}