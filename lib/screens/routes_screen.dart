import 'package:flutter/material.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  bool isTrainSelected = true;

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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

            // Search Bar
            Container(
              height: 50,
              width: 395,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10, top: 3),
                  labelText: "Search for a route or a station",
                  labelStyle: const TextStyle(),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Train / Bus Toggle
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
                              ? const Color(0xFFC0001A)
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
                              : const Color(0xFFC0001A),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Bus",
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

            // routes cards 1
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
                  // vertical line
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 60,
                    width: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                  ),

                  // line number small box
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
                        height: 20,
                        width: 70,
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

            SizedBox(height: 10),
            // routes card 2
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
                  // vertical line
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 60,
                    width: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 11, 152, 16),
                    ),
                  ),

                  // line number small box
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
                        height: 20,
                        width: 70,
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
            SizedBox(height: 10),

            //routes card 3
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
                  // vertical line
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 60,
                    width: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                  ),

                  // line number small box
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
                        height: 20,
                        width: 70,
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(110, 32, 5, 5),
              spreadRadius: 1,
              offset: Offset(0, 5),
              blurRadius: 20.0,
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 35, top: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.house_rounded,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 50, top: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.route_outlined,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Routes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 50, top: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.airplane_ticket_outlined,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 50, top: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
