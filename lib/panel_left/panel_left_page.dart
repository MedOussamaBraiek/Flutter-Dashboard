import 'package:dashboard_app/constants.dart';
import 'package:dashboard_app/panel_left/circle_graph.dart';
import 'package:dashboard_app/panel_left/curved_chart.dart';
import 'package:dashboard_app/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
    Todo(name:"Purchase Paper", enable: true),
    Todo(name:"Refill the inventor of speakers", enable: true),
    Todo(name:"Hire someone", enable: true),
    Todo(name:"Marketing Strategy", enable: true),
    Todo(name:"Selling furniture", enable: true),
    Todo(name:"finish the disclosure", enable: true),
  ];
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if(ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50)
                  )
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding:const EdgeInsets.only(
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
                      title: Text("Products Sold", style: TextStyle(color: Colors.white),),
                      subtitle: Text("18% of the Products Sold", style: TextStyle(color: Colors.white),),
                      trailing: Chip(label: Text("4,500", style: TextStyle(color: Colors.white)),)
                    ),
                  ),
                ),
                ),
                LineChartSample2(),
                PieChartSample2(),
                Padding(padding:const EdgeInsets.only(
                  left: Constants.kPadding / 2,
                  right: Constants.kPadding / 2,
                  top: Constants.kPadding / 2,
                  bottom: Constants.kPadding
                ),
                child: Card(
                  color: Constants.purpleLight,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: List.generate(_toDo.length, (index) => 
                    CheckboxListTile(
                      title: Text(_toDo[index].name, style: const TextStyle(color: Colors.white,fontSize: 14),),
                      value: _toDo[index].enable,
                      onChanged: (value) => {
                        setState(() => {
                          _toDo[index].enable = value ?? true
                        })
                      },
                    )),
                  )
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}