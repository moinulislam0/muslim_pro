import 'package:flutter/material.dart';
import 'package:ui_design/pages/pages.dart';

void main(){
  runApp(MyApps());
}
class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "practice",
     home: Pages(),
    );
  }
}