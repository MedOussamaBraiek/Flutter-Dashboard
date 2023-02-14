import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person {
  String name;
  Color color;

  Person({required this.color, required this.name});
}

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final List<Person> _persons = [
    Person(color: Constants.yellow, name: "Oussama Braiek"),
    Person(color: Constants.pink, name: "Lionel Messi"),
    Person(color: Constants.green, name: "Cristiano Ronaldo"),
    Person(color: Constants.blueLight, name: "Mahamed Oussama"),
    Person(color: Constants.redLight, name: "Neymar JR"),
    Person(color: Constants.greenLight, name: "Ed Sheeren"),
  ];
  @override
  Widget build(BuildContext context) {
    bool lightMode = Provider.of<Data>(context).isDark;
    return Container(
      width: ResponsiveLayout.isComputer(context) 
      ? MediaQuery.of(context).size.width * 0.8
      : MediaQuery.of(context).size.width ,
      height: 450,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: lightMode ? Colors.white : Constants.purpleLight,
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            'Users',
            style: TextStyle(
                color: lightMode ? Constants.purpleLight : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: List.generate(
              _persons.length,
              (index) => ListTile(
                leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: _persons[index].color,
                  child: Text(
                    _persons[index].name.substring(0, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  _persons[index].name,
                  style: TextStyle(
                    color: lightMode ? Constants.purpleLight : Colors.white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: lightMode ? Constants.purpleDark : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
