import 'package:dashboard_app/constants.dart';
import 'package:dashboard_app/panel_center/bar_chart.dart';
import 'package:flutter/material.dart';

class Person {
  String name;
  Color color;

  Person({required this.color, required this.name});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({super.key});

  @override
  State<PanelCenterPage> createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  final List<Person> _persons = [
    Person(color: Constants.orangeLight, name: "Oussama Braiek"),
    Person(color: Constants.redDark, name: "Lionel Messi"),
    Person(color: Constants.orangeDark, name: "Cristiano Ronaldo"),
    Person(color: Constants.blueLight, name: "Mahamed Oussama"),
    Person(color: Constants.redLight, name: "Neymar JR"),
    Person(color: Constants.greenLight, name: "Ed Sheeren"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                      title: Text(
                        "Products Available",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "82% of the Products avial",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Chip(
                        label: Text("17,500",
                            style: TextStyle(color: Colors.white)),
                      )),
                ),
              ),
            ),
            BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
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
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          onPressed: (){}, 
                          icon: const Icon(Icons.message, color: Colors.white,),
                          ),
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
