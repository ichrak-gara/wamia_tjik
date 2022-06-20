import 'package:flutter/cupertino.dart';

class FavoriteModel with ChangeNotifier {
  final String title;
  final String describtion;
  // final String url;
  final String id;
  final String itemsId;
  final String image;
  final String price;

  FavoriteModel(
      {
        required this.id,
        required this.itemsId,
        required this.title,
        required this.describtion,
        // required this.url,
        required this.image,
        required this.price
      });
}