import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/loginpage.dart';

class Rigesterpage extends StatefulWidget {
  const Rigesterpage({super.key});

  @override
  State<Rigesterpage> createState() => _RigesterpageState();
}

class _RigesterpageState extends State<Rigesterpage> {
  bool isStudent = false;
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: 400,
              color: Color(0xFFBF001C),
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
                    Text(
                      "METRO",
                      style: TextStyle(color: Colors.grey[300], fontSize: 25),
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
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "USERNAME",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    TextField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        prefixIcon: const Icon(Icons.person_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10, top: 3),
                        labelText: "Username",
                        labelStyle: const TextStyle(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "EMAIL",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    TextField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10, top: 3),
                        labelText: "Email",
                        labelStyle: const TextStyle(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "PASSWORD",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    TextField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10, top: 3),
                        labelText: "Password",
                        labelStyle: const TextStyle(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "CONFIRM PASSWORD",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    TextField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10, top: 3),
                        labelText: "Re Enter Your Password",
                        labelStyle: const TextStyle(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: 395,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "I'm a student",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Unlock 50% off all tickets",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Terms & Privacy checkbox
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: 395,
                      child: Row(
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
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(text: "I agree to the "),
                                  TextSpan(
                                    text: "Terms & Privacy Policy",
                                    style: TextStyle(
                                      color: Color(0xFFBF001C),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      height: 50,
                      width: 395,
                      child: ElevatedButton(
                        child: Text(
                          "Create Your Account",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: agreedToTerms
                            ? () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginpage(),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFBF001C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "---------- Already Have An Account ? ----------",
                        style: TextStyle(
                          color: Color(0xFFBF001C),
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 395,
                      child: ElevatedButton(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBF001C),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
