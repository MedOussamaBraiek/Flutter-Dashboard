import 'package:dashboard_app/constants.dart';
import 'package:dashboard_app/panel_right/line_chart.dart';
import 'package:flutter/material.dart';

class Product{
  String name;
  bool enable;

  Product({required this.enable, required this.name});
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({super.key});

  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            Padding(
              padding:const  EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                color: Constants.purpleLight,
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                      title: Text(
                        "Net Revenue",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "7% of Sales Avg.",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Chip(
                        label: Text(r"$47,570",
                            style: TextStyle(color: Colors.white)),
                      )),
                ),
              ),
            ),
            LineChartSample1(),
            Padding(
              padding:const  EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Constants.purpleLight,
                child: Column(
                  children: List.generate(_products.length, (index) => 
                  SwitchListTile.adaptive(
                    title: Text(_products[index].name, style: const 
                    TextStyle(color: Colors.white, fontSize: 14),),
                    value: _products[index].enable,
                    onChanged: (value) {
                      setState(() {
                        _products[index].enable = value;
                      });
                    },
                  ),
                  ),
                )
                )
              ),
            
          ],
        ),
      ),
    );
  }
}