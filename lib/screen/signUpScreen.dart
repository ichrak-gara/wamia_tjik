import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';
import 'landingScreen.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName ='/signUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgcolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
            },
          ),
        ),
        body: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: Helper.getTheme(context).headline6,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Add your details to sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextInput(hintText: "Name"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(hintText: "Email"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(hintText: "Mobile Number"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(hintText: "Address"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(hintText: "Password"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(hintText: "Confirm Password"),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                            const StadiumBorder(
                              side: BorderSide(color: AppColor.red, width: 1.5),
                            )
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Sign Up"),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account?",
                        ),
                        Text(
                          "   Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
