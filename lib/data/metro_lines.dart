import 'package:latlong2/latlong.dart';
// Coordinates for the blue metro line

import 'package:latlong2/latlong.dart';

final LatLng khartoumCentral = LatLng(
  15.6000,
  32.5340,
);
final List<LatLng> blueLine = [

  LatLng(15.7200,32.6000),
  LatLng(15.6800,32.5700),
  LatLng(15.6400,32.5600),

  khartoumCentral,

  LatLng(15.5600,32.5200),
  LatLng(15.5200,32.5000),

];

// Coordinates for the red metro line
final List<LatLng> redLine = [

  LatLng(15.5890,32.5530),

  LatLng(15.6000,32.5340),

  LatLng(15.6200,32.5100),

  LatLng(15.6500,32.4800),

];

// Coordinates for the green metro line
final List<LatLng> greenLine = [

  khartoumCentral,

  LatLng(15.5800,32.5800),
  LatLng(15.5600,32.6200),
  LatLng(15.5300,32.6500),

];