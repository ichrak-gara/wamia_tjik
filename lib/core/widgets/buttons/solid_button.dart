import 'package:flutter/material.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/core/core_shelf.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double width;
  final double height;
  final Widget suffixIcon;
  final Widget prefixIcon;

  const SolidButton(
      {required Key key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      required this.width,
      required this.height,
      required this.suffixIcon,
      required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? hh(context, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixIcon ?? Container(width: ww(context, 24)),
          Text(
            text,
            //style: head18(context, textColor),
          ),
          suffixIcon ?? Container(width: ww(context, 24)),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(hh(context, 40)),
        color: bgColor,
      ),
    );
  }
}

class SolidBorderedButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  // final double width;
  // final double height;
  // final Widget suffixIcon;
  // final Widget prefixIcon;
  final Function() onTap;

  const SolidBorderedButton({

    required this.text,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    // required this.width,
    // required this.height,
    // required this.suffixIcon,
    // required this.prefixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.red,
      borderRadius: BorderRadius.circular(hh(context, 20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(hh(context, 20)),
        child: Container(
          width: double.infinity,
          height: 40,
          // width: width ?? double.infinity,
          // height: height ?? hh(context, 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // prefixIcon ?? Container(width: ww(context, 24)),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,

                ),
                //style: head18(context, textColor),
              ),
              // suffixIcon ?? Container(width: ww(context, 24)),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(hh(context, 40)),
            border: Border.all(
              width: hh(context, 2),
              color: borderColor,
            ),
          ),
        ),
      ),
    );
  }
}
