import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  const ResponsiveLayout ({
    required this.tiny,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.computer,
  });

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTableLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) => 
    MediaQuery.of(context).size.height < tinyHeightLimit;

  static bool isTinyLimit(BuildContext context) => 
    MediaQuery.of(context).size.width < tinyLimit;

  static bool isPhone(BuildContext context) => 
    MediaQuery.of(context).size.width < phoneLimit &&
    MediaQuery.of(context).size.width >= tinyLimit;

  static bool isTablet(BuildContext context) => 
    MediaQuery.of(context).size.width < tabletLimit &&
    MediaQuery.of(context).size.width >= phoneLimit;

  static bool isLargeTablet(BuildContext context) => 
    MediaQuery.of(context).size.width < largeTableLimit &&
    MediaQuery.of(context).size.width >= tabletLimit;

  static bool isComputer(BuildContext context) => 
    MediaQuery.of(context).size.width >= largeTableLimit;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth < tinyLimit || constraints.maxHeight < tinyHeightLimit){
          return tiny;
        }
        if(constraints.maxWidth < phoneLimit){
          return phone;
        }
        if(constraints.maxWidth < tabletLimit){
          return tablet;
        }
        if(constraints.maxWidth < largeTableLimit){
          return largeTablet;
        }
        else{
          return computer;
        }
      },
      );
  }
}