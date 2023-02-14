import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:dashboard_app/responsive_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  String name;
  bool enable;

  Product({required this.enable, required this.name});
}

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  final List<Product> _products = [
    Product(enable: true, name: "Iphone"),
    Product(enable: true, name: "Tablet"),
    Product(enable: true, name: "MacBook"),
    Product(enable: true, name: "PC"),
    Product(enable: true, name: "Speaker"),
    Product(enable: true, name: "TV"),
    Product(enable: true, name: "Projector"),
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
            'Devices',
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
              _products.length,
              (index) => SwitchListTile.adaptive(
                title: Text(
                  _products[index].name,
                  style: TextStyle(
                      color: lightMode ? Constants.purpleLight : Colors.white,
                      fontSize: 17),
                ),
                value: _products[index].enable,
                onChanged: (value) {
                  setState(() {
                    _products[index].enable = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ])),
      ),
    );
  }
}
