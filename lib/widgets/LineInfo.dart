import 'package:flutter/material.dart';

class LineInfo extends StatefulWidget {
  final String selectedlineToDisplay;

  const LineInfo({super.key, required this.selectedlineToDisplay});

  @override
  State<LineInfo> createState() => _LineInfoState();
}

class _LineInfoState extends State<LineInfo> {
  String lineName = "";
  List<String> lineStations = [];

  @override
  Widget build(BuildContext context) {
    if (widget.selectedlineToDisplay == "red") {
      lineName = "Red Line Stations :";
      lineStations = [
        "1- Khartoum Central",
        "2- Al Mek Nimr",
        "3- Kober",
        "4- Bahri South",
      ];
    } else if (widget.selectedlineToDisplay == "blue") {
      lineName = "Blue Line Stations :";
      lineStations = [
        "1- Khartoum Central",
        "2- Al Riad",
        "3- al Kalakla",
        "4- Bahri central",
      ];
    } else if (widget.selectedlineToDisplay == "green") {
      lineName = "Green Line Stations :";
      lineStations = [
        "1- Omdurman Central",
        "2- Al Thawra",
        "3- Wad Nubawi",
        "4- Khartoum central",
      ];
    }



    return Container(
      width: 375,
      height: 250,
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
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              children: [Text(lineName, style: TextStyle(fontSize: 20))],
            ),
          ),

          ...lineStations.map((station) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    station,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
