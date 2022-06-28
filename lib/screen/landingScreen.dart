import 'package:flutter/material.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/screen/signUpScreen.dart';
import 'package:signin_signup/utils/helper.dart';
import 'loginScreen.dart';


class LandingScreen extends StatelessWidget {
  static const routeName = "/LandingScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                    "assets/images/splashIcon.png",
                    fit: BoxFit.fill
                )
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: CustomClipperAppBar(),
                child: Container(
                  width: double.infinity,
                  height: Helper.getScreenHeight(context)*0.5,
                  decoration: ShapeDecoration(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/login_bg.png",
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo_app.png",
              height: 160,
              width: 150,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.4,
                padding: const EdgeInsets.symmetric(horizontal: 58),
                child: Column(
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme.headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: "Wamia", style: TextStyle(color: Colors.grey, fontSize: 50),
                            ),
                            TextSpan(text: "Tjik", style: TextStyle(color: Colors.red, fontSize: 50),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Flexible(
                      child: Text(
                        "Food Delivery",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                StadiumBorder(
                                  side: BorderSide(color: Colors.red, width: 1.5),
                                )
                            ),
                          ),
                        onPressed: () {
                            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: Text("Login"),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(
                              side: BorderSide(color: AppColor.red, width: 1.5),
                            )
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Text("Create an Account"),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

