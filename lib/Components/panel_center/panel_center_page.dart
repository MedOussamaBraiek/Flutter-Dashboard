import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Components/panel_center/bar_chart.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 63,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: const Color(0xffFAD85D),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  child:  ListTile(
                      title:const Text(
                        "Products Available",
                        style: TextStyle(
                            color: Color(0xff131215),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:const Text(
                        "82% of the Products avial",
                        style: TextStyle(color: Color(0xff131215)),
                      ),
                      trailing: Chip(
                        backgroundColor: lightMode ?  Colors.white : Constants.purpleLight,
                        label: Text("17,500",
                            style: TextStyle(color: lightMode ? Constants.purpleLight : Colors.white)),
                      )),
                ),
              ),
            ),
            const BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
                bottom: Constants.kPadding,
              ),
              child: Card(
                  color: lightMode ? Colors.white : Constants.purpleLight,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding:const  EdgeInsets.only(
                          left: Constants.kPadding * 1.5,
                          right: Constants.kPadding / 2,
                          top: Constants.kPadding * 2,
                        ),
                        child: Text(
                          'Users',
                          style: TextStyle(
                              color: lightMode ? Constants.purpleLight : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10,),
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
                                color: lightMode
                                    ? Constants.purpleLight
                                    : Colors.white,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.message,
                                color: lightMode
                                    ? Constants.purpleDark
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
