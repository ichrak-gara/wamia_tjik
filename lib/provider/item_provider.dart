import 'package:flutter/cupertino.dart';
import 'package:signin_signup/models/item_model.dart';
import '../main.dart';

class ItemsProvider with ChangeNotifier {

  Future<dynamic> fetchContacts() async {
    var seller_id = await session.get('seller_id');
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

  List<ItemModel> _models = [];

  Future<List<ItemModel>> ListFromContacts() async {
    _models.clear();

    fetchContacts().then((value) {
      _models = List.generate(value.length, (index) => ItemModel.fromJson(value[index]),
      );
    });

    return _models;
  }


  List<ItemModel> get models{
    return [..._models];
  }
  ItemModel findById(String itemId) {
    return _models.firstWhere((element) => element.id == itemId);
  }

}