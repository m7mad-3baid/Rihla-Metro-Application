import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(25),
              height: 600,
              width: 400,
              color: Colors.grey[300],
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 250),
                    height: 35,
                    child: Text(
                      "USERNAME",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
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
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      prefixIcon: const Icon(Icons.lock),
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
                          color: Colors.red,
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
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
                        color: Colors.red,
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
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {},
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
