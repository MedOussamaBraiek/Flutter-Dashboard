import 'package:dashboard_app/Components/app_bar/app_bar_widget.dart';
import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Components/drawer/drawer_page.dart';
import 'package:dashboard_app/Components/panel_center/panel_center_page.dart';
import 'package:dashboard_app/Components/panel_left/panel_left_page.dart';
import 'package:dashboard_app/Components/panel_right/panel_right_page.dart';
import 'package:dashboard_app/Pages/Home.dart';
import 'package:dashboard_app/Pages/auth_page.dart';
import 'package:dashboard_app/Pages/login.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/Services/auth.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  int _currentIndex = 0;

  final List<Widget> _icons = const[
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Data>(context).isDark;
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center (child: CircularProgressIndicator(),);
        }
        else if (snapshot.hasError) {
          return const Center (child: Text("Something went wrong!"),);
        }
        else if(snapshot.hasData){
          return const HomePage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}