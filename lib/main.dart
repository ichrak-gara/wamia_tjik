// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/location_controller.dart';
import 'package:signin_signup/providers/providers.dart';
import 'package:signin_signup/screen/HomeScreen.dart';
import 'package:signin_signup/screen/alimentScreen.dart';
import 'package:signin_signup/screen/basket.dart';
import 'package:signin_signup/screen/boissonScreen.dart';
import 'package:signin_signup/screen/cart.dart';
import 'package:signin_signup/screen/dessertScreen.dart';
import 'package:signin_signup/screen/favoriteScreen.dart';
import 'package:signin_signup/screen/forgetPwScreen.dart';
import 'package:signin_signup/screen/home.dart';
import 'package:signin_signup/screen/home_items.dart';
import 'package:signin_signup/screen/indivItem.dart';
import 'package:signin_signup/screen/individualItem.dart';
import 'package:signin_signup/screen/introScreen.dart';
import 'package:signin_signup/screen/loginScreen.dart';
import 'package:signin_signup/screen/map_screen.dart';
import 'package:signin_signup/screen/menuScreen.dart';
import 'package:signin_signup/screen/moreScreen.dart';
import 'package:signin_signup/screen/navBar.dart';
import 'package:signin_signup/screen/newPwScreen.dart';
import 'package:signin_signup/screen/cartScreen.dart';
import 'package:signin_signup/screen/productScreen.dart';
import 'package:signin_signup/screen/profilScreen.dart';
import 'package:signin_signup/screen/promotionScreen.dart';
import 'package:signin_signup/screen/restoProfile.dart';
import 'package:signin_signup/screen/search.dart';
import 'package:signin_signup/screen/sendSmsScreen.dart';
import 'package:signin_signup/screen/shop.dart';
import 'package:signin_signup/screen/signUpScreen.dart';
import 'package:signin_signup/screen/splash_screen.dart';
import 'package:signin_signup/screen/landingScreen.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:odoo/odoo.dart';

import 'provider/favorite_provider.dart';
import 'provider/item_provider.dart';
import 'core/core_shelf.dart' as core;


final orpc = OdooClient('http://localhost:8069/');
var session = FlutterSession();

var emailController = TextEditingController();
var passwordControllor = TextEditingController();

// void main() async {
//   final session = await orpc.authenticate(
//       'test',
//       'ichrakgara3012@gmail.com',
//       'ichrak3012'
//   );
//   final res = await orpc.callRPC('/web/session/modules', 'call', {});
//   // runApp(MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await orpc.authenticate('wamiafood1', 'ghassen.haouala19@gmail.com', '1234');
  // print(orpc.sessionId);
  //await orpc.checkSession();
  // await core.LocalManager.prefrencesInit();

  runApp(
    MultiProvider(
      providers: [...?core.AppProviders.instance?.dependItems],
      child: ChangeNotifierProvider(
        create: (context) => Cart(),
        child: ChangeNotifierProvider(
          create: (context) => Carte(),
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Color _primaryColor = HexColor('#DBE3D8');
  Color _accentColor = HexColor('#DBE3D8');
  Color _redcolor = HexColor('#e74432');
  bool dark = false;

  @override
  void initState() {
    print(dark);
    dark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, core.ThemeProvider theme, Widget child) {
      theme.load();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wamia Tjik',
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
        //home: Home(),
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
          NavBar.routeName: (context) => NavBar(),
          IndividualItem.routeName: (context) => IndividualItem(),
          IndivItem.routeName: (context) => IndivItem(),
          ProductScreen.routeName: (context) => ProductScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          MapScreen.routeName: (context) => MapScreen(),
          SellerProfileScreen.routeName: (context) => SellerProfileScreen(),
          Home.routeName: (context) => Home(),
          HomeItems.routeName: (context) => HomeItems(),
          Basket.routeName: (context) => Basket(),
          FavoriteScreen.routeName: (context) => FavoriteScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),

        },
      );
    });
  }
}


