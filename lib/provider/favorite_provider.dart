import 'package:flutter/cupertino.dart';

import '../models/item_model.dart';
import '../models/model_favorite.dart';

class FavoriteProvider with ChangeNotifier {
  Map<String, FavoriteModel> _favoriteItems = {};

  Map<String, FavoriteModel> get getFavoriteItems {
    return {..._favoriteItems};
  }

  void addItemToFavorite(
    String itemId,
    String name,
    // String url,
    String describtion,
    String image,
    String price,
  ) {
    if (_favoriteItems.containsKey(itemId)) {
      _favoriteItems.update(
          itemId,
          (exitingFavoriteItem) => FavoriteModel(
                id: exitingFavoriteItem.id,
                itemsId: exitingFavoriteItem.itemsId,
                title: exitingFavoriteItem.title,
                describtion: exitingFavoriteItem.describtion,
                // url: exitingFavoriteItem.url,
                image: exitingFavoriteItem.image,
                price: exitingFavoriteItem.price,
              ));
    } else {
      _favoriteItems.putIfAbsent(
          itemId,
          () => FavoriteModel(
                id: DateTime.now().toString(),
                itemsId: itemId,
                title: name,
                describtion: describtion,
                // url: url,
                image: image,
                price: price,
              ));
    }
    notifyListeners();
  }


  void removeItem(String itemId) {
    _favoriteItems.remove(itemId);
    notifyListeners();
  }

  void clearItem() {
    _favoriteItems.clear();
    notifyListeners();
  }
}