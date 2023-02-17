import 'package:dashboard_app/Components/app_bar/app_bar_widget.dart';
import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/Services/auth.dart';
import 'package:dashboard_app/Services/google_auth.dart';
//import 'package:dashboard_app/Services/google_auth.dart';
import 'package:dashboard_app/main.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickSignUp;
  const LoginPage({
    Key? key,
    required this.onClickSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();


  Widget _entryField(
    String title,
    TextEditingController controller
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }


  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Data>(context);
    bool isLogged = Provider.of<Data>(context).isLogged;
    bool lighMode = Provider.of<Data>(context).isDark;

    Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      );
      data.login();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

   Widget _title(){
    return  Text('Welcome!',style: 
    TextStyle(
      fontSize: 24, 
      fontWeight: FontWeight.bold,
      color: lighMode ? Constants.purpleLight : Colors.white  
      ),
    );
  }

  Widget _subTitle(){
    return  Text('Please Login!',style: TextStyle(fontSize: 16,
    color: lighMode ? Constants.purpleLight : Colors.white ),);
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      );
      data.login();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword, 
      child: Text(isLogin ? 'Login' : 'Register'),
      );
  }


    
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(double.infinity, 70),
      child: (ResponsiveLayout.isTinyHeightLimit(context) || 
      ResponsiveLayout.isTinyLimit(context) 
      ? Container() : const AppBarWidget()),),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(), 
              const SizedBox(height: 24,),
              _subTitle(), 
              const SizedBox(height: 20,),
              TextField(
                style: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white, fontSize:14 ),
                controller: _controllerEmail,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white )
                ),
              ),
              const SizedBox(height: 4,),
              TextField(
                style: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white, fontSize:14 ),
                controller: _controllerPassword,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white )
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              Container(
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Constants.pink.withOpacity(0.9),
                       Constants.yellow.withOpacity(0.9),
                       ]
                  ),
                ),
                child:  ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Constants.yellow.withOpacity(0.9),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  signIn();
                  data.login();
                  }, 
                icon: const Icon(Icons.lock_open, size: 32,), 
                label: const Text('Sign In',
                style: TextStyle(fontSize: 24),)),
              ),
             
              // _entryField('email', _controllerEmail),
              // _entryField('password', _controllerPassword),
              // _errorMessage(),
              // _submitButton(),
              // _loginOrRegisterButton(),
        
              const SizedBox(height: 20,),
              Container(
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Constants.pink.withOpacity(0.9),
                       Constants.yellow.withOpacity(0.9),
                       ]
                  ),
                ),
                child:  ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Constants.pink.withOpacity(0.9),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  final provider = Provider.of<GoogleService>(context, listen: false);
                  print(provider.name);
                  showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(child: CircularProgressIndicator(),),
                    );
                  try{
                      provider.googleLogin();
                      data.login();
                  } on FirebaseAuthException catch(e) {print(e);}
                  
                  navigatorKey.currentState!.popUntil((route) => route.isFirst);
                  }, 
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text('Google Sign In',
                style: TextStyle(fontSize: 24),)),
              ),
        
              const SizedBox(height: 24,),
              RichText(
                text:  TextSpan(
                  style: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white, fontSize: 14),
                  text: "Don't Have an account?  ",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickSignUp,
                      text: 'Sign up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color:lighMode ? Constants.purpleLight : Colors.white,
                      )
                    )
                  ]
                )
                )
              ]
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator(),),
    );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _controllerEmail.text.trim(), 
    password: _controllerPassword.text.trim(),);
  } on FirebaseAuthException catch (e) {
    print(e);
  }

  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
}

