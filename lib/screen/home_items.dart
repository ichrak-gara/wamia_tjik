import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/item_model.dart';

class HomeItems extends StatefulWidget {
  static const routeName = '/HomeItem';

  @override
  _HomeItemsState createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  Future<void> _launchinbrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    final itemElements = Provider.of<ItemModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              itemElements.image,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            FlatButton(
              onPressed: () {
                // _launchinbrowser(
                //   (itemElements.url),
                // );
              },
              child: Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        itemElements.title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    // Text(
                    //   itemElements.describtion,
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(18.0),
                              onTap: () async {
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => FeedDialog(
                                //     itemId: itemElements.id,
                                //   ),
                                // );
                              },
                              child: Icon(
                                Icons.more_horiz_sharp,
                                color: Colors.blue,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}