import 'package:flutter/material.dart';

import '../services/api_services.dart';
import '../screens/MainScreen.dart';
import '../screens/rigesterpage.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFBF001C),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
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
                    "SIGN IN TO CONTINUE",
                    style: TextStyle(color: const Color.fromARGB(255, 252, 251, 251), fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(25),
              height: 500,
              width: 400,
              color:  Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 250),
                    height: 35,
                    child: Text(
                      "USERNAME",
                      style: TextStyle(
                        color: Color(0xFFBF001C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: emailController,

                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 238, 240, 243),
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
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 250),
                    height: 35,
                    child: Text(
                      "PASSWORD",
                      style: TextStyle(
                        color: Color(0xFFBF001C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    controller: passwordController,
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
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: Color(0xFFBF001C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    height: 50,
                    width: 395,
                    child: ElevatedButton(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        final result = await ApiService.login(
                          emailController.text,
                          passwordController.text,
                        );

                        if (result["success"] == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        } else {
                          print("login failed ");
                        }
                      },
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
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "---------- Dont Have An Account ? ----------",
                      style: TextStyle(
                        color: Color(0xFFBF001C),
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: 395,
                    child: ElevatedButton(
                      child: Text(
                        "SIGN UP",
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
                            builder: (context) => Rigesterpage(),
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
    );
  }
}
