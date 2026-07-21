import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';
import 'package:rihla_4_0/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/session_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "";
  bool isStudent = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "Guest";
      email = prefs.getString("email") ?? "";
      isStudent = prefs.getBool("is_student") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFFCF9F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Container(
                height: 150,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(color: Colors.blueGrey, width: 0.5),
                ),

                child: Row(
                  children: [
                    //the circle
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 60,
                        width: 60,

                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),

                        // text for profile
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(email, style: TextStyle(color: Colors.blueGrey)),
                          SizedBox(height: 20),

                          //the pill
                          if (isStudent)
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(131, 255, 214, 64),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.amber),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.star,
                                      color: const Color.fromARGB(
                                        255,
                                        172,
                                        130,
                                        5,
                                      ),
                                      size: 20,
                                    ),
                                  ),
                                  Text(" Student Discount"),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // 2nd section
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Saved Stations",
                      style: TextStyle(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 103, 103, 103),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              //2ns section 2
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.blueGrey),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle, size: 15, color: Colors.green),
                          Text(" Bahri Central"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.blueGrey),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle, size: 15, color: Colors.red),
                          Text(" Khartoum Central"),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 5),

                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1, color: Colors.blueGrey),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "    + ADD",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 103, 103, 103),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              //settings column
              Container(
                width: 375,
                height: 320,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Column(
                  children: [
                    //first settings row
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 30, top: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 193, 193, 193),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: const Color.fromARGB(255, 74, 74, 74),
                          ),
                        ),
                        //text of container
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 150),
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),

                    Divider(indent: 10, endIndent: 10),

                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 30, top: 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 193, 193, 193),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.train_outlined,
                            color: const Color.fromARGB(255, 74, 74, 74),
                          ),
                        ),
                        //text of container
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: Text(
                            "My Trips",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 180),
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Divider(indent: 10, endIndent: 10),

                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 30, top: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 193, 193, 193),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: const Color.fromARGB(255, 74, 74, 74),
                          ),
                        ),
                        //text of container
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Text(
                            "About Rihla",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 160),
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Divider(indent: 10, endIndent: 10),

                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(left: 30, top: 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 193, 193, 193),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.train_outlined,
                            color: const Color.fromARGB(255, 74, 74, 74),
                          ),
                        ),
                        //text of container
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: Text(
                            "Payment methods",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 115),
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                  left: 10,
                  right: 10,
                ),
                height: 50,
                width: 395,
                child: ElevatedButton(
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onPressed: () async {
                    await SessionService.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBF001C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
