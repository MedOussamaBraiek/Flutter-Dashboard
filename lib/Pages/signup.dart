import 'package:dashboard_app/Components/app_bar/app_bar_widget.dart';
import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/Services/auth.dart';
import 'package:dashboard_app/main.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class SingUpPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const SingUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key:key);
  

  @override 
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {

  String? errorMessage = '';
  bool isLogin = true;

  final formKey = GlobalKey<FormState>();
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

     Widget _title(){
    return Text('Welcome!',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
    color: lighMode ? Constants.purpleLight : Colors.white),);
  }

  Widget _subTitle(){
    return Text('Please SignUp!',style: TextStyle(fontSize: 16,
    color: lighMode ? Constants.purpleLight : Colors.white),);
  }

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
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _title(), 
                const SizedBox(height: 24,),
                _subTitle(),
                const SizedBox(height: 20,),
                TextFormField(
                  style: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white, fontSize:14 ),
                  controller: _controllerEmail,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white )
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) => 
                    email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
                ),
                const SizedBox(height: 4,),
                TextFormField(
                  style: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white, fontSize:14 ),
                  controller: _controllerPassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color:lighMode ? Constants.purpleLight : Colors.white )
                  ),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => 
                    value != null && value.length < 6
                    ? 'Passwords must be at least 6 characters'
                    : null,
                ),
                const SizedBox(height: 20,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Constants.yellow.withOpacity(0.9),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: (){
                    signUp();
                    data.login();
                    }, 
                  
                  icon: const Icon(Icons.lock_open, size: 32,), 
                  label: const Text('Sign up',
                  style: TextStyle(fontSize: 24),)),
                // _entryField('email', _controllerEmail),
                // _entryField('password', _controllerPassword),
                // _errorMessage(),
                // _submitButton(),
                // _loginOrRegisterButton(),
                const SizedBox(height: 24,),
                RichText(
                  text:  TextSpan(
                    style:  TextStyle(color:lighMode ? Constants.purpleLight : Colors.white, fontSize: 14),
                    text: "Already Have an account?  ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                        text: 'Logi In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color:lighMode ? Constants.purpleLight : Colors.white
                          
                        )
                      )
                    ]
                  )
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    showDialog(context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator(),),
    );

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _controllerEmail.text.trim(), 
    password: _controllerPassword.text.trim(),);
  } on FirebaseAuthException catch (e) {
    print(e);

    Utils.showSnackBar(e.message);
  }

  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
}

class Utils {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if(text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

    // messengerKey.currentState!
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }
}

