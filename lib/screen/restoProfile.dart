import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/screen/HomeScreen.dart';
import 'package:signin_signup/screen/menuScreen.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/bottomNavBar.dart';

class SellerProfileScreen extends StatefulWidget {
  final resto_id;
  final resto_name;
  final resto_image;
  final resto_email;
  final resto_address;
  final resto_country;
  final resto_phone;
  static const routeName = '/ProfileScreen';

  SellerProfileScreen(
      {this.resto_id,
      this.resto_image,
      this.resto_name,
      this.resto_email,
      this.resto_address,
      this.resto_country,
      this.resto_phone});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgcolor,
        title: Text(
          "Détails du restaurant",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Container(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bienvenue chez  ",
                              style: TextStyle(
                                fontSize: 25,
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.resto_name,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: AppColor.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          widget.resto_image,
                          height: 255,
                          width: 375,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "A propos",
                      style: Helper.getTheme(context).headline4?.copyWith(
                            fontSize: 18,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Nom : ',
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 17, color: Colors.redAccent),
                        ),
                        Text(
                          widget.resto_name,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Email : ',
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 17, color: Colors.redAccent),
                        ),
                        Text(
                          widget.resto_email,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Addresse : ',
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 17, color: Colors.redAccent),
                        ),
                        Text(
                          widget.resto_address,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Numéro de Téléphone : ',
                          textAlign: TextAlign.justify,
                          style:
                              TextStyle(fontSize: 17, color: Colors.redAccent),
                        ),
                        Text(
                          widget.resto_phone,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Evaluation",
                          style: Helper.getTheme(context).headline4?.copyWith(
                                fontSize: 18,
                              ),
                        ),
                        SizedBox(width: 220),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/star_filled.png",
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "assets/images/star_filled.png",
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "assets/images/star_filled.png",
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "assets/images/star_filled.png",
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "assets/images/star.png",
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      width: 430,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: AppColor.placeholderBg,
                        shape: StadiumBorder(),
                      ),
                      child: new TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ajouter un commentaire",
                            hintStyle: TextStyle(color: AppColor.placeholder),
                            contentPadding:
                                const EdgeInsets.only(left: 10, top: 15),
                            suffixIcon: Icon(
                              Icons.send,
                              color: AppColor.red,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(width: 210),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed(MenuScreen.routeName);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("consulter le menu"),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward_ios, size: 24.0)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
