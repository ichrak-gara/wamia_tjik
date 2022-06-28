import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;

  switchTheeme() async {
    _isDark = !_isDark;

    notifyListeners();
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('theme') == null) {
      _isDark = false;
    } else {
      _isDark = prefs.getBool('theme');
    }
  }

  bool get isDark => _isDark;
}
