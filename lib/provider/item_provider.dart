import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:signin_signup/models/item_model.dart';
import '../main.dart';

class ItemsProvider with ChangeNotifier {

  Future<dynamic> fetchContacts() async {
    var seller_id = await session.get('seller_id');
    //****** a ajouter ******
    var name_of_product = await session.get('name');

    //******
    print(seller_id);
    return orpc.callKw({
      'model': 'product.template',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [
          ['marketplace_seller_id', '=', seller_id]
        ],
        'fields': [
          'id',
          'name',
          'email',
          '__last_update',
          'image_128',
          'marketplace_seller_id',
          'lst_price',
          'description_sale',
        ],
        'limit': 80,
      },
    });
  }

  // Widget buildListItem(Map<String, dynamic> record) {
  //   var unique = record['__last_update'] as String;
  //   unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
  //   final avatarUrl =
  //       '${orpc
  //       .baseURL}/web/image?model=product.template&field=image&id=${record["id"]}&unique=$unique';
  //
  //   var product_id = record['seller_id'];
  //   var product_name = record['name'];
  //   var product_image = avatarUrl;
  //   var product_price = record['lst_price'];
  //   var product_description = record['description_sale'];
  //
  //
  //   final List<ItemModel> _provideritems = [
  //
  //     ItemModel(
  //         title: product_id,
  //         describtion: product_description,
  //         // url: "www",
  //         id: product_id,
  //         image: product_image,
  //         price: product_price
  //     ),
  //   ];
  //
  //   List<ItemModel> get provideritems {
  //     return [..._provideritems];
  //   }
  //   ItemModel findById(String itemId) {
  //     return _provideritems.firstWhere((element) => element.id == itemId);
  //   }
  // }
}