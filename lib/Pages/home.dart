import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dashboard_app/Components/app_bar/app_bar_widget.dart';
import 'package:dashboard_app/Components/drawer/drawer_page.dart';
import 'package:dashboard_app/Components/panel_center/panel_center_page.dart';
import 'package:dashboard_app/Components/panel_left/panel_left_page.dart';
import 'package:dashboard_app/Components/panel_right/panel_right_page.dart';
import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Data>(context).isDark;
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(double.infinity, 70),
      child: (ResponsiveLayout.isTinyHeightLimit(context) || 
      ResponsiveLayout.isTinyLimit(context) 
      ? Container() : const AppBarWidget()),),

      body: ResponsiveLayout(
        tiny: Container(),
        phone: _currentIndex == 0 ? const PanelLeftPage() : _currentIndex == 1 ? const PanelCenterPage() : const PanelRightPage(),
        tablet: Row(children: const [
          Expanded(child: PanelLeftPage()),
           Expanded(child: PanelCenterPage()),
        ]),
        largeTablet: Row(children: const [
           Expanded(child: PanelLeftPage()),
           Expanded(child: PanelCenterPage()),
           Expanded(child: PanelRightPage()),
        ]),
        computer: 
        Row(children:  [
          Expanded(child: DrawerPage()),
          const Expanded(child: PanelLeftPage()),
          const Expanded(child: PanelCenterPage()),
          const Expanded(child: PanelRightPage()),
        ]),
      ),

      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context) 
      ? CurvedNavigationBar(
          color: darkMode ? const Color(0xFFF5F8FF) : Constants.purpleLight ,
          //color: darkMode ? Constants.purpleDark : const Color(0xFFF5F8FF),
          items: [
            Icon(Icons.add, size: 30, color: darkMode ? Constants.purpleDark : Colors.white),
    Icon(Icons.list, size: 30, color: darkMode ? Constants.purpleDark : Colors.white ),
    Icon(Icons.compare_arrows, size: 30, color: darkMode ? Constants.purpleDark : Colors.white ),
          ], 
          index: _currentIndex,
          backgroundColor: darkMode ? Colors.white :Constants.purpleDark,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          )
      : const SizedBox()
    );
  }
}