import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_page/views/homesize/homeweb.dart';
import 'package:landing_page/views/homesize/mobile_home.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  bool isSmall;
  Home({this.isSmall});
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      isSmall = true;
    }
    return Scaffold(
        body: ScreenTypeLayout(
      mobile: Homob(),
      desktop: HomeWeb(),
    ));
  }
}
