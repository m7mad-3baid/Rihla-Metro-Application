import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rihla_4_0/screens/wallet.dart';
import 'Profile.dart';
import 'package:rihla_4_0/screens/fullMapPage.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
import 'package:rihla_4_0/widgets/metro_preview.dart';
// import '../widgets/rihla_map.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rihla_4_0/screens/Studentinfo.dart';
// import 'package:rihla_4_0/screens/fullMapPage.dart';

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

                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        print("AVATAR CLICKED");

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 20,
                          right: 30,
                        ),

                        child: Container(
                          width: 60,
                          height: 60,

                          decoration: BoxDecoration(
                            color: Color(0xFFE4E1F7),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Color.fromARGB(255, 157, 142, 255),
                            ),
                          ),

                          child: Center(
                            child: Text(
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
                    ),
                  ),
                  // Greeting text
                  Container(
                    margin: const EdgeInsets.only(top: 30, right: 55, left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(
                                "Hababak ",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Image.asset(
                                "assets/imgs/handwave.png",
                                scale: 5,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Notification bell icon
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 20),
                    child: Icon(
                      CupertinoIcons.bell,
                      color: Color(0xFF00515A),
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // Search bar widget
              Searchbarwidget(),
              SizedBox(height: 30),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 180,
                  width: 350,
                  decoration: BoxDecoration(color: Color(0xFF00515A)),

                  child: Stack(
                    children: [
                      // BACKGROUND TRAIN ICON
                      Positioned(
                        right: -20,
                        top: -10,
                        child: Opacity(
                          opacity: 0.15,
                          child: Icon(
                            Icons.train,
                            size: 120,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // CARD CONTENT
                      Padding(
                        padding: EdgeInsets.all(20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "ON TIME",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              "Next Train",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),

                            Text(
                              "Green Line • Platform 3",
                              style: TextStyle(color: Colors.white70),
                            ),

                            Spacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "5 mins away",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FullMapPage(),
                                      ),
                                    );
                                  },

                                  child: Icon(
                                    Icons.arrow_circle_right_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              // Map section title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Metro Network",
                      style: TextStyle(fontSize: 25, color: Color(0xFF00515A)),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Tap A Line To Explore Stations",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              // Interactive map widget
              MetroPreview(),

              SizedBox(height: 10),
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

              // Next train information card
              SizedBox(height: 20),
              // Student discount promotional card
              GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  print("STUDENT CARD CLICKED");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Studentinfo()),
                  );
                },

                child: Container(
                  width: 350,
                  height: 170,

                  decoration: BoxDecoration(
                    color: Color(0xFFFFF1C3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFFFC641)),
                  ),

                  child: Stack(
                    children: [
                      // BACKGROUND SCHOOL ICON
                      Positioned(
                        right: -20,
                        top: -15,

                        child: Opacity(
                          opacity: 0.15,

                          child: Icon(
                            Icons.school,
                            size: 120,
                            color: Color(0xFF7C5700),
                          ),
                        ),
                      ),

                      // CARD CONTENT
                      Padding(
                        padding: EdgeInsets.all(20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "STUDENT BENEFIT",
                              style: TextStyle(
                                color: Color(0xFF7C5700),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              "Student Discount",
                              style: TextStyle(
                                color: Color(0xFF7C5700),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Save up to 50% on all rides",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),

                            Spacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Verify student ID",
                                  style: TextStyle(
                                    color: Color(0xFF7C5700),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF7C5700),
                                ),
                              ],
                            ),
                          ],
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wallet()),
                      );
                    },
                    child: _buildQuickAction(
                      icon: Icons.wallet_rounded,
                      title: "Top-Up",
                      color: Color.fromARGB(255, 0, 191, 51),
                    ),
                  ),
                  GestureDetector(
                    onTap:() {
                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullMapPage(),
                                    ),
                                  );
                    },
                    child: _buildQuickAction(
                      icon: Icons.location_pin,
                      title: "Nearby",
                      color: Color.fromARGB(255, 226, 198, 40),
                    ),
                  ),
                ],
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
  // Builds the small action cards (Routes, Tickets, Favorites, Nearby)
  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      // Card size
      width: 150,
      height: 170,

      decoration: BoxDecoration(
        // Main card background
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        // Soft premium shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Stack(
        children: [
          // =====================================
          // BACKGROUND FADED ICON
          // =====================================
          // Large icon placed behind the content
          // with low opacity like Next Train card
          Positioned(
            right: -15,
            top: -15,

            child: Opacity(
              opacity: 0.12,

              child: Icon(icon, size: 100, color: color),
            ),
          ),

          // =====================================
          // CARD CONTENT
          // =====================================
          Padding(
            padding: EdgeInsets.all(15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Small visible icon
                // Icon(

                //   icon,

                //   color: color,

                //   size: 32,

                // ),
                Spacer(),

                // Card title
                Text(
                  title,

                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ],
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
