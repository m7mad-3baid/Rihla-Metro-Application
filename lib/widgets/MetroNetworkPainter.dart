import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latlong;
import '../data/metro_lines.dart';

class MetroNetworkPainter extends CustomPainter {
  final String? selectedLine;

  MetroNetworkPainter({
    this.selectedLine,
  });

  Offset convertToOffset(
    latlong.LatLng point,
    Size size,
  ) {
    final minLat = 15.5200;
    final maxLat = 15.7200;

    final minLng = 32.4800;
    final maxLng = 32.6500;

    double x =
        (point.longitude - minLng) /
        (maxLng - minLng);

    double y =
        (point.latitude - minLat) /
        (maxLat - minLat);

    return Offset(
      x * size.width,
      (1 - y) * size.height,
    );
  }

  void drawMetroLine(
    Canvas canvas,
    Size size,
    List<latlong.LatLng> points,
    Color color,
  ) {
    bool isSelected = false;

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

    final paint = Paint()
      ..color = isSelected
          ? color
          : (selectedLine == null
              ? color
              : color.withOpacity(0.25))
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
    drawMetroLine(
      canvas,
      size,
      blueLine,
      Colors.blue,
    );

    drawMetroLine(
      canvas,
      size,
      greenLine,
      Colors.green,
    );

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
    return oldDelegate.selectedLine != selectedLine;
  }
}
