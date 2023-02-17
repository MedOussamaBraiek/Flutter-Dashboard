
import 'package:dashboard_app/Provider/mytheme_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Data extends ChangeNotifier {
  late bool _isDark = true;
  late MyThemePreferences _preferences;
  bool get isDark => _isDark;

  bool isLogged = false;
  bool snapshot = false;

  bool isSales = false;
  bool isProfits = false;
  bool isUsers = false;
  bool isDevices = false;
  bool isTasks = false;

  //late GoogleService googleSignIn;

  void login() {
    isLogged = true;
    notifyListeners();
  }

  void logout() {
    isLogged = false;
    notifyListeners();
  }

  void setSnapshot() {
    snapshot = !snapshot;
    notifyListeners();
  }

  void setHome() {
    isSales = false;
    isProfits = false;
    isDevices = false;
    isUsers = false;
    isTasks = false;
    notifyListeners();
  }

  void setSales() {
    isSales = true;
    isProfits = false;
    isDevices = false;
    isUsers = false;
    isTasks = false;
    notifyListeners();
  }

  void setProfits() {
    isProfits = true;
    isSales = false;
    isDevices = false;
    isUsers = false;
    isTasks = false;
    notifyListeners();
  }

  void setDevices() {
    isProfits = false;
    isSales = false;
    isDevices = true;
    isUsers = false;
    isTasks = false;
    notifyListeners();
  }

  void setUsers() {
    isProfits = false;
    isSales = false;
    isDevices = false;
    isUsers = true;
    isTasks = false;
    notifyListeners();
  }

  void setTasks() {
    isProfits = false;
    isSales = false;
    isDevices = false;
    isUsers = false;
    isTasks = true;
    notifyListeners();
  }


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

// class GoogleService extends ChangeNotifier{

//   final googleSignIn = GoogleSignIn();

//   GoogleSignInAccount? _user;

//   GoogleSignInAccount get user => _user!;


//   Future googleLogin() async {

//     final googleUser = await googleSignIn.signIn();
//     if(googleUser == null) return;
//     _user = googleUser;

//     final googleAuth = await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     await FirebaseAuth.instance.signInWithCredential(credential);

//     notifyListeners();
//   }

// }