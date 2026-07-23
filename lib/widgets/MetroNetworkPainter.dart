import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latlong;
import '../data/metro_lines.dart';


class MetroNetworkPainter extends CustomPainter {


  // Stores the currently selected line
  // null means no line selected
  final String? selectedLine;



  // Constructor receives the selected line
  MetroNetworkPainter({
    this.selectedLine,
  });




  // Converts LatLng coordinates into screen positions
  Offset convertToOffset(
    latlong.LatLng point,
    Size size,
  ) {


    // Network boundaries
    final minLat = 15.5200;
    final maxLat = 15.7200;

    final minLng = 32.4800;
    final maxLng = 32.6500;



    // Longitude -> X position
    double x =
        (point.longitude - minLng) /
        (maxLng - minLng);



    // Latitude -> Y position
    double y =
        (point.latitude - minLat) /
        (maxLat - minLat);



    return Offset(

      x * size.width,


      // Flip Y because canvas starts from top
      (1 - y) * size.height,

    );

  }







  // Draws one metro line
  void drawMetroLine(

    Canvas canvas,

    Size size,

    List<latlong.LatLng> points,

    Color color,

  ) {



    bool isSelected = false;




    // Check if this line is selected

    if (selectedLine != null) {


      if (color == Colors.blue &&
          selectedLine == "blue") {

        isSelected = true;

      }



      if (color == Colors.green &&
          selectedLine == "green") {

        isSelected = true;

      }



      if (color == Colors.red &&
          selectedLine == "red") {

        isSelected = true;

      }


    }







    // Paint settings

    final paint = Paint()


      // Selected line stays bright
      // Others become faded

      ..color = isSelected

          ? color

          : (selectedLine == null

              ? color

              : color.withOpacity(0.25))



      // Selected line becomes thicker

      ..strokeWidth = isSelected ? 9 : 5



      ..style = PaintingStyle.stroke


      ..strokeCap = StrokeCap.round;







    final path = Path();





    for (int i = 0; i < points.length; i++) {



      Offset point = convertToOffset(

        points[i],

        size,

      );




      if (i == 0) {


        path.moveTo(

          point.dx,

          point.dy,

        );


      } else {


        path.lineTo(

          point.dx,

          point.dy,

        );


      }


    }





    canvas.drawPath(

      path,

      paint,

    );

  }









  @override
  void paint(

    Canvas canvas,

    Size size,

  ) {



    // Draw blue line

    drawMetroLine(

      canvas,

      size,

      blueLine,

      Colors.blue,

    );





    // Draw green line

    drawMetroLine(

      canvas,

      size,

      greenLine,

      Colors.green,

    );





    // Draw red line

    drawMetroLine(

      canvas,

      size,

      redLine,

      Colors.red,

    );

  }









  @override
  bool shouldRepaint(

    covariant MetroNetworkPainter oldDelegate,

  ) {


    // Redraw whenever selected line changes

    return oldDelegate.selectedLine != selectedLine;


  }


}