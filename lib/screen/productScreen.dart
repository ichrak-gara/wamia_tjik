import 'package:flutter/material.dart';
import 'package:test1/sellers.dart';
import 'package:test1/widgets/bottomNavBar.dart';
import '../const/colors.dart';
import 'main.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = "/productScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bg2color,
        title: Text("Les Produit", style: TextStyle(color: Colors.black, fontSize: 18),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SellersScreen.routeName);
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Future<dynamic> fetchContacts() {
    return orpc.callKw({
      'model': 'product.template',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': ['id', 'name', 'email', '__last_update', 'image_128'],
        'limit': 80,
      },
    });
  }

  Widget buildListItem(Map<String, dynamic> record) {
    var unique = record['__last_update'] as String;
    unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
    final avatarUrl =
        '${orpc.baseURL}/web/image?model=product.template&field=image&id=${record["id"]}&unique=$unique';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: Image.network(avatarUrl, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        Expanded(child: Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                record['name'],
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        )
        )
      ],
    );
  }

  // Widget buildListItem(Map<String, dynamic> record) {
  //   var unique = record['__last_update'] as String;
  //   unique = unique.replaceAll(RegExp(r'[^0-9]'), '');
  //   final avatarUrl =
  //       '${orpc.baseURL}/web/image?model=product.template&field=image&id=${record["id"]}&unique=$unique';
  //
  //   return ListTile(
  //     leading: CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
  //     title: Text(record['name']),
  //     subtitle: Text(record['email'] is String ? record['email'] : ''),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Restaurants",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Voir tout",
                          style: TextStyle(color: AppColor.red),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: InkWell(
                  onTap: () {
                    print('I got clicked');
                    // Navigator.of(context).pushReplacementNamed(ProductScreen.routeName);
                  },
                  child: FutureBuilder(
                      future: fetchContacts(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                final record =
                                snapshot.data[index] as Map<String, dynamic>;
                                return buildListItem(record);
                              });
                        } else {
                          if (snapshot.hasError) return Text('Unable to fetch data');
                          return CircularProgressIndicator(color: AppColor.red);

                        }
                      }),
                ),
              )
            ],

          ),
        )
      ],
    );
  }
}