import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonInfo {
  String title;
  IconData icon;

  ButtonInfo({required this.icon, required this.title});
}

int _currentIndex = 0;

List<ButtonInfo> _buttonNames = [
  ButtonInfo (
    title: "Home",
    icon: Icons.home ),
    ButtonInfo (
    title: "Settign",
    icon: Icons.settings ),
    ButtonInfo (
    title: "Notifications",
    icon: Icons.notifications ),
    ButtonInfo (
    title: "Contacts",
    icon: Icons.contact_phone_rounded ),
    ButtonInfo (
    title: "Sales",
    icon: Icons.sell ),
    ButtonInfo (
    title: "Marketing",
    icon: Icons.mark_email_read ),
    ButtonInfo (
    title: "Security",
    icon: Icons.verified_user ),
    ButtonInfo (
    title: "Users",
    icon: Icons.supervised_user_circle_rounded ),
    ButtonInfo (
    title: "Logout",
    icon: Icons.logout)
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {

    bool darkMode = Provider.of<Data>(context).isDark;

    return  Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              ListTile(
            title: Text('Admin Menu', 
            style: TextStyle(
              color: darkMode 
              ? const Color(0xff131215)
              : const Color.fromARGB(255, 237, 237, 237), 
            fontSize: 20, fontWeight: FontWeight.bold),),
            trailing: ResponsiveLayout.isComputer(context) ? null : 
            IconButton(
              onPressed: (){
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.close, color: 
            darkMode 
              ? const Color(0xff131215)
              : Colors.white 
              ),
            ),
          ),
          const SizedBox(height: 10,),
              ...List.generate(
            _buttonNames.length, (index) => Column(
            children: [
              Container(
                decoration: index == _currentIndex ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Constants.pink.withOpacity(0.9),
                     Constants.yellow.withOpacity(0.9),
                     ]
                ),
              ) : null,
              child: ListTile(
                title: Text(_buttonNames[index].title, 
                style: TextStyle(color: darkMode 
              ? const Color(0xff131215)
              : Colors.white),),
                leading:  Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Icon(_buttonNames[index].icon,
                  color: darkMode 
              ? const Color(0xff131215)
              : Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              ),
               Divider(color: 
              darkMode 
              ? const Color(0xff131215)
              : Colors.white
              , thickness: 0.1,)
            ],
          ),growable: true)
            ],
          )
          ),),
    );
  }
}