import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];

int _currentSelectedButton = 0;

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Data>(context).isDark;
    var isLogged = Provider.of<Data>(context).isLogged;
    return Container(
      //padding: const EdgeInsets.only(top:30 ),
      color: darkMode ? Colors.white : Constants.purpleLight,
      child: Row(children: [
        if(isLogged) 
        if (ResponsiveLayout.isComputer(context))
          Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      //color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 3)
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Constants.purpleDark,
                radius: 30,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ))
        else
         if(isLogged) 
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: 30,
            color: darkMode ? Constants.purpleDark : Colors.white,
            icon: const Icon(Icons.menu),
          ),
        const SizedBox(
          width: Constants.kPadding,
        ),
         if(isLogged) 
        if (ResponsiveLayout.isComputer(context))
          ...List.generate(
            _buttonNames.length,
            (index) => TextButton(
              onPressed: () {
                setState(() {
                  _currentSelectedButton = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(Constants.kPadding * 2),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        style: TextStyle(
                            color: _currentSelectedButton == index
                                ? darkMode
                                    ? Constants.purpleLight
                                    : Colors.white
                                : darkMode
                                    ? Constants.purpleDark
                                    : Colors.white70),
                      ),
                      Container(
                        height: 2,
                        width: 60,
                        margin: const EdgeInsets.all(Constants.kPadding / 2),
                        decoration: BoxDecoration(
                          gradient: _currentSelectedButton == index
                              ? const LinearGradient(colors: [
                                  Constants.redDark,
                                  Constants.orangeDark
                                ])
                              : null,
                        ),
                      )
                    ]),
              ),
            ),
          )
        else
         if(isLogged) 
          Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: TextStyle(
                        color: darkMode ? Constants.purpleLight : Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Constants.redDark, Constants.orangeDark])),
                  )
                ],
              )),
        const Spacer(),
        Padding(
          padding: !isLogged ? const EdgeInsets.only(top: 20) : const EdgeInsets.all(0),
          child: SizedBox(
            height: 50,
            width: 70,
            child: DayNightSwitcher(
            isDarkModeEnabled: !darkMode,
            onStateChanged: (isDarkModeEnabled) {
              setState(() {
                Provider.of<Data>(context, listen: false).changeMode();
              });
            },
          ),
          ),
        ),
        // Switch(value: darkMode,
        //  onChanged: ((value) {
        //    Provider.of<Data>(context, listen: false).changeMode();
        //  })
        //  ),
        if(isLogged) 
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: 30,
          color: darkMode ? Constants.purpleLight : Colors.white,
        ) ,
        if(isLogged) 
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
              iconSize: 30,
              color: darkMode ? Constants.purpleLight : Colors.white,
            ),
            const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.pink,
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ))
          ],
        ),
        if(!isLogged)  
        const SizedBox(
          width: 20
          ),

        if(isLogged) 
        if (!ResponsiveLayout.isPhone(context))
          Container(
            margin: const EdgeInsets.all(Constants.kPadding),
            height: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(offset: Offset(0, 0), spreadRadius: 1, blurRadius: 3)
              ],
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/oussama.jpeg")),
          )
      ]),
    );
  }
}
