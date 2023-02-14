import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Todo {
  String name;
  bool enable;

  Todo({this.enable = true, required this.name});
}

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
    bool lightMode = Provider.of<Data>(context).isDark;
    return Container(
      width: ResponsiveLayout.isComputer(context) 
      ? MediaQuery.of(context).size.width * 0.8
      : MediaQuery.of(context).size.width ,
      height: 400,
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
            'Tasks',
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
                _toDo.length,
                (index) => CheckboxListTile(
                      title: Text(
                        _toDo[index].name,
                        style: TextStyle(
                            color: lightMode
                                ? const Color(0xff131215)
                                : Colors.white,
                            fontSize: 17),
                      ),
                      value: _toDo[index].enable,
                      onChanged: (value) => {
                        setState(() => {_toDo[index].enable = value ?? true})
                      },
                    )),
          )
        ])),
      ),
    );
  }
}
