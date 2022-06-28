import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signin_signup/screen/item_list.dart';
import '../const/colors.dart';
import '../main.dart';
import '../models/item_model.dart';
import '../models/model_favorite.dart';
import '../provider/item_provider.dart';
import '../utils/helper.dart';
import '../widgets/bottomNavBar.dart';
import 'indivItem.dart';
import 'menuScreen.dart';
import 'package:favorite_button/favorite_button.dart';

class ProductScreen extends StatelessWidget {
  final product_id;
  final product_name;
  final product_image;
  final product_price;
  final product_description;

  ProductScreen({
    this.product_id,
    this.product_name,
    this.product_image,
    this.product_price,
    this.product_description,
  });

  static const routeName = "/productScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bg2color,
        title: Text(
          "Menu",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w100),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MenuScreen.routeName);
          },
        ),
        actions: [
          Center(
            child: Badge(
              badgeContent: Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              animationDuration: Duration(milliseconds: 300),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 20.0)
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  static getById(product_id) {
    product_id;
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

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

    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) =>
                      new IndivItem(
                        product_detail_id: product_id,
                        product_detail_name: product_name,
                        product_detail_image: product_image,
                        product_detail_price: product_price,
                        product_detail_description: product_description,
                      ))),

              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    product_image,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.white60,
                  title: Text(
                    product_name,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    "\$ $product_price",
                    style: TextStyle(color: AppColor.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  // trailing: IconButton(
                  //           onPressed: _toggleFavorite,
                  //           icon: (_isFavorited
                  //               ? const Icon(Icons.favorite)
                  //               : const Icon(Icons.favorite_border)),
                  //           color: AppColor.red),
                  trailing: FavoriteButton(
                    isFavorite: false,
                    valueChanged: (_isFavorited) {
                      print("is favotite : $_isFavorited");
                    },
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }

  // Widget buildListItem(Map<String, dynamic> record) {
  //   var unique = record['__last_update'] as String;
  //   unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
  //   final avatarUrl =
  //       '${orpc.baseURL}/web/image?model=product.template&field=image&id=${record["id"]}&unique=$unique';
  //
  //   var product_id = record['seller_id'];
  //   var product_name = record['name'];
  //   var product_image = avatarUrl;
  //   var product_price = record['lst_price'];
  //   var product_description = record['description_sale'];
  //
  //   return Card(
  //     child: Hero(
  //       tag: product_name,
  //       child: Material(
  //         child: InkWell(
  //             onTap: () => Navigator.of(context).push(new MaterialPageRoute(
  //                 builder: (context) => new IndivItem(
  //                       product_detail_id: product_id,
  //                       product_detail_name: product_name,
  //                       product_detail_image: product_image,
  //                       product_detail_price: product_price,
  //                       product_detail_description: product_description,
  //                     ))),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Expanded(child: Container(
  //                   width: double.infinity,
  //                   alignment: Alignment.topRight,
  //                   decoration: BoxDecoration(
  //                       color: AppColor.bg2color,
  //                       borderRadius: BorderRadius.circular(10),
  //                       image: DecorationImage(
  //                         fit: BoxFit.cover,
  //                         image: NetworkImage(product_image),
  //                       )),
  //                   child: IconButton(
  //                       onPressed: _toggleFavorite,
  //                       icon: (_isFavorited
  //                           ? const Icon(Icons.favorite)
  //                           : const Icon(Icons.favorite_border)),
  //                       color: AppColor.red),
  //                 )),
  //                 Expanded(
  //                     child: Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 20),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         product_name,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black,
  //                           fontSize: 19
  //                         ),
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             "\$ $product_price",
  //                             overflow: TextOverflow.ellipsis,
  //                             style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.red, fontSize: 17),
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ))
  //               ],
  //             )),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Catégories",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              ItemList(),
              // Container(
              //   height: 170,
              //   width: double.infinity,
              //   padding: const EdgeInsets.only(left: 20),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         MostPopularCard(
              //           image: Image.asset(
              //             "assets/images/pizza4.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //           name: "Nos Pizza",
              //         ),
              //         SizedBox(
              //           width: 30,
              //         ),
              //         MostPopularCard(
              //           name: "Nos Burger",
              //           image: Image.asset(
              //             "assets/images/hamburger.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         SizedBox(
              //           width: 30,
              //         ),
              //         MostPopularCard(
              //           name: "Nos Plats",
              //           image: Image.asset(
              //             "assets/images/plat.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         SizedBox(
              //           width: 30,
              //         ),
              //         MostPopularCard(
              //           name: "Nos Sandwichs",
              //           image: Image.asset(
              //             "assets/images/hamburger.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         SizedBox(
              //           width: 30,
              //         ),
              //         MostPopularCard(
              //           name: "Nos Salades",
              //           image: Image.asset(
              //             "assets/images/salade.jpeg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         SizedBox(
              //           width: 30,
              //         ),
              //         MostPopularCard(
              //           name: "Nos Soupes",
              //           image: Image.asset(
              //             "assets/images/soupes.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         SizedBox(
              //           width: 30,
              //         ),
              //         MostPopularCard(
              //           name: "Nos Boissons",
              //           image: Image.asset(
              //             "assets/images/boissons.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Les Produits Disponibles",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Voir tout"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Expanded(
                child: FutureBuilder(
                    future: fetchContacts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              final record =
                              snapshot.data[index] as Map<String, dynamic>;
                              return buildListItem(record);
                            });
                      } else {
                        if (snapshot.hasError)
                          return Text('Unable to fetch data');
                        return CircularProgressIndicator(
                            strokeWidth: 3, color: AppColor.red);
                      }
                    }),
              )
            ],
          ),
        )
      ],
    );
  }
}


class CategoryCard extends StatelessWidget {
  final String _name;
  final Image _image;

  const CategoryCard({
    required Image image,
    required String name,
  })  : _image = image,
        _name = name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4
              ?.copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}

class MostPopularCard extends StatelessWidget {
  final String _name;
  final Image _image;

  const MostPopularCard({
    required String name,
    required Image image,
  })  : _name = name,
        _image = image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          _name,
          style: Helper.getTheme(context).headline3,
        ),
        // Row(
        //   children: [
        //     Text("Café"),
        //     SizedBox(
        //       width: 5,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(bottom: 5.0),
        //       child: Text(
        //         ".",
        //         style: TextStyle(
        //           color: AppColor.red,
        //           fontWeight: FontWeight.w900,
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 5,
        //     ),
        //     Text("Food"),
        //     SizedBox(
        //       width: 20,
        //     ),
        //     Image.asset(
        //       "assets/images/star_filled.png",
        //       color: AppColor.red,
        //     ),
        //     SizedBox(
        //       width: 5,
        //     ),
        //     Text(
        //       "4.1",
        //       style: TextStyle(
        //         color: AppColor.red,
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }
}
