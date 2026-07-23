import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';





// Coordinates for the blue metro line
final List<LatLng> blueLine = [
  LatLng(15.7200, 32.6000),
  LatLng(15.6800, 32.5700),
  LatLng(15.6400, 32.5600),
  LatLng(15.6000, 32.5340),
  LatLng(15.5600, 32.5200),
  LatLng(15.5200, 32.5000),
];

// Coordinates for the red metro line
final List<LatLng> redLine = [
  LatLng(15.5900, 32.5530),
  LatLng(15.6000, 32.5450),
  LatLng(15.6000, 32.5340),
  LatLng(15.6200, 32.5100),
  LatLng(15.6500, 32.4800),
];

// Coordinates for the green metro line
final List<LatLng> greenLine = [
  LatLng(15.6000, 32.5340),
  LatLng(15.5800, 32.5800),
  LatLng(15.5600, 32.6200),
  LatLng(15.5300, 32.6500),
];

class RihlaMap extends StatelessWidget {
  const RihlaMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        height: 400,
        width: 375,
      
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(31, 43, 50, 114),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 10,
            ),
          ],
        ),
      
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
      
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(15.5007, 32.5599),
              initialZoom: 12,
            ),
      
            children: [
               TileLayer(
        urlTemplate:
        'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
        subdomains: const ['a', 'b', 'c', 'd'],
        userAgentPackageName: 'com.example.rihla',
      ),
      
      
      
            ],
          ),
        ),
      ),
    );
  }
}