import 'package:flutter/material.dart';
import 'package:signin_signup/screen/loginScreen.dart';
import 'package:signin_signup/screen/sendSmsScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/forgetPwSreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgcolor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          },
        ),
      ),
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 60,
            ),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                CustomTextInput(hintText: "Email"),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          StadiumBorder(
                            side: BorderSide(color: AppColor.red, width: 1.5),
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(SendSmsScreen.routeName);

                    },
                    child: Text("Send"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
