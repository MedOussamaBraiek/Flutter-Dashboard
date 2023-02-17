import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleService extends ChangeNotifier{

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  String name = "Oussama";


  Future googleLogin() async {

    print("hello");

    try{
      final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return;
    _user = googleUser;

    print("hello1");

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e) {
      print(e.toString());
    }

    print("hello2");

    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}