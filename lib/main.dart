import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/screen/HomeScreen.dart';
import 'package:signin_signup/screen/alimentScreen.dart';
import 'package:signin_signup/screen/boissonScreen.dart';
import 'package:signin_signup/screen/dessertScreen.dart';
import 'package:signin_signup/screen/forgetPwScreen.dart';
import 'package:signin_signup/screen/individualItem.dart';
import 'package:signin_signup/screen/introScreen.dart';
import 'package:signin_signup/screen/loginScreen.dart';
import 'package:signin_signup/screen/menuScreen.dart';
import 'package:signin_signup/screen/moreScreen.dart';
import 'package:signin_signup/screen/newPwScreen.dart';
import 'package:signin_signup/screen/profilScreen.dart';
import 'package:signin_signup/screen/promotionScreen.dart';
import 'package:signin_signup/screen/sendSmsScreen.dart';
import 'package:signin_signup/screen/signUpScreen.dart';
import 'package:signin_signup/screen/splash_screen.dart';
import 'screen/landingScreen.dart';


void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  Color _primaryColor = HexColor('#DBE3D8');
  Color _accentColor = HexColor('#DBE3D8');
  Color _redcolor = HexColor('#e74432');
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login App',
      theme: ThemeData(
        fontFamily: "Metropolis",
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: _primaryColor,
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.red,
            ),
            shape: MaterialStateProperty.all(StadiumBorder()),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColor.primary, fontSize: 29),
          headline3: TextStyle(color: AppColor.primary, fontSize: 16, fontWeight: FontWeight.bold),
          headline4: TextStyle(color: AppColor.secondary, fontWeight: FontWeight.bold),
          headline5: TextStyle(color: AppColor.primary, fontSize: 25, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendSmsScreen.routeName: (context) => SendSmsScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfilScreen.routeName: (context) => ProfilScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        AlimentScreen.routeName: (context) => AlimentScreen(),
        BoissonScreen.routeName: (context) => BoissonScreen(),
        DessertScreen.routeName: (context) => DessertScreen(),
        PromotionScreen.routeName: (context) => PromotionScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),



      },
    );
  }
}
