import 'package:dashboard_app/app_bar/app_bar_widget.dart';
import 'package:dashboard_app/constants.dart';
import 'package:dashboard_app/drawer/drawer_page.dart';
import 'package:dashboard_app/panel_center/panel_center_page.dart';
import 'package:dashboard_app/panel_left/panel_left_page.dart';
import 'package:dashboard_app/panel_right/panel_right_page.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
          items: _icons, 
          index: _currentIndex,
          backgroundColor: Constants.purpleDark,
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