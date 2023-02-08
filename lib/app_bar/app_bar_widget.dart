import 'package:dashboard_app/constants.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

List<String> _buttonNames = [
  "Overview", "Revenue", "Sales", "Control"
];

int _currentSelectedButton = 0;

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(children: [
        if(ResponsiveLayout.isComputer(context))
          Container(
            margin: const EdgeInsets.all(Constants.kPadding),
            height: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  //color: Colors.black45,
                  offset: Offset(0,0),
                  spreadRadius: 1,
                  blurRadius: 10
                )
              ],
               shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              backgroundColor: Constants.purpleDark,
              radius: 30,
              backgroundImage: AssetImage("assets/images/logo.png"),
            )
          )
          else 
            IconButton(onPressed: () {
              Scaffold.of(context).openDrawer();
            }, 
            iconSize: 30,
            color: Colors.white,
            icon: const Icon(Icons.menu),
            ),
            const SizedBox(width:Constants.kPadding,),
            if (ResponsiveLayout.isComputer(context))
              ...List.generate(_buttonNames.length, (index) => 
              TextButton(onPressed: (){
                setState(() {
                  _currentSelectedButton = index;
                });
              }, child: Padding(
                padding: const EdgeInsets.all(Constants.kPadding * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_buttonNames[index], 
                      style: TextStyle(
                      color: _currentSelectedButton == index 
                      ? Colors.white 
                      : Colors.white70
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 60,
                      margin: const EdgeInsets.all(Constants.kPadding / 2),
                      decoration:  BoxDecoration(
                        gradient: _currentSelectedButton == index 
                        ? const LinearGradient(
                          colors: [
                            Constants.redDark,
                            Constants.orangeDark
                          ]
                        ) : null,
                      ),
                    )
                ]),
              ),),
              )
              else 
                Padding(padding: const EdgeInsets.all(Constants.kPadding * 2 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _buttonNames[_currentSelectedButton],
                      style: const TextStyle(color: Colors.white), 
                    ),
                    Container(
                      margin: const EdgeInsets.all(Constants.kPadding / 2),
                      width: 60,height: 2,
                      decoration: const BoxDecoration(
                        gradient:   LinearGradient(
                          colors: [
                            Constants.redDark,
                            Constants.orangeDark
                          ]
                        ) 
                      ),
                    )
                ],)
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                  color: Colors.white,
                  ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(Icons.notifications_none_outlined),
                      iconSize: 30,
                      color: Colors.white,
                      ),
                      const Positioned(
                        right: 6,
                        top: 6,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.pink,
                          child: Text("3", style: TextStyle(
                            fontSize: 10,
                            color: Colors.white
                          ),),
                        ) 
                      )
                  ],
                ),
                if(!ResponsiveLayout.isPhone(context))
                  Container(
                    margin: const EdgeInsets.all(Constants.kPadding),
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,0),
                            spreadRadius: 1,
                            blurRadius: 10
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/images/oussama.jpeg")
                    ),
                  )
      ]),
    );
  }
}