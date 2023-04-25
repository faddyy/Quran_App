import 'package:flutter/material.dart';
import 'package:muslim/core/My_Theme.dart';

class AppProvider extends ChangeNotifier {
  String AppLang = "en";
  ThemeMode themeMode = ThemeMode.light;
  void ChangeAppTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  void ChangeAppLanguage(String language) {
    AppLang = language;
    notifyListeners();
  }

  String changeMainBackground() {
    return themeMode == ThemeMode.light
        ? "assets/images/bg.png"
        : "assets/images/baground_dark.png";
  }
}
