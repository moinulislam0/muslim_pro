import 'package:flutter/material.dart';
import 'package:ui_design/jump_button/jump_button.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
      children: [
        SizedBox(height: 80,),
      ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JumpAyahScreen()),
    );
  },
  child: Text('Go to Jump Ayah'), // Simple widget as child
)
      ],
    ),);
  }
}