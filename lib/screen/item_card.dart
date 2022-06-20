import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';


class ItemCard extends StatelessWidget {
  final String title, svgSrc;
  final Function press;

  const ItemCard({Key? key,
    required this.title,
    required this.svgSrc,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left:20, right: 15, top: 1 ,bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,4),
            blurRadius: 15,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: PrimaryColor.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  svgSrc,
                  width: size.width * 0.18,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 10),
            ],),
          ),
        ),
      ),
    );
  }
}
