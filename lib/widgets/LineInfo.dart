import 'package:flutter/material.dart';

class LineInfo extends StatefulWidget {
  const LineInfo({super.key});

  @override
  State<LineInfo> createState() => _LineInfoState();
}

class _LineInfoState extends State<LineInfo> {
  String selectedLine = "default";



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 375, height: 100,
      decoration: BoxDecoration(
        
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 4)),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("")

        ],
      ),


    );
  }
}
