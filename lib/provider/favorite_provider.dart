import 'package:flutter/cupertino.dart';

import 'item_model.dart';
import 'model_favorite.dart';

class FavoriteProvider with ChangeNotifier{

  Map<String, FavoriteModel> _favoriteItems = {};

  Map<String, FavoriteModel> get getFavoriteItems {
    return {..._favoriteItems};
  }

  void addItemToFavorite(
      String itemId,
      String name,
      String url,
      String describtion,
      String image,
      ) {
    if (_favoriteItems.containsKey(itemId)) {
      _favoriteItems.update(
          itemId,
              (exitingFavoriteItem) => FavoriteModel(
              id: exitingFavoriteItem.id,

              )
      );
    } else {
      _favoriteItems.putIfAbsent(
          itemId,
              () => FavoriteModel(
              id: DateTime.now().toString(),
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