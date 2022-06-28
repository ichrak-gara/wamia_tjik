import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/CartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mon Panier',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(null),
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
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 20.0)
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("Totale:"),
              subtitle: new Text("\$200"),
            )),
            Expanded(
                child: new MaterialButton(
                  height: 50,
                  minWidth: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: AppColor.red)
                  ),
                  onPressed: () {},
              child: new Text(
                "Passer votre Commande",
                style: TextStyle(color: Colors.white),
              ),
              color: AppColor.red,
            ))
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mes produits",
                  style: TextStyle(
                    fontSize: 18,
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
          SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 80,
                          height: 80,
                          child: Image.asset("assets/images/emptyPanier.png"),
                          // child: Image.network(widget.prod_det_image??'default value'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('default value',
                              style: Helper.getTheme(context).headline3,
                              ),
                              Row(
                                children: [
                                  Text("Food"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/star_filled.png",
                                    color: AppColor.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      color: AppColor.red,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Notes')
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ),
                // RecentItemCard(
                //     image: Image.asset(
                //       "assets/images/tacos.jpeg",
                //       fit: BoxFit.cover,
                //     ),
                //     name: "Tacos"),
                // RecentItemCard(
                //     image: Image.asset(
                //       "assets/images/makloub.jpg",
                //       fit: BoxFit.cover,
                //     ),
                //     name: "Makloub"),
              ],
            ),
          )
        ],
      )
    );
  }
}

// class RecentItemCard extends StatelessWidget {
//   final String _name;
//   final Image _image;
//
//   const RecentItemCard({
//     required String name,
//     required Image image,
//   })  : _name = name,
//         _image = image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//             width: 80,
//             height: 80,
//             child: _image,
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: Container(
//             height: 100,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _name,
//                   style: Helper.getTheme(context).headline3,
//                 ),
//                 Row(
//                   children: [
//                     Text("Food"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       "assets/images/star_filled.png",
//                       color: AppColor.red,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "4.9",
//                       style: TextStyle(
//                         color: AppColor.red,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text('Notes')
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }


