import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/loginpage.dart';

import '../services/api_services.dart';

class Rigesterpage extends StatefulWidget {
  const Rigesterpage({super.key});

  @override
  State<Rigesterpage> createState() => _RigesterpageState();
}

class _RigesterpageState extends State<Rigesterpage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  bool isStudent = false;
  bool agreedToTerms = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF122E64),
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
                    Text(
                      "RIHLA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "CREATE AN ACCOUNT",
                      style: TextStyle(color: Colors.grey[300], fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Container(
                padding: EdgeInsets.all(25),
                height: 750,
                width: 400,
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "USERNAME",
                        style: TextStyle(
                          color: Color(0xFF122E64),
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

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "EMAIL",
                          style: TextStyle(
                            color: Color(0xFF122E64),
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

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "PASSWORD",
                          style: TextStyle(
                            color: Color(0xFF122E64),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
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

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "CONFIRM PASSWORD",
                          style: TextStyle(
                            color: Color(0xFF122E64),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      controller: repasswordController,
                      obscureText: true,
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
                            activeColor: Color(0xFF122E64),
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
                              if (isStudent) ...[
                                SizedBox(height: 10),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: studentIdController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(Icons.badge_outlined),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: "Student ID",
                                    ),
                                  ),
                                ),
                              ],
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Checkbox(
                          value: agreedToTerms,
                          activeColor: Color(0xFF122E64),
                          onChanged: (value) {
                            setState(() {
                              agreedToTerms = value ?? false;
                            });
                          },
                        ),
                        Text(
                          "I agree to Terms & Privacy Policy",
                          style: TextStyle(color: Color(0xFF122E64)),
                        ),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: agreedToTerms
                          ? () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (usernameController.text.isEmpty ||
                                  emailController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  repasswordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please fill all fields"),
                                  ),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              }

                              if (passwordController.text !=
                                  repasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Passwords dont match"),
                                  ),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              }
                              const validStudentIds = [
                                "202103056",
                                "202103035",
                              ];

                              if (isStudent &&
                                  !validStudentIds.contains(
                                    studentIdController.text.trim(),
                                  )) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Invalid student ID")),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              }

                              final result = await ApiService.register(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                isStudent,
                                isStudent
                                    ? studentIdController.text.trim()
                                    : "",
                              );

                              setState(() {
                                isLoading = false;
                              });

                              print(result);

                              if (result["success"] == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Account created successfully",
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Loginpage(),
                                    ),
                                  );
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result["message"])),
                                );
                              }
                            }
                          : null,
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Create Your Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF122E64),
                        minimumSize: Size(395, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      " Already Have An Account ? ",
                      style: TextStyle(color: Color(0xFF122E64)),
                    ),

                    SizedBox(height: 25),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Color(0xFF122E64)),
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
