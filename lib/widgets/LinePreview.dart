import 'package:flutter/material.dart';

class LinePreview extends StatefulWidget {
  const LinePreview({super.key});

  @override
  State<LinePreview> createState() => _LinePreviewState();
}

class _LinePreviewState extends State<LinePreview> {
  String selectedLine = "default";

  String get imagepath {
    if (selectedLine == "red") {
      return "assets/imgs/Rselected.png";
    } else if (selectedLine == "blue") {
      return "assets/imgs/Bselected.png";
    } else if (selectedLine == "green") {
      return "assets/imgs/Gselected.png";
    }

    return "assets/imgs/DefaultState.png";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(imagepath, fit: BoxFit.fitWidth)),

            Positioned(
              left: 20,
              top: 80,
              child: GestureDetector(
                onTap: () {
                  print("red line selected");

                  setState(() {
                    selectedLine = "red";
                  });
                },

                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.transparent,
                ),
              ),
            ),

            Positioned(
              left: 120,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  print("Blue line selected");

                  setState(() {
                    selectedLine = "blue";
                  });
                },

                child: Container(
                  width: 120,
                  height: 110,
                  color: Colors.transparent,
                ),
              ),
            ),

            Positioned(
              right: 20,
              top: 120,
              child: GestureDetector(
                onTap: () {
                  print("green line selected");

                  setState(() {
                    selectedLine = "green";
                  });
                },

                child: Container(
                  width: 200,
                  height: 80,
                  color: Colors.transparent,
                ),
              ),
            ),


            Positioned(
              left: 35,
              top: 140,
              child: GestureDetector(
                onTap: () {
                  print("blue line selected");

                  setState(() {
                    selectedLine = "blue";
                  });
                },

                child: Container(
                  width: 100,
                  height: 80,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
