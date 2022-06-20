import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_signup/const/colors.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
            color: AppColor.SecondaryColor.withOpacity(0.60)
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search_sharp),
          hintText: "Search Here ",
          hintStyle: TextStyle(color: AppColor.SecondaryColor),
        ),
      ),
    );
  }
}
