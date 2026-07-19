import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  bool isTrainSelected = true;

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
              // routes cards 1
              Container(
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

              SizedBox(height: 10),
              // routes card 2
              Container(
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
              SizedBox(height: 10),

              //routes card 3
              Container(
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
            ] else ...[
              // ---- Red Line Stations ----
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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

              // ---- Green Line Stations ----
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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

              // ---- Blue Line Stations ----
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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

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
              SizedBox(height: 10),

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
