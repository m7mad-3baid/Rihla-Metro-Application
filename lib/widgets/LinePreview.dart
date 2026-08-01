import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/fullMapPage.dart';

class LinePreview extends StatefulWidget {
  final String selectedLineToView;

  final Function(String) onLineSelected;

  const LinePreview({
    super.key,
    required this.selectedLineToView,
    required this.onLineSelected,
  });

  @override
  State<LinePreview> createState() => _LinePreviewState();
}

class _LinePreviewState extends State<LinePreview> {
  String get imagepath {
    if (widget.selectedLineToView == "red") {
      return "assets/imgs/Rselected.png";
    } else if (widget.selectedLineToView == "blue") {
      return "assets/imgs/Bselected.png";
    } else if (widget.selectedLineToView == "green") {
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
            Positioned.fill(
              child: Image.asset(imagepath, fit: BoxFit.fitWidth),
            ),

            Positioned(
              left: 20,
              top: 80,
              child: GestureDetector(
                onTap: () {
                  print("red line selected");

                  widget.onLineSelected("red");
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

                  widget.onLineSelected("blue");
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

                  widget.onLineSelected("green");
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

                  widget.onLineSelected("blue");
                  ;
                },

                child: Container(
                  width: 100,
                  height: 80,
                  color: Colors.transparent,
                ),
              ),
            ),

            Positioned(
              top: 20,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullMapPage()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),

                  child: Icon(
                    Icons.fullscreen_rounded,
                    size: 45,
                    color: Color(0xFF00515A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
