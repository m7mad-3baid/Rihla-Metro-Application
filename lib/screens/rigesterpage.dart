import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/loginpage.dart';

import '../services/api_services.dart';

class Rigesterpage extends StatefulWidget {
  const Rigesterpage({super.key});

  @override
  State<Rigesterpage> createState() => _RigesterpageState();
}

class _RigesterpageState extends State<Rigesterpage> {
  // ============================================================
  // CONTROLLERS FOR TEXT FIELDS
  // ============================================================
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  // ============================================================
  // STATE VARIABLES
  // ============================================================
  bool isStudent = false; // Tracks if user is a student
  bool agreedToTerms = false; // Tracks if user agreed to terms
  bool isLoading = false; // for the loading circle

  // ============================================================
  // BUILD METHOD - UI RENDERING
  // ============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ============================================================
            // HEADER SECTION - Red background with app name and title
            // ============================================================
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFBF001C), // Brand red color
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              height: 300,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App name
                    Text(
                      "RIHLA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Page title
                    Text(
                      "CREATE AN ACCOUNT",
                      style: TextStyle(color: Colors.grey[300], fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // FORM SECTION - White container with all input fields
            // ============================================================
            Center(
              child: Container(
                padding: EdgeInsets.all(25),
                height: 750,
                width: 400,
                color: Colors.white,
                child: Column(
                  children: [
                    // ==========================================================
                    // USERNAME FIELD
                    // ==========================================================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "USERNAME",
                        style: TextStyle(
                          color: Color(0xFFBF001C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.person_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Username",
                      ),
                    ),

                    // ==========================================================
                    // EMAIL FIELD
                    // ==========================================================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "EMAIL",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email",
                      ),
                    ),

                    // ==========================================================
                    // PASSWORD FIELD
                    // ==========================================================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "PASSWORD",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true, // Hides password characters
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                      ),
                    ),

                    // ==========================================================
                    // CONFIRM PASSWORD FIELD
                    // ==========================================================
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "CONFIRM PASSWORD",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: repasswordController,
                      obscureText: true, // Hides password characters
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Re Enter Your Password",
                      ),
                    ),

                    // ==========================================================
                    // STUDENT CHECKBOX - Toggles student discount
                    // ==========================================================
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isStudent,
                            activeColor: Color(0xFFBF001C),
                            onChanged: (value) {
                              setState(() {
                                isStudent = value ?? false;
                              });
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I'm a student",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Unlock 50% off all tickets",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // ==========================================================
                    // TERMS AND CONDITIONS CHECKBOX
                    // ==========================================================
                    Row(
                      children: [
                        Checkbox(
                          value: agreedToTerms,
                          activeColor: Color(0xFFBF001C),
                          onChanged: (value) {
                            setState(() {
                              agreedToTerms = value ?? false;
                            });
                          },
                        ),
                        Text(
                          "I agree to Terms & Privacy Policy",
                          style: TextStyle(color: Color(0xFFBF001C)),
                        ),
                      ],
                    ),

                    // ==========================================================
                    // REGISTER BUTTON - Creates account (only if terms agreed)
                    // ==========================================================
                    ElevatedButton(
                      onPressed: agreedToTerms
                          ? () async {
                              setState(() {
                                isLoading = true;
                              });
                              // Validate that all fields are filled
                              if (usernameController.text.isEmpty ||
                                  emailController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  repasswordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please fill all fields"),
                                  ),
                                );
                                return;
                              }

                              if (passwordController.text !=
                                  repasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Passwords dont match"),
                                  ),
                                );

                                return;
                              }

                              // Call API to register user
                              final result = await ApiService.register(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                isStudent,
                              );

                              setState(() {
                                isLoading = false;
                              });

                              // Log result for debugging
                              print(result);

                              // Check if registration was successful
                              if (result["success"] == true) {
                                // Show success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Account created successfully",
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                // Navigate to login page after delay
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Loginpage(),
                                    ),
                                  );
                                });
                              } else {
                                // Show error message from API
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result["message"])),
                                );
                              }
                            }
                          : null, // Button disabled if terms not agreed
                      child: isLoading
                      ?CircularProgressIndicator()
                      
                       :Text(
                        "Create Your Account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFBF001C),
                        minimumSize: Size(395, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // ==========================================================
                    // "ALREADY HAVE AN ACCOUNT" TEXT
                    // ==========================================================
                    Text(
                      " Already Have An Account ? ",
                      style: TextStyle(color: Color(0xFFBF001C)),
                    ),

                    SizedBox(height: 25),

                    // ==========================================================
                    // LOGIN BUTTON - Navigates to login page
                    // ==========================================================
                    ElevatedButton(
                      onPressed: () {
                        // Navigate back to login page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Color(0xFFBF001C)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(395, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
