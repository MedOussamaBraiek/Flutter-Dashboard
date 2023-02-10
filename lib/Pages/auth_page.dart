import 'package:dashboard_app/Pages/login.dart';
import 'package:dashboard_app/Pages/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => 
  isLogin ? LoginPage(onClickSignUp: toggle)
  : SingUpPage(onClickedSignIn: toggle);

  void toggle() =>
    setState(() {
      isLogin =!isLogin;
    });
}