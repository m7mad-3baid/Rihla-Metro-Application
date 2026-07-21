import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rihla_4_0/models/station.dart';
import '../data/stationsdata.dart';

final List<LatLng> blueLine = [
  LatLng(15.7200, 32.6000),
  LatLng(15.6800, 32.5700),
  LatLng(15.6400, 32.5600),
  LatLng(15.6000, 32.5340),
  LatLng(15.5600, 32.5200),
  LatLng(15.5200, 32.5000),
];

final List<LatLng> redLine = [
  LatLng(15.5900, 32.5530),
  LatLng(15.6000, 32.5450),
  LatLng(15.6000, 32.5340),
  LatLng(15.6200, 32.5100),
  LatLng(15.6500, 32.4800),
];

final List<LatLng> greenLine = [
  LatLng(15.6000, 32.5340),
  LatLng(15.5800, 32.5800),
  LatLng(15.5600, 32.6200),
  LatLng(15.5300, 32.6500),
];


class FullMapPage extends StatefulWidget {

  const FullMapPage({super.key});

  @override
  State<FullMapPage> createState() => _FullMapPageState();

}


class _FullMapPageState extends State<FullMapPage> {

  Station? selectedStation;


  Color getStationColor(String line) {

    switch(line.toLowerCase()) {

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


          FlutterMap(

            options: MapOptions(

              initialCenter: LatLng(15.5007,32.5599),

              initialZoom: 11,

            ),



            children: [


              TileLayer(

                urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                userAgentPackageName:
                'com.example.rihla',

              ),



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



                          Container(

                            padding: EdgeInsets.symmetric(
                              horizontal: 4,
                            ),

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




          // Station information card

          if(selectedStation != null)

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


                    Text(

                      selectedStation!.name,

                      style: TextStyle(

                        fontSize: 24,

                        fontWeight: FontWeight.bold,

                      ),

                    ),



                    SizedBox(height: 10),



                    Text(

                      "Line: ${selectedStation!.line}",

                      style: TextStyle(

                        fontSize: 18,

                      ),

                    ),



                    Text(

                      "Next Train: ${selectedStation!.nextTrain}",

                      style: TextStyle(

                        fontSize: 18,

                      ),

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