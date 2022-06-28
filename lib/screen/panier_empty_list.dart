import 'package:flutter/material.dart';
import 'package:signin_signup/const/colors.dart';

import 'HomeScreen.dart';

class PanierEmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child:  SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image(
                    image: AssetImage('assets/images/cartEmptyy.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Aucun article dans votre panier ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.red, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ajoutez à votre panier ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              child: MaterialButton(
                height: 60,
                minWidth: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: AppColor.red)),
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                },
                child: new Text(
                  "Retourner à la page Home",
                  style: TextStyle(color: Colors.white),
                ),
                color: AppColor.red,
              )
              ),
        ],
      ),
    );
  }
}
