import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';
  late SharedPreferences langPref;

  Future<void> getLang() async {
    langPref = await SharedPreferences.getInstance();
    if (langPref.getBool('isArabic') ?? false) {
      appLanguage = 'ar';
    } else {
      appLanguage = 'en';
    }
  }

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    bool isArabic = appLanguage == 'ar';
    _saveLang(isArabic);
  }

  void _saveLang(bool isArabic) {
    langPref.setBool('isArabic', isArabic);
  }
}
