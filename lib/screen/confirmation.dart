
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup/extensions/image_path.extension.dart';

import '../const/colors.dart';
import '../core/init/metrics.dart';
import '../core/init/navigate.dart';
import '../core/widgets/buttons/solid_button.dart';
import '../widgets/base.dart';
import 'history.dart';

class Confirmation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Base(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: hh(context, 50)),
          horizontalpadding(
            context,
            child: Text(
              "Wamia u tjik",
              //style: head36(context, AppColors.primary),
            ),
          ),
          SizedBox(height: hh(context, 50)),
          horizontalpadding(
            context,
            child: Text(
              "KALAMNA",
              //style: head36(context, textPrimary(context)),
            ),
          ),
          SizedBox(height: hh(context, 50)),
          Container(
            width: w(context),
            padding: EdgeInsets.symmetric(horizontal: w20(context)),
            child: Row(
              children: [
                SvgPicture.asset(
                  "Phone".toIcon,
                  width: ww(context, 22),
                  color: AppColor.primary,
                ),
                SizedBox(width: w20(context)),
                Text(
                  "+216 94297100\n+216 96734519",
                  //style: body(context, textPrimary(context)),
                ),
              ],
            ),
          ),
          SizedBox(height: hh(context, 30)),
          Container(
            width: w(context),
            padding: EdgeInsets.symmetric(horizontal: w20(context)),
            child: Row(
              children: [
                SvgPicture.asset(
                  "Email Sent".toIcon,
                  width: ww(context, 22),
                  color: AppColor.primary,
                ),
                SizedBox(width: w20(context)),
                Text(
                  "support@dmak.com",
                  //style: body(context, textPrimary(context)),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(height: hh(context, 50)),
          SolidBorderedButton(
            onTap: () {
              pushTo(context, Hisotry());
            },
            text: "Mrigel",
            bgColor: AppColor.primary,
            borderColor: AppColor.primary,
            textColor: AppColor.white,
          ),
          SizedBox(height: hh(context, 50)),
        ],
      ),
    );
  }
}
