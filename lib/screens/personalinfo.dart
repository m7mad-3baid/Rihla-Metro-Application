import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/PasswordVerifyFirst.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personalInfo extends StatefulWidget {
  @override
  State<personalInfo> createState() => _personalInfoState();
}

class _personalInfoState extends State<personalInfo> {
  // Variables to store user information
  String name = "";
  String email = "";
  bool is_student = false;

  @override
  void initState() {
    super.initState();
    // Load user data when the screen initializes
    loadUser();
  }

  // Load user data from SharedPreferences
  Future<void> loadUser() async {
    // Get SharedPreferences instance
    final prefs = await SharedPreferences.getInstance();

    // Update the state with loaded data or set defaults
    setState(() {
      name = prefs.getString("name") ?? "guest username";
      email = prefs.getString("email") ?? "guest email";
      // Load student status, default to false if not set
      is_student = prefs.getBool("is_student") ?? false;    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color to white
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header section with back button and title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back navigation button
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new_rounded, size: 35),
                  ),
                ),
                // Screen title
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: Text(
                    "My Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            // Avatar section with user initials
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: AlignmentGeometry.center,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    // Background color for avatar
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(100),
                    // Add amber border for verified students
                    border: Border.all(
                      color: is_student ? Colors.amber : Colors.transparent, 
                      width: 10, 
                      strokeAlign: BorderSide.strokeAlignOutside
                    )
                  ),

                  // Inner container for displaying user initials
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: Center(
                      child: Text(
                        // Extract initials from the name
                        // Take first letter of first two words and convert to uppercase
                        name.isNotEmpty
                            ? name
                                  .trim()
                                  .split(" ")
                                  .map((word) => word[0])
                                  .take(2)
                                  .join()
                                  .toUpperCase()
                            : "?", // Show "?" if name is empty

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Spacing between avatar and first info card
            SizedBox(height: 40),

            // Full Name information card
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                // Add shadow effect for elevation
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Person icon container
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8EB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.person, color: Colors.blue[900]),
                    ),
                  ),

                  // User name information
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Label text
                        Text(
                          "Accounts Name :",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 63, 85, 95),
                          ),
                        ),

                        SizedBox(height: 3),

                        // Display the user's name
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Push content to the left
                  Spacer(),
                ],
              ),
            ),

            // Spacing between name and email cards
            SizedBox(height: 20),

            // Email information card
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                // Add shadow effect for elevation
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Email icon container
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8EB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.mail_outline_rounded, color: Colors.blue[900]),
                    ),
                  ),

                  // Email information
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Label text
                        Text(
                          "Email :",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 63, 85, 95),
                          ),
                        ),

                        SizedBox(height: 3),

                        // Display the user's email
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Push content to the left
                  Spacer(),
                ],
              ),
            ),

            // Spacing between email and student status card
            SizedBox(height: 20),

            // Student status information card
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                // Add shadow effect for elevation
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // School icon container
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8EB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.school_outlined, color: Colors.blue[900]),
                    ),
                  ),

                  // Student status information
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Label text
                        Text(
                          "Student Status :",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 63, 85, 95),
                          ),
                        ),

                        SizedBox(height: 3),

                        // Display student verification status with icon
                        Row(
                          children: [
                            Text(
                              // Show verified or not verified based on student status
                              is_student ? "Student Status Verified" : "Not Student ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),

                            // Show verified icon only for students
                            if(is_student)
                              Icon(Icons.verified, color: Colors.amber,)
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Push content to the left
                  Spacer(),
                ],
              ),
            ),

            // Spacing before edit button
            SizedBox(height: 100),

            // Edit profile button
            GestureDetector(
               onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Passwordverifyfirst(),
      ),
    );
  },
              child: Container(
                height: 80, 
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[900]
                ),
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Edit icon
                    Icon(Icons.edit_note_rounded, color: Colors.white, size: 30),
                    
                    // Edit button text
                    Text(" Edit Password & Details", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}