import 'package:flutter/cupertino.dart';

class ItemModel with ChangeNotifier {
  final String title;
  final String describtion;
  // final String url;
  final String id;
  final String image;
  final String price;

  ItemModel({
    required this.id,
    required this.title,
    required this.describtion,
    // required this.url,
    required this.image,
    required this.price
  });
}