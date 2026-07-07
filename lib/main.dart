import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

List<Map<String, dynamic>> stations = [
  {
    "name": "Khartoum Central",
    "location": LatLng(15.6000, 32.5340),
    "Line": "blue line",
    "nextTrain": "3 min",
  },
  {
    "name": "Bahri Station",
    "location": LatLng(15.6400, 32.5600),
    "Line": "green line",
    "nextTrain": "7 min",
  },
  {
    "name": "AirPort Station",
    "location": LatLng(15.5890, 32.5530),
    "Line": "red line",
    "nextTrain": "9 min",
  },
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // where we store variabales (state)
  Map<String, dynamic>? SelectedStation;

  final MapController mapcontroller = MapController();

  @override
  Widget build(BuildContext context) {
    debugPrint(stations.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        // appBar: AppBar(title: Text("RIHLA")),
        body: Stack(
          children: [
            // THW Map it self
            FlutterMap(
              mapController: mapcontroller,

              options: MapOptions(
                initialCenter: LatLng(15.5007, 32.5599),
                initialZoom: 12,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: "com.example.myapp2",
                ),
                MarkerLayer(
                  markers: stations.map((station) {
                    return Marker(
                      point: station["location"],
                      width: 50,
                      height: 50,

                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            SelectedStation = station;
                          });

                          mapcontroller.move(station["location"],15);
                          
                          debugPrint(station.toString());
                          debugPrint(station.keys.toString());
                        },
                        child: const Icon(
                          Icons.location_pin,
                          color: Color.fromARGB(255, 38, 125, 255),
                          size: 40,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),

            // the search bar here
            Positioned(
              top: 20,
              right: 20,
              left: 20,
              child: SafeArea(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "محطة الشهيد محمد صديق - بحري ",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // ),
            // MY LOCATION BUTTON
            Positioned(
              bottom: 253,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  print("my location");
                },
                child: Icon(Icons.my_location_outlined),
              ),
            ),

            //THE BOTTOM PANEL
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "مرحبتين حبابك👋🏽, حسام الدين",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 10),
                      //where the greeting OR the station selcted is dispalyed
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),

                        child: Text(
                          SelectedStation == null
                              ? "اين وجهتك اليوم ؟"
                              : "📌${SelectedStation!["name"]}",
                          key: ValueKey(
                            SelectedStation == null
                                ? "empty"
                                : SelectedStation!["name"],
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 169, 183, 197),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        SelectedStation == null
                            ? ""
                            : "🚄${SelectedStation!["Line"]}",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 169, 183, 197),
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        SelectedStation == null
                            ? ""
                            : "🕝${SelectedStation!["nextTrain"]}",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 169, 183, 197),
                        ),
                      ),
                      //button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(" حجز تذكرة"),
                        ),
                      ),
                    ],
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
