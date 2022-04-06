import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import 'forgetPwScreen.dart';
import 'newPwScreen.dart';

class SendSmsScreen extends StatelessWidget {
  static const routeName = "/sendSms";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgcolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'We have sent you an SMS to your Mobile',
                  style: Helper.getTheme(context).headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please check your mobile number 23*****9 continue to reset your password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SMSInput(),
                    SMSInput(),
                    SMSInput(),
                    SMSInput(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(NewPwScreen.routeName);
                    },
                    child: Text("Next"),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't Recieve? "),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: AppColor.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class SMSInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 20),
            child: Text(
              "*",
              style: TextStyle(fontSize: 45),
            ),
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
