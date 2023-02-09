import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: const Color(0xFF161717),
    cardColor: Colors.white,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),

    
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: const Color(0xFF1E1F25),
    cardColor: const Color(0xff1E1F25),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xff282C32)),

   
  );
}

class TTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headline1:  TextStyle(
       color: Color(0xff131215),
      fontSize: 20, 
      fontWeight: FontWeight.bold),
    headline2:  TextStyle(
      color:  Color(0xff01102C),
      fontSize: 18,
      fontWeight: FontWeight.w700,
      //    height: 23
    ),
    headline3:  TextStyle(
      color:  Color(0xff131B4C),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headline4:  TextStyle(
      color:  Color(0xff131B4C),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    headline5:  TextStyle(
      color:  Color(0xff232C34),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headline6:  TextStyle(
      color:  Color(0xff286286),
      fontSize: 15.42,
      fontWeight: FontWeight.w600,
    ),
  );

static TextTheme darkTextTheme = const TextTheme(
    headline1:  TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
      fontSize: 20, 
      fontWeight: FontWeight.bold),
    headline2:  TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      //    height: 23
    ),
    headline3:  TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headline4:  TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    headline5:  TextStyle(
      color:  Color(0xffBFC6CC),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headline6:  TextStyle(
      color:  Color(0xffF0F9FF),
      fontSize: 15.42,
      fontWeight: FontWeight.w600,
    )
  );
}