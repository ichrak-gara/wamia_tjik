import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/screen/basket.dart';

import 'favoriteScreen.dart';

class Cart extends ChangeNotifier {
  List<BasketItem> _items = [];
  List<BasketItem> _history = [];

  double _totalPrice = 0.0;
  List<dynamic> resp = [];
  void add(BasketItem item) {
    _items.add(item);
    _totalPrice += item.price;
    resp.add([
      0,
      0,
      {"product_id": item.id, "product_uom_qty": item.qte}
    ]);
    notifyListeners();
  }

  void remove(BasketItem item) {
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _totalPrice = 0.0;
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<BasketItem> get basketItems {
    return _items;
  }

  List<dynamic> get respo {
    return resp;
  }

  List<BasketItem> get history {
    return _history;
  }

  void adds(List<BasketItem> item) {
    for (int i = 0; i < item.length; i++) {
      _history.add(item[i]);
    }
    ;
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();

    var basketItemesString = prefs.getString("BasketItemes");
    print(basketItemesString);

    if (prefs.getString("BasketItemes") == null) {
      _history = _history;
    } else {
      _history = BasketItem.decode(basketItemesString);
    }
  }

  Future<void> save() async {
    WidgetsFlutterBinding.ensureInitialized();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Encode and store data in SharedPreferences
    var encodedData = BasketItem.encode(_history);

    prefs.setString("BasketItemes", encodedData);

    // print(encodedData);
    // Fetch and decode data
  }

  void clears() {
    _history.clear();
  }
}

class Carte extends ChangeNotifier {
  List<BasketIteme> _items = [];

  void add(BasketIteme item) {
    if (_items.every((items) => items.id != item.id)) {
      _items.add(item);
    }

    notifyListeners();
  }

  void remove(BasketIteme item) {
    _items.remove(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  List<BasketIteme> get basketItems {
    return _items;
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();

    var basketItemesString = prefs.getString("BasketItemes_key");
    print(basketItemesString);

    if (prefs.getString("BasketItemes_key") == null) {
      _items = _items;
    } else {
      _items = BasketIteme.decode(basketItemesString);
    }
  }

  Future<void> save() async {
    WidgetsFlutterBinding.ensureInitialized();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Encode and store data in SharedPreferences
    var encodedData = BasketIteme.encode(_items);

    prefs.setString("BasketItemes_key", encodedData);

    // print(encodedData);cart
    // Fetch and decode data
  }

  void clears() {
    _items.clear();
  }
}
