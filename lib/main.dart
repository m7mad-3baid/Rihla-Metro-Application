import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/loginpage.dart';
import 'package:rihla_4_0/screens/rigesterpage.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';
import 'package:rihla_4_0/screens/Splash.dart';

void main() {
  runApp(Rihla());
}

class Rihla extends StatefulWidget {
  @override
  State<Rihla> createState() => _RihlaState();
}

class _RihlaState extends State<Rihla> {
  bool isTrainSelected = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
       
    );
  }
}