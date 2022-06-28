


import 'package:signin_signup/providers/page_provider.dart';
import 'package:signin_signup/providers/setting_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:signin_signup/providers/onboard_providers.dart';
import 'package:signin_signup/providers/theme_provider.dart';

class AppProviders {
  // static AppProviders _instance;
  // static AppProviders get instance {
  //   _instance ??= AppProviders._init();
  //   return _instance;
  // }
  //
  // AppProviders._init();

  static AppProviders _instance = AppProviders._init();

  static AppProviders get instance{
    _instance = AppProviders._init();
    return _instance;
  }

  AppProviders._init();


  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => OnboardProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SettingPageProvider(),
    ),
  ];
}
