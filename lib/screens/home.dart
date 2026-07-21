import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/rihla_map.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rihla_4_0/screens/Studentinfo.dart';

// StatefulWidget for the main home page
class HomePage extends StatefulWidget {
  // Callback functions for navigation
  final VoidCallback onViewRoutesTap;
  final VoidCallback onRoutesTap;
  final VoidCallback onTicketsTap;

  const HomePage({
    super.key,
    required this.onViewRoutesTap,
    required this.onRoutesTap,
    required this.onTicketsTap,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

// State class for HomePage
class _HomePageState extends State<HomePage> {
  // User's name, loaded from shared preferences
  String name = "";

  @override
  void initState() {
    super.initState();
    // Load user data when the widget initializes
    loadUser();
  }

  // Loads the user's name from shared preferences
  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Default to "Guest" if no name is saved
      name = prefs.getString("name") ?? "Guest";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header section with avatar, greeting, and notification icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User avatar with initials
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFE4E1F7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromARGB(255, 157, 142, 255),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          // Display first two initials of the user's name, or "?" if empty
                          name.isNotEmpty
                              ? name
                                    .trim()
                                    .split(" ")
                                    .map((w) => w[0])
                                    .take(2)
                                    .join()
                                    .toUpperCase()
                              : "?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 74, 46, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Greeting text
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 40),
                    child: Text(
                      "Hababk $name",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Notification bell icon
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 20),
                    child: Icon(
                      CupertinoIcons.bell,
                      color: Color(0xFFBF001C),
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // Search bar widget
              Searchbarwidget(),
              SizedBox(height: 30),
              // Map section title
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Map", style: TextStyle(fontSize: 25)),
                ),
              ),
              SizedBox(height: 15),
              // Interactive map widget
              RihlaMap(),
              SizedBox(height: 20),
              // Next train information card
              Container(
                height: 300,
                width: 350,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Next train header and time badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 25),
                          child: Text(
                            "NEXT TRAIN",
                            style: TextStyle(
                              color: Color(0xFFBF001C),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 15),
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(0xFFBF001C),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "IN 3 MIN",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 255, 200, 200),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Current station name
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Bahri Central",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Current station indicator
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFFBF001C),
                            size: 15,
                          ),
                          Text(
                            "  Current : Bahri Central",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                    // Vertical line connecting stations
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: 3,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),
                    // Destination station indicator
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFFBF001C),
                            size: 15,
                          ),
                          Text(
                            "  TO : Khartoum Central",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // View route button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Trigger the view routes callback
                          widget.onViewRoutesTap();
                        },
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFBF001C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "View Route",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
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
              SizedBox(height: 20),
              // Student discount promotional card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Studentinfo()),
                  );
                },
                child: Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 241, 195),
                    border: Border.all(
                      color: Color.fromARGB(255, 197, 160, 27),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      // School icon
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.school_outlined,
                          color: Color(0xFF7C5700),
                          size: 30,
                        ),
                      ),
                      // Discount text
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Student Discount",
                              style: TextStyle(
                                color: Color(0xFF7C5700),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "save up to 50% on all rides",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      // Forward arrow icon
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xFF7C5700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Quick actions row 1: Routes and Tickets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: widget.onRoutesTap,
                    child: _buildQuickAction(
                      icon: Icons.map_outlined,
                      title: "Routes",
                      color: Color(0xFFBF001C),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTicketsTap,
                    child: _buildQuickAction(
                      icon: Icons.confirmation_num_outlined,
                      title: "Tickets",
                      color: Color(0xFF284EE2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Quick actions row 2: Favorites and Nearby
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: widget.onRoutesTap,
                    child: _buildQuickAction(
                      icon: CupertinoIcons.heart,
                      title: "Favorites",
                      color: Color.fromARGB(255, 0, 191, 51),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTicketsTap,
                    child: _buildQuickAction(
                      icon: Icons.location_pin,
                      title: "Nearby",
                      color: Color.fromARGB(255, 226, 198, 40),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Saved stations section title
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Saved Stations",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Horizontal scrollable list of saved station pills
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildStationPill("EL MAK NIMIR", Colors.blue),
                    _buildStationPill("KOBER", Colors.red),
                    _buildStationPill("ARKAWEET", Colors.green),
                    _buildStationPill("WAD NUBAWI", Colors.green),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Metro status card showing line statuses
              Container(
                height: 300,
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
                  border: Border.all(color: Colors.blueGrey, width: 0.25),
                ),
                child: Column(
                  children: [
                    // Metro status header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            "Metro Status",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 15),
                          child: Text(
                            "Live Updates",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    // Blue line status
                    _buildMetroLine(
                      "BL",
                      "Blue Line",
                      Colors.blue,
                      "normal",
                      Colors.green,
                    ),
                    Divider(indent: 20, endIndent: 20),
                    // Green line status
                    _buildMetroLine(
                      "GR",
                      "Green Line",
                      Colors.green,
                      "5 MIN Delay",
                      Colors.yellow,
                    ),
                    Divider(indent: 20, endIndent: 20),
                    // Red line status
                    _buildMetroLine(
                      "RD",
                      "Red Line",
                      Colors.red,
                      "Maintenance",
                      Color(0xFF900912),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Builds a quick action card with an icon and title
  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      width: 130,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueGrey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Action icon
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Icon(icon, color: color, size: 30),
          ),
          // Action title
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  // Builds a pill-shaped widget for a saved station
  Widget _buildStationPill(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
      child: Container(
        height: 40,
        width: 150,
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
          border: Border.all(
            width: 0.25,
            color: Color.fromARGB(255, 194, 201, 205),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Colored circle indicating line
            Icon(Icons.circle, size: 15, color: color),
            // Station name
            Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  // Builds a row representing a metro line's status
  Widget _buildMetroLine(
    String abbreviation,
    String lineName,
    Color lineColor,
    String status,
    Color statusColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Line abbreviation badge and name
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: lineColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    abbreviation,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(lineName, style: TextStyle(fontSize: 20)),
            ],
          ),
          // Status indicator and text
          Row(
            children: [
              Icon(Icons.circle, size: 15, color: statusColor),
              SizedBox(width: 5),
              Text(status),
            ],
          ),
        ],
      ),
    );
  }
}
