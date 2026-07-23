import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rihla_4_0/models/station.dart';
import '../data/stationsdata.dart';
import '../data/metro_lines.dart';


// Full map page widget displaying metro lines and stations
class FullMapPage extends StatefulWidget {
  const FullMapPage({super.key});

  @override
  State<FullMapPage> createState() => _FullMapPageState();
}

class _FullMapPageState extends State<FullMapPage> {
  // Currently selected station from marker tap
  Station? selectedStation;

  // Returns color based on metro line name
  Color getStationColor(String line) {
    switch (line.toLowerCase()) {
      case "blue":
        return Colors.blue;
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map widget with tile layer, polylines, and station markers
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(15.5007, 32.5599),
              initialZoom: 11,
            ),
            children: [
              // OpenStreetMap tile layer
              TileLayer(
  urlTemplate:
      'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
  subdomains: const ['a', 'b', 'c', 'd'],
  userAgentPackageName: 'com.example.rihla',
),
              // Render colored polylines for each metro line
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: blueLine,
                    color: Colors.blue,
                    strokeWidth: 5,
                  ),
                  Polyline(
                    points: greenLine,
                    color: Colors.green,
                    strokeWidth: 5,
                  ),
                  Polyline(
                    points: redLine,
                    color: Colors.red,
                    strokeWidth: 5,
                  ),
                ],
              ),
              // Display station markers from data source
              MarkerLayer(
                markers: stations.map((station) {
                  return Marker(
                    point: station.location,
                    width: 100,
                    height: 70,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedStation = station;
                        });
                      },
                      child: Column(
                        children: [
                          // Colored circle indicator for station line
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: getStationColor(station.line),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                          // Station name label
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            color: Colors.white,
                            child: Text(
                              station.name,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          // Station information card shown when a station is selected
          if (selectedStation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Station name heading
                    Text(
                      selectedStation!.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Metro line name
                    Text(
                      "Line: ${selectedStation!.line}",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Next train arrival time
                    Text(
                      "Next Train: ${selectedStation!.nextTrain}",
                      style: TextStyle(fontSize: 18),
                    ),

              
                  ],
                ),
              ),
            ),

            
        ],

      
      ),
    );
  }
}