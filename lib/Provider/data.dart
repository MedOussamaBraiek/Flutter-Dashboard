
import 'package:dashboard_app/Provider/mytheme_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  late bool _isDark = true;
  late MyThemePreferences _preferences;
  bool get isDark => _isDark;

  ModelTheme() {
    _isDark = true;
    _preferences = MyThemePreferences();
    getPreferences();
  }

  void changeMode(){
    _isDark =! _isDark;
    notifyListeners();
  }

  //Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}