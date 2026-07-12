import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: const Text(
                      "Tickets",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Icon(
                      Icons.money_rounded,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 35,
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Container(
                        height: 30,
                        width: 130,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 180, 12, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Buy A Ticket",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
          
              // tickets prices card
              Container(
                height: 210,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.grey, width: 0.5),
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
          
                // elements
                child: Column(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "**unlimited rides on all 3 metro lines for 2 hours after activation.",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                      ),
                    ),
                    SizedBox(height: 10),
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
          
              //second card
              Container(
                height: 210,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.grey, width: 0.5),
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
          
                // elements
                child: Column(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "**unlimited rides on all 3 metro lines for 3 Days.",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                      ),
                    ),
                    SizedBox(height: 10),
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
          
              //third card
              Container(
                height: 220,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.grey, width: 0.5),
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
          
                // elements
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 35),
                          child: Text(
                            "STUDENT TICKET",
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
                              Container(
                                margin: EdgeInsets.only(top: 5,bottom: 3),
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(47, 255, 191, 0),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.amber)
                                ),
          
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Icon(Icons.backpack_rounded,color: const Color.fromARGB(255, 135, 120, 0),size: 20,),
                                    ),
                                    
                                    Text("  students", style: TextStyle(color: const Color.fromARGB(255, 165, 124, 0)),)
                                  ],
                                ),
                              )
                              ,Text(
                                "100 SDG",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 213, 33, 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "** 50% discoint on the 2-HOURS Ticket for students with valid ID",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                      ),
                    ),
                    SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
    // bottomNavigationBar:  BottomBar(selectedIndex: 2, onTap: (index) {
      
    // },),
    );
  }
}