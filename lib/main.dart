import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: const DarklightTheme(),
    );
  }
}


class DarklightTheme extends StatefulWidget {
  const DarklightTheme({Key? key}) : super(key: key);

  @override
  State<DarklightTheme> createState() => _DarklightThemeState();
}

class _DarklightThemeState extends State<DarklightTheme> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Data>(context).isDark;
    print(darkMode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: darkMode ? const Color(0xFFF5F8FF) : Constants.purpleDark,
        canvasColor: darkMode ? Colors.white : Constants.purpleLight
      ),
      // theme: darkMode 
      // ? ThemeData(brightness: Brightness.dark)
      // : ThemeData(brightness: Brightness.light),
      home: const WidgetTree(),
    );
  }
}

  
