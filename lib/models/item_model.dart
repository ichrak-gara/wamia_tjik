import 'package:flutter/cupertino.dart';

import '../main.dart';

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

  Widget buildListItem(Map<String, dynamic> record) {
    var unique = record['__last_update'] as String;
    unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
    final avatarUrl =
        '${orpc
        .baseURL}/web/image?model=product.template&field=image&id=${record["id"]}&unique=$unique';

    var product_id = record['seller_id'];
    var product_name = record['name'];
    var product_image = avatarUrl;
    var product_price = record['lst_price'];
    var product_description = record['description_sale'];

    return buildListItem(record);
  }

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
      id: json["id"],
      title: json["title"],
      describtion: json["description"],
      image: json["image"],
      price: json["price"],
  );
}