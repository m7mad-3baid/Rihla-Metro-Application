import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/line_stations_screen.dart';
import '../models/station.dart';
import '../services/SavedStationServices.dart';
import 'package:latlong2/latlong.dart';
import '../services/api_services.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  bool isTrainSelected = true;

  @override
  void initState() {
    super.initState();
    loadStations();
  }

  Set<int> savedStationIds = {};
  List<Station> routeStations = [];

  Future<void> loadStations() async {
    final result = await ApiService.getAllStations();

    if (!mounted) return;

    if (result['success'] == true) {
      setState(() {
        routeStations = List<dynamic>.from(result['data']).map((item) {
          String line = item['line'].toString();

          if (line == "Red") line = "Red Line";
          if (line == "Green") line = "Green Line";
          if (line == "Blue") line = "Blue Line";

          return Station(
            id: int.parse(item['id'].toString()),
            name: item['name'].toString(),
            line: line,
            location: LatLng(
              double.tryParse(item['latitude']?.toString() ?? '') ?? 0,
              double.tryParse(item['longitude']?.toString() ?? '') ?? 0,
            ),
            nextTrain: "none",
          );
        }).toList();
      });
    }
  }

  Widget _buildStationCard(Station station) {
    Color lineColor;

    switch (station.line) {
      case 'Red Line':
        lineColor = const Color(0xFFC1443B);
        break;
      case 'Green Line':
        lineColor = const Color(0xFF3F7D5C);
        break;
      case 'Blue Line':
        lineColor = const Color(0xFF3B5B92);
        break;
      default:
        lineColor = const Color(0xFF00515A);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 130,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 20, offset: Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 60,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: lineColor,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: lineColor,
              ),
              child: Center(
                child: Text(
                  station.id.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      station.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      station.line,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 90,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: lineColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'ACTIVE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (savedStationIds.contains(station.id)) {
                  await SavedStationServices.removeStations(station);

                  setState(() {
                    savedStationIds.remove(station.id);
                  });
                } else {
                  await SavedStationServices.saveStation(station);

                  setState(() {
                    savedStationIds.add(station.id);
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Icon(
                  savedStationIds.contains(station.id)
                      ? Icons.bookmark
                      : Icons.bookmark_add_outlined,
                  size: 30,
                  color: const Color(0xFF00515A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: const Text(
                    "Routes",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xFFE2E2E2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTrainSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isTrainSelected
                              ? const Color(0xFF00515A)
                              : const Color(0xFFE2E2E2),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Train",
                            style: TextStyle(
                              color: isTrainSelected
                                  ? Colors.white
                                  : const Color(0xFF627595),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTrainSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isTrainSelected
                              ? const Color(0xFFE2E2E2)
                              : const Color(0xFF00515A),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Stations",
                            style: TextStyle(
                              color: isTrainSelected
                                  ? const Color(0xFF627595)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            if (isTrainSelected) ...[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LineStationsScreen(
                        lineName: "Red Line",
                        lineColor: const Color(0xFFC1443B),
                        stations: routeStations
                            .where((station) => station.line == "Red Line")
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFC1443B),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xFFC1443B),
                        ),
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Red Line",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Text(
                                "     Khartoum central ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " bahri south",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC1443B),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "8 stations",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LineStationsScreen(
                        lineName: "Green Line",
                        lineColor: const Color(0xFF3F7D5C),
                        stations: routeStations
                            .where((station) => station.line == "Green Line")
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF3F7D5C),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xFF3F7D5C),
                        ),
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Green Line",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Text(
                                "     Omdur Central ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                "Khartoum central",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3F7D5C),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "5 stations",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 29),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LineStationsScreen(
                        lineName: "Blue Line",
                        lineColor: const Color(0xFF3B5B92),
                        stations: routeStations
                            .where((station) => station.line == "Blue Line")
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF3B5B92),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xFF3B5B92),
                        ),
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Blue Line",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Text(
                                "     Khartoum central ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " bahri central",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: const EdgeInsets.only(left: 13, top: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B5B92),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "7 stations",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              ...routeStations.map((station) => _buildStationCard(station)),
            ],
          ],
        ),
      ),
    );
  }
}
