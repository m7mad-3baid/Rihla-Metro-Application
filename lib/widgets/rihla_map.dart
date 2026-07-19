import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RihlaMap extends StatelessWidget {
  const RihlaMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 375,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),

        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(15.5007, 32.5599),
            initialZoom: 12,
          ),

          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.rihla',
            ),
          ],
        ),
      ),
    );
  }
}
