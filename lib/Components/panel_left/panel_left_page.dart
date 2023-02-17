import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Components/panel_left/circle_graph.dart';
import 'package:dashboard_app/Components/panel_left/curved_chart.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class Todo {
  String name;
  bool enable;

  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({super.key});

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _toDo = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventor of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Marketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "finish the disclosure", enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    bool darkMode = Provider.of<Data>(context).isDark;
    final user = FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: darkMode ? Colors.white: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration:  BoxDecoration(
                  border: null,
                    color: darkMode ? const Color(0xFFF5F8FF): Constants.purpleDark,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(10))),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 63,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding * 2,
                      right: Constants.kPadding / 2,
                      top: Constants.kPadding * 2,
                      bottom: Constants.kPadding * 2),
                  child: Text(
                    user.displayName != null ? "Hello, ${user.displayName}" :
                    "Hello,  ${user.email!.substring(0, user.email!.indexOf('@'))}",
                    style: TextStyle(
                        color: darkMode
                            ? const Color(0xff131215)
                            : const Color.fromARGB(255, 237, 237, 237),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                  ),
                  child: Card(
                    color: const Color(0xff0BF4C8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                          title: const Text(
                            "Products Sold",
                            style: TextStyle(
                                color: Constants.purpleDark,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            "18% of the Products Sold",
                            style: TextStyle(color: Constants.purpleDark),
                          ),
                          trailing: Chip(
                            backgroundColor:
                                darkMode ? Colors.white : Constants.purpleLight,
                            label: Text("4,500",
                                style: TextStyle(
                                    color: darkMode
                                        ? Constants.purpleLight
                                        : Colors.white)),
                          )),
                    ),
                  ),
                ),
                const LineChartSample2(),
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      right: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      bottom: Constants.kPadding),
                  child: Card(
                      color: darkMode ? Colors.white : Constants.purpleLight,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: Constants.kPadding * 1.5,
                              right: Constants.kPadding / 2,
                              top: Constants.kPadding * 2,
                            ),
                            child: Text(
                              'Tasks',
                              style: TextStyle(
                                  color: darkMode
                                      ? Constants.purpleLight
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          Column(
                            children: List.generate(
                                _toDo.length,
                                (index) => CheckboxListTile(
                                      title: Text(
                                        _toDo[index].name,
                                        style: TextStyle(
                                            color: darkMode
                                                ? const Color(0xff131215)
                                                : Colors.white,
                                            fontSize: 14),
                                      ),
                                      value: _toDo[index].enable,
                                      onChanged: (value) => {
                                        setState(() => {
                                              _toDo[index].enable =
                                                  value ?? true
                                            })
                                      },
                                    )),
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
