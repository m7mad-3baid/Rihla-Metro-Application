import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';

void main() {
  runApp(Rihla());
}

class Rihla extends StatefulWidget {
  @override
  State<Rihla> createState() => _RihlaState();
}

class _RihlaState extends State<Rihla> {
  bool isTrainSelected = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
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
                          decoration:  BoxDecoration(
                            color:isTrainSelected
                            ? const Color(0xFFC0001A)
                            :Color(0xFFE2E2E2),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Train",
                              style: TextStyle(
                                color:isTrainSelected
                                ?Colors.white
                                :Color(0xFF627595),
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
                            color:isTrainSelected
                            ? const Color(0xFFE2E2E2)
                            :Color(0xFFC0001A),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Bus",
                              style: TextStyle(
                                color:isTrainSelected
                                ?Color(0xFF627595)
                                :Colors.white,
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

              Container(
                height: 150,
                width: 350,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(110, 255, 193, 7),
                ),



              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
