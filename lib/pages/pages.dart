import 'package:flutter/material.dart';
import 'package:ui_design/99_names/99_names.dart';
import 'package:ui_design/halal_place/halal_place.dart';
import 'package:ui_design/jump_button/jump_button.dart';
import 'package:ui_design/mosque_location/mosque_location.dart';
import 'package:ui_design/qibla/qibla.dart';
import 'package:ui_design/ticktick/ticktick.dart';

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
          SizedBox(height: 80),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JumpAyahScreen()),
              );
            },
            child: Text('Go to Jump Ayah'), // Simple widget as child
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TasksGridScreen()),
              );
            },
            child: Text('TickTick'), // Simple widget as child
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AsmaulHusnaScreen()),
              );
            },
            child: Text('Asmaul Husna'), // Simple widget as child
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FinalQiblaScreen()),
              );
            },
            child: Text('Qibla'), // Simple widget as child
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MosqueFinderScreen()),
              );
            },
            child: Text('Mosque Location'), // Simple widget as child
          ),
           ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HalalPlace()),
              );
            },
            child: Text('HalalPlace'), // Simple widget as child
          ),
        ],
      ),
    );
  }
}
