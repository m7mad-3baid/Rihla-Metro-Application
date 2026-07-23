import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

// StatefulWidget for the Tickets screen, allowing toggle between Buy and My Tickets views
class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  // Boolean state to track which toggle option is selected
  // true = "Buy A Ticket" view, false = "My Tickets" view
  bool isBuySelected = true;
  bool showQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Page header with title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: const Text(
                      "Tickets",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Toggle button container for switching between Buy A Ticket and My Tickets
              Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFFE2E2E2),
                ),
                child: Row(
                  children: [
                    // "Buy A Ticket" toggle button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBuySelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            // Highlight selected button with red color
                            color: isBuySelected
                                ? const Color(0xFF00515A)
                                : const Color(0xFFE2E2E2),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Buy A Ticket",
                              style: TextStyle(
                                color: isBuySelected
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

                    // "My Tickets" toggle button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBuySelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            // Highlight selected button with red color
                            color: isBuySelected
                                ? const Color(0xFFE2E2E2)
                                : Color(0xFF00515A),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "My Tickets",
                              style: TextStyle(
                                color: isBuySelected
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

              SizedBox(height: 25),

              // Conditionally render content based on selected toggle
              if (isBuySelected) ...[
                // First ticket pricing card - 2-HOUR Ticket
                Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    // Outer shadow effect for card elevation
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        spreadRadius: 0.5,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),

                  // Card content elements
                  child: Column(
                    children: [
                      // Ticket name and price row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 35),
                            child: Text(
                              "2-HOUR Ticket",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 10),
                            child: Text(
                              "200 SDG",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 213, 33, 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Ticket description text
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "**unlimited rides on all 3 metro lines for 2 hours after activation.",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // View Details link row
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 180, 12, 0),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color.fromARGB(255, 58, 4, 0),
                            size: 15,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Purchase button
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 180, 12, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Purchase Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Second ticket pricing card - 3-DAYS Pass
                Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    // Outer shadow effect for card elevation
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        spreadRadius: 0.5,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),

                  // Card content elements
                  child: Column(
                    children: [
                      // Ticket name and price row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 35),
                            child: Text(
                              "3-DAYS Pass",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 10),
                            child: Text(
                              "900 SDG",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 213, 33, 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Ticket description text
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "**unlimited rides on all 3 metro lines for 3 Days.",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // View Details link row
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 180, 12, 0),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color.fromARGB(255, 58, 4, 0),
                            size: 15,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Purchase button
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 180, 12, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Purchase Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Third ticket pricing card - STUDENT pass
                Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    // Outer shadow effect for card elevation
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        spreadRadius: 0.5,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),

                  // Card content elements
                  child: Column(
                    children: [
                      // Ticket name and price row with student badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 35),
                            child: Text(
                              "STUDENT pass",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 10),
                            child: Column(
                              children: [
                                // Student discount badge
                                Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 3),
                                  height: 30,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      47,
                                      255,
                                      191,
                                      0,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.amber),
                                  ),

                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Icon(
                                          Icons.backpack_rounded,
                                          color: const Color.fromARGB(
                                            255,
                                            135,
                                            120,
                                            0,
                                          ),
                                          size: 20,
                                        ),
                                      ),

                                      Text(
                                        "  students",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            165,
                                            124,
                                            0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Student ticket price
                                Text(
                                  "100 SDG",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                      255,
                                      213,
                                      33,
                                      20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Student ticket description text
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "** 50% discoint on the 2-HOURS Ticket for students with valid ID",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // View Details link row
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 180, 12, 0),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color.fromARGB(255, 58, 4, 0),
                            size: 15,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Purchase button
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 180, 12, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Purchase Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
              ] else ...[
                // My Tickets view - Active trip card
                AnimatedContainer(
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut,

                  height: showQR ? 420 : 250,

                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFF355C8A),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Stack(
                    children: [
                      // Decorative background ticket icon
                      Positioned(
                        right: -20,
                        top: -15,
                        child: Opacity(
                          opacity: 0.15,
                          child: Icon(
                            Icons.confirmation_num,
                            size: 120,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // Main card content
                      Padding(
                        padding: EdgeInsets.all(20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            // Active trip status badge
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Text(
                                "ACTIVE TRIP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 15),

                            // Trip route information
                            Text(
                              "2-HOURS-TICKET",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 300),

                                  child: showQR
                                      ? Icon(
                                          Icons.qr_code_2_sharp,
                                          size: 170,
                                          key: ValueKey(true),
                                          opticalSize: 170,
                                          color: Colors.white,
                                        )
                                      : SizedBox(key: ValueKey(false)),
                                ),
                              ),
                            ),

                            Spacer(),

                            // Departure time and QR code button row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                // Departure time column
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "Active Untill:",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),

                                    Text(
                                      "14:30 PM ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Today ",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          158,
                                          255,
                                          255,
                                          255,
                                        ),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                // View QR code button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showQR = !showQR;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),

                                    child: Text( 
                                      showQR?
                                      "Hide QR"
                                      :"View QR",
                                      style: TextStyle(
                                        color: Color(0xFF355C8A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
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
                SizedBox(height: 25),
              ],
            ],
          ),
        ),
      ),
      // Bottom navigation bar - currently commented out
      // bottomNavigationBar: BottomBar(selectedIndex: 2, onTap: (index) {},),
    );
  }
}
