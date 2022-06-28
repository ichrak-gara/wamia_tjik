import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class AppColor {
  static const Color dark = Color.fromARGB(255, 24, 24, 24);
  static Color white01 = Colors.grey.shade300;
  static Color white = Colors.grey.shade200;
  static const Color darkGrey = Color(0xff414141);
  static const Color grey = Color(0xffa3a3a3);


  static const red = Color(0xFFE74432);
  static const redfont = Color(0xFFFACCCC);
  static const primary = Color(0xFF4A4B4D);
  static const secondary = Color(0xFF7C7D7E);
  static const placeholder = Color(0xFFB6B7B7);
  static const placeholderBg = Color(0xFFF2F2F2);
  static const bgcolor = Color(0xFFDBE3D8);
  static const bg2color = Color(0xFFdce2d9);
  static const SecondaryColor = Color(0xFF979797);
  static const gris = Color(0xFFD2D8D0);
  static Color dark2 = Colors.grey.shade800;

}

ThemeProvider themeProvider(BuildContext context) =>
    Provider.of<ThemeProvider>(context, listen: false);

Color bgPrimary(BuildContext context) =>
    themeProvider(context).isDark ? AppColor.dark : AppColor.white;

Color bgSecondary(BuildContext context) =>
    themeProvider(context).isDark ? AppColor.darkGrey : AppColor.grey;

Color textPrimary(BuildContext context) =>
    themeProvider(context).isDark ? AppColor.white : AppColor.dark;
Color bako(BuildContext context) =>
    themeProvider(context).isDark ? AppColor.dark2 : AppColor.white01;
Color textSecondary = AppColor.grey;

Color panier(BuildContext context) =>
    themeProvider(context).isDark ? AppColor.dark : AppColor.white;
