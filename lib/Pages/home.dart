import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dashboard_app/Components/app_bar/app_bar_widget.dart';
import 'package:dashboard_app/Components/drawer/drawer_page.dart';
import 'package:dashboard_app/Components/panel_center/bar_chart.dart';
import 'package:dashboard_app/Components/panel_center/panel_center_page.dart';
import 'package:dashboard_app/Components/panel_left/panel_left_page.dart';
import 'package:dashboard_app/Components/panel_right/line_chart.dart';
import 'package:dashboard_app/Components/panel_right/panel_right_page.dart';
import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Pages/devices.dart';
import 'package:dashboard_app/Pages/tasks.dart';
import 'package:dashboard_app/Pages/users.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  // mohamedoussama.braiek@olindias.com
  // A1CDGIJ3a82L

  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Data>(context).isDark;
    var data = Provider.of<Data>(context);
    print(data.isProfits);
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(double.infinity, 70),
      child: (ResponsiveLayout.isTinyHeightLimit(context) || 
      ResponsiveLayout.isTinyLimit(context) 
      ? Container() : const AppBarWidget()),),

      body: ResponsiveLayout(
        tiny: Container(),
        phone: _currentIndex == 0 
        ? const PanelLeftPage() : _currentIndex == 1 ? const PanelCenterPage() : const PanelRightPage(),
        tablet: Row(children: [
           data.isProfits ? SizedBox(width: MediaQuery.of(context).size.width,child: const BarChartSample2())
          : data.isSales ? SizedBox(width: MediaQuery.of(context).size.width,child: const LineChartSample1() ,)
          : data.isDevices ? const Devices()  
          : data.isUsers ? const Users() 
          : data.isTasks ? const Tasks() :
          const Expanded(child: PanelLeftPage()),
          !data.isProfits && !data.isSales && !data.isDevices && !data.isUsers && !data.isTasks?
           const Expanded(child: PanelCenterPage()) : Container()
        ]),
        largeTablet: Row(children: [
          data.isProfits ? SizedBox(width: MediaQuery.of(context).size.width,child: const BarChartSample2())
          : data.isSales ? SizedBox(width: MediaQuery.of(context).size.width,child: const LineChartSample1() ,)
          : data.isDevices ? const Devices()  
          : data.isUsers ? const Users() 
          : data.isTasks ? const Tasks() :
           const Expanded(child: PanelLeftPage()),
           !data.isProfits && !data.isSales && !data.isDevices && !data.isUsers && !data.isTasks?
           const Expanded(child: PanelCenterPage()) : Container(),
           !data.isProfits && !data.isSales && !data.isDevices && !data.isUsers && !data.isTasks?
           const Expanded(child: PanelRightPage()) : Container(),
        ]),
        computer: 
        Row(children:  [
          SizedBox(width: MediaQuery.of(context).size.width * 0.2,child: DrawerPage()),
          data.isProfits ? SizedBox(width: MediaQuery.of(context).size.width * 0.8,child: const BarChartSample2())
          : data.isSales ? SizedBox(width: MediaQuery.of(context).size.width * 0.8,child: const LineChartSample1() ,)
          : data.isDevices ? const Devices()  
          : data.isUsers ? const Users() 
          : data.isTasks ? const Tasks() :
          const Expanded(child: PanelLeftPage()),
          !data.isProfits && !data.isSales && !data.isDevices && !data.isUsers && !data.isTasks?
          const Expanded(child: PanelCenterPage()) : Container(),
          !data.isProfits && !data.isSales && !data.isDevices && !data.isUsers && !data.isTasks?
          const Expanded(child: PanelRightPage()) : Container(),
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