import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';
import 'package:rihla_4_0/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/session_services.dart';

// Profile screen displaying user info, grouped settings cards, and logout
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // User data loaded from local storage
  String name = "";
  String email = "";
  bool isStudent = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  // Fetch user details from SharedPreferences
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Screen title
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

              // User profile card with avatar, name, email, and student badge
              Container(
                width: 370,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF00515A),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    // Decorative background profile icon
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
                          // Account label
                          const Text(
                            "ACCOUNT",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Avatar and user info row
                          Row(
                            children: [
                              // Avatar circle with initials
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
                              // Name and email
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
                          // Verified student badge (shown only if isStudent is true)
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

              // ── Account Section ──────────────────────────
              // Section header
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 103, 103, 103),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Account settings card: Personal Information & Wallet
              Container(
                height: 170,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F3F3),
                  border: Border.all(
                    color: const Color.fromARGB(255, 166, 193, 207),
                    width: 0.25,
                  ),
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
                    // Personal Information row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon container
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFC4D5D9),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.person_outline_rounded),
                          ),
                        ),
                        // Label
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
                        // Navigation arrow
                        Padding(
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Divider(indent: 10, endIndent: 10),

                    // Wallet row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon container
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFC4D5D9),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.wallet),
                          ),
                        ),
                        // Label
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
                        // Navigation arrow
                        Padding(
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // ── Travel Section ──────────────────────────
              // Section header
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Travel",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 103, 103, 103),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Travel settings card: Route Alert & Rides History
              Container(
                height: 170,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F3F3),
                  border: Border.all(
                    color: const Color.fromARGB(255, 166, 193, 207),
                    width: 0.25,
                  ),
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
                    // Route Alert row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon container
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFC4D5D9),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.notifications_active_outlined),
                          ),
                        ),
                        // Label
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
                        // Navigation arrow
                        Padding(
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Divider(indent: 10, endIndent: 10),

                    // Rides History row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon container
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFC4D5D9),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.history_outlined),
                          ),
                        ),
                        // Label
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
                        // Navigation arrow
                        Padding(
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // ── App Section ─────────────────────────────
              // Section header
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "App",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 103, 103, 103),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // App settings card: Preferences & About Rihla
              Container(
                height: 170,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF5F3F3),
                  border: Border.all(
                    color: const Color.fromARGB(255, 166, 193, 207),
                    width: 0.25,
                  ),
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
                    // Preferences row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon container
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFC4D5D9),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.settings),
                          ),
                        ),
                        // Label
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            "Preffrences",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Spacer(),
                        // Navigation arrow
                        Padding(
                          padding: const EdgeInsets.only(top: 15, right: 10),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Divider(indent: 10, endIndent: 10),

                    // About Rihla row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Icon container
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFC4D5D9),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(Icons.info_outlined),
                          ),
                        ),
                        // Label
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
                        // Navigation arrow
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

              // Logout button
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
                      // Logout icon
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.logout_rounded,
                          color: Color(0xFF93000A),
                          size: 30,
                        ),
                      ),
                      // Logout label
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
                  // Clears session and navigates to login screen
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