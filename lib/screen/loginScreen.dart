import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/screen/HomeScreen.dart';
import 'package:signin_signup/screen/signUpScreen.dart';
import 'package:signin_signup/utils/helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/customTextInput.dart';
import 'forgetPwScreen.dart';
import 'introScreen.dart';
import 'landingScreen.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";
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

        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),

        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 40,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: Helper.getTheme(context).headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Add your details to Login'),
                  SizedBox(height:50),
                  CustomTextInput(
                    hintText: "Your Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "Your Password",
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
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
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

                      },
                      child: Text("Login"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
                    },
                    child: Text(
                      "Forget your password",
                      style: TextStyle(
                        color: Color(0xFF367FC0),
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Or Login With", style: TextStyle(
                    color: Colors.black
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFF367FC0),
                        )
                      ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/fb.png"),
                            SizedBox(width: 30,),
                            Text("Login With Facebook")
                          ],
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.lightGreen,
                            )
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/google.png"),
                            SizedBox(width: 30,),
                            Text("Login With Google")
                          ],
                        )),
                  ),
                  SizedBox(height: 150),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text("Don't have an Account ?"),
                        Text("   Sign Up",
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
        ),
      )
    );
  }
}


















