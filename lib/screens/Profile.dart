import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/notifcationsScreen.dart';
import 'package:rihla_4_0/screens/personalinfo.dart';
import 'package:rihla_4_0/screens/wallet.dart';
import 'package:rihla_4_0/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/session_services.dart';
import 'package:rihla_4_0/screens/ride_history_screen.dart';
import 'package:rihla_4_0/services/api_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "";
  bool isStudent = false;
  double balance = 0.0;

  @override
  void initState() {
    super.initState();
    loadUser();
    loadBalance();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "Guest";
      email = prefs.getString("email") ?? "";
      isStudent = prefs.getBool("is_student") ?? false;
    });
  }

  Future<void> loadBalance() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("user_id");
    if (userId == null) return;

    final result = await ApiService.getBalance(userId);
    if (result['success'] == true) {
      setState(() {
        balance = double.parse(result['data']['balance'].toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const cardColor = Colors.white;
    const iconBoxColor = Color(0xFFC4D5D9);
    const sectionTitleColor = Color.fromARGB(255, 103, 103, 103);
    const borderColor = Color(0xFFE2E2E2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                width: 370,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF00515A),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      top: -15,
                      child: Opacity(
                        opacity: 0.12,
                        child: Icon(
                          Icons.person,
                          size: 140,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ACCOUNT",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
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
                                    style: const TextStyle(
                                      color: Color(0xFF00515A),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      email,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            "${balance.toStringAsFixed(0)} SDG",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (isStudent)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Verified Student",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 15,
                        color: sectionTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Container(
                height: 170,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cardColor,
                  border: Border.all(color: borderColor, width: 0.25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => personalInfo(),
                          ),
                        );

                        await loadUser();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: iconBoxColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              "Personal Informations",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 5),

                    Divider(
                      color: Color(0xFFE2E2E2),
                      indent: 10,
                      endIndent: 10,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => wallet()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: iconBoxColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(Icons.wallet),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              "wallet",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Travel",
                      style: TextStyle(
                        fontSize: 15,
                        color: sectionTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Container(
                height: 170,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cardColor,
                  border: Border.all(color: borderColor, width: 0.25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationsScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: iconBoxColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(Icons.notifications_active_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              "Route Alert",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 5),

                    Divider(
                      color: Color(0xFFE2E2E2),
                      indent: 10,
                      endIndent: 10,
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RideHistoryScreen(),
                          ),
                        );
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: iconBoxColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(Icons.history_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              "Rides History",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 10),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "App",
                      style: TextStyle(
                        fontSize: 15,
                        color: sectionTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Container(
                height: 85,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cardColor,
                  border: Border.all(color: borderColor, width: 0.25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: iconBoxColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.info_outlined),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            "About Rihla",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 25,
                  left: 10,
                  right: 10,
                ),
                height: 50,
                width: 395,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.logout_rounded,
                          color: Color(0xFF93000A),
                          size: 30,
                        ),
                      ),
                      Text(
                        "LOG OUT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF93000A),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    await SessionService.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFDAD6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
