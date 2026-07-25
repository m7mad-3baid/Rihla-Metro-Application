import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';
import 'package:rihla_4_0/screens/line_stations_screen.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  bool isTrainSelected = true;

  // Search state: controller reads what's typed, searchQuery drives filtering.
  final searchController = TextEditingController();
  String searchQuery = "";

  // Small helper so every "if" check reads the same simple way.
  bool matches(String name) {
    return name.toLowerCase().contains(searchQuery.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            // Header
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

            const SizedBox(height: 20),

            Searchbarwidget(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 40),

            // Train / Stations Toggle
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
                              ? Color(0xFF00515A)
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
                              : Color(0xFF00515A),
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
              // routes card 1 — Red Line
              if (matches("Red Line"))
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LineStationsScreen(
                          lineName: "Red Line",
                          lineColor: Colors.red,
                          stations: [
                            LineStation(
                              number: "1",
                              name: "Khartoum Central",
                              status: "Open",
                              nextTrain: "3 min",
                              description:
                                  "The central hub of the Red Line, located in the heart of Khartoum near major government buildings and the historic Blue Nile bridge.",
                            ),
                            LineStation(
                              number: "2",
                              name: "Al Mek Nimr",
                              status: "Open",
                              nextTrain: "6 min",
                              description:
                                  "The central hub of the Red Line, located in the heart of Khartoum near major government buildings and the historic Blue Nile bridge.",
                            ),
                            LineStation(
                              number: "3",
                              name: "Kober",
                              status: "Open",
                              nextTrain: "9 min",
                              description:
                                  "A major commercial and residential area with several shopping centers and educational institutions.",
                            ),
                            LineStation(
                              number: "4",
                              name: "Bahri South",
                              status: "Open",
                              nextTrain: "12 min",
                              description:
                                  "A key transit point with connections to various parts of the city.",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 60,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.red,
                          ),
                          child: Center(
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
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 10,
                                top: 20,
                              ),
                              child: Text(
                                "Red Line",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "     Khartoum central ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 15,
                                ),
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
                              margin: EdgeInsets.only(left: 15, top: 20),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
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
                        Container(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(left: 35),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              if (matches("Red Line")) SizedBox(height: 10),

              // routes card 2 — Green Line
              if (matches("Green Line"))
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LineStationsScreen(
                          lineName: "Green Line",
                          lineColor: const Color.fromARGB(255, 11, 152, 16),
                          stations: [
                            LineStation(
                              number: "1",
                              name: "Omdurman Central",
                              status: "Open",
                              nextTrain: "2 min",
                              description:
                                  "The central hub of the Red Line, located in the heart of Khartoum near major government buildings and the historic Blue Nile bridge.",
                            ),
                            LineStation(
                              number: "2",
                              name: "Al Thawra",
                              status: "Open",
                              nextTrain: "5 min",
                              description:
                                  "The central hub of the Red Line, located in the heart of Khartoum near major government buildings and the historic Blue Nile bridge.",
                            ),
                            LineStation(
                              number: "3",
                              name: "Wad Nubawi",
                              status: "Open",
                              nextTrain: "8 min",
                              description:
                                  "A major commercial and residential area with several shopping centers and educational institutions.",
                            ),
                            LineStation(
                              number: "4",
                              name: "Khartoum Central",
                              status: "Open",
                              nextTrain: "11 min",
                              description:
                                  "A vibrant neighborhood known for its cultural sites and lively atmosphere.",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 60,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 11, 152, 16),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: const Color.fromARGB(255, 11, 152, 16),
                          ),
                          child: Center(
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
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 10,
                                top: 20,
                              ),
                              child: Text(
                                "Green Line",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "     Omdur Central ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 15,
                                ),
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
                              margin: EdgeInsets.only(left: 15, top: 20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 11, 152, 16),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
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
                        Container(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(left: 29),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              if (matches("Green Line")) SizedBox(height: 10),

              // routes card 3 — Blue Line
              if (matches("Blue Line"))
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LineStationsScreen(
                          lineName: "Blue Line",
                          lineColor: Colors.blue,
                          stations: [
                            LineStation(
                              number: "1",
                              name: "Khartoum central",
                              status: "Open",
                              nextTrain: "1 min",
                              description:
                                  "The central hub of the Red Line, located in the heart of Khartoum near major government buildings and the historic Blue Nile bridge.",
                            ),
                            LineStation(
                              number: "2",
                              name: "Al Riyadh",
                              status: "Open",
                              nextTrain: "4 min",
                              description:
                                  "A major commercial and residential area with several shopping centers and educational institutions.",
                            ),
                            LineStation(
                              number: "3",
                              name: "Al Kalakla",
                              status: "Open",
                              nextTrain: "7 min",
                              description:
                                  "A vibrant neighborhood known for its cultural sites and lively atmosphere.",
                            ),
                            LineStation(
                              number: "4",
                              name: "Bahri central",
                              status: "Open",
                              nextTrain: "10 min",
                              description:
                                  "A key transit point with connections to various parts of the city.",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 60,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.blue,
                          ),
                          child: Center(
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
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 10,
                                top: 20,
                              ),
                              child: Text(
                                "Blue Line",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "     Khartoum central ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 15,
                                ),
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
                              margin: EdgeInsets.only(left: 13, top: 20),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
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
                        Container(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(left: 35),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ] else ...[
              // ---- Red Line Stations ----
              if (matches("Khartoum Central"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.red,
                        ),
                        child: Center(
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Khartoum Central",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Red Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Khartoum Central")) SizedBox(height: 10),

              if (matches("Al Mek Nimr"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "2",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Al Mek Nimr",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Red Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Al Mek Nimr")) SizedBox(height: 10),

              if (matches("Kober"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "3",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Kober",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Red Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Kober")) SizedBox(height: 10),

              if (matches("Bahri South"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "4",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Bahri South",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Red Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Bahri South")) SizedBox(height: 10),

              // ---- Green Line Stations ----
              if (matches("Omdurman Central"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                        child: Center(
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Omdurman Central",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Green Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 152, 16),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Omdurman Central")) SizedBox(height: 10),

              if (matches("Al Thawra"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                        child: Center(
                          child: Text(
                            "2",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Al Thawra",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Green Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 152, 16),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Al Thawra")) SizedBox(height: 10),

              if (matches("Wad Nubawi"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                        child: Center(
                          child: Text(
                            "3",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Wad Nubawi",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Green Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 152, 16),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Wad Nubawi")) SizedBox(height: 10),

              // Note: this 4th Green Line card duplicates "Khartoum Central".
              // Since the Red Line's Khartoum Central card already exists above,
              // matching by name alone would show two "Khartoum Central" cards
              // when searching "Khartoum" while on the Stations tab — this is
              // pre-existing duplicate data from before, kept as-is on purpose.
              if (matches("Khartoum Central"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color.fromARGB(255, 11, 152, 16),
                        ),
                        child: Center(
                          child: Text(
                            "4",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Khartoum Central",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Green Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 15, top: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 152, 16),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Khartoum Central")) SizedBox(height: 10),

              // ---- Blue Line Stations ----
              // Note: Blue Line's first station is also "Khartoum Central" —
              // same duplicate-name situation as above, kept as-is.
              if (matches("Khartoum Central"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.blue,
                        ),
                        child: Center(
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Khartoum Central",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Blue Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 13, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Khartoum Central")) SizedBox(height: 10),

              if (matches("Al Riyadh"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "2",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Al Riyadh",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Blue Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 13, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Al Riyadh")) SizedBox(height: 10),

              if (matches("Al Kalakla"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "3",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Al Kalakla",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Blue Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 13, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              if (matches("Al Kalakla")) SizedBox(height: 10),

              if (matches("Bahri Central"))
                Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 60,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "4",
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
                          Padding(
                            padding: EdgeInsetsGeometry.only(left: 10, top: 20),
                            child: Text(
                              "Bahri Central",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "     Blue Line ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_circle_left_outlined, size: 15),
                              Icon(Icons.arrow_circle_right_outlined, size: 15),
                              Text(
                                " Station",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 70,
                            margin: EdgeInsets.only(left: 13, top: 20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Open",
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
                      Container(
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(left: 35),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),

      // bottomNavigationBar:  BottomBar(selectedIndex: 1, onTap:(index) {

      // } ,)
    );
  }
}
