import 'package:dashboard_app/Constants/constants.dart';
import 'package:dashboard_app/Components/panel_right/line_chart.dart';
import 'package:dashboard_app/Provider/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    bool lightMode = Provider.of<Data>(context).isDark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 63,),
            Padding(
              padding:const  EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                color: Constants.pink,
                child: Container(
                  width: double.infinity,
                  child:  ListTile(
                      title: const Text(
                        "Net Revenue",
                        style: TextStyle(color: Constants.text,
                        fontWeight: FontWeight.bold,),
                      ),
                      subtitle: const Text(
                        "7% of Sales Avg.",
                        style: TextStyle(color: Constants.text),
                      ),
                      trailing: Chip(
                        backgroundColor: lightMode ?  Colors.white : Constants.purpleLight,
                        label: Text(r"$47,570",
                            style: TextStyle(color: lightMode ? Constants.purpleLight : Colors.white)),
                      )),
                ),
              ),
            ),
            const LineChartSample1(),
            Padding(
              padding:const  EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: lightMode ? Colors.white : Constants.purpleLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                    padding:const EdgeInsets.only(
                left: Constants.kPadding * 1.5,
                right: Constants.kPadding / 2,
                top: Constants.kPadding * 2,
              ),
                    child: Text('Devices', style: TextStyle(
                      color: lightMode ?  Constants.purpleLight : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                      ),),
                  ),
                  Column(
                  children: List.generate(_products.length, (index) => 
                  SwitchListTile.adaptive(
                    title: Text(_products[index].name, style: 
                    TextStyle(color: lightMode ?  Constants.purpleLight : Colors.white, fontSize: 14),),
                    value: _products[index].enable,
                    onChanged: (value) {
                      setState(() {
                        _products[index].enable = value;
                      });
                    },
                  ),
                  ),
                )
                ],)
                )
              ),
            
          ],
        ),
      ),
    );
  }
}