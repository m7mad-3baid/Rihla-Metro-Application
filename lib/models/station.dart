import 'package:latlong2/latlong.dart';

class Station {

  final String name;
  final LatLng location;
  final String line;
  final String nextTrain;

  Station({
    required this.name,
    required this.location,
    required this.line,
    required this.nextTrain,
  });

}