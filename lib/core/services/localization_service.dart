import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    loadLocale();
  }

  Locale _locale = Locale(
    'ar',
  ); // Use a private field to encapsulate the state.

  Locale get locale => _locale; // Provide a getter for the locale.

  void changeLocale(Locale locale) async {
    _locale = locale; // Update the class field here.

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isArabic', locale.languageCode == 'ar');
    notifyListeners();
  }

  loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isArabic = prefs.getBool('isArabic') ?? false;
    _locale = isArabic ? Locale('ar') : Locale('en');
    notifyListeners();
  }
}
