import 'package:flutter/material.dart';

class Rigesterpage extends StatefulWidget {
  const Rigesterpage({super.key});

  @override
  State<Rigesterpage> createState() => _RigesterpageState();
}

class _RigesterpageState extends State<Rigesterpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page")),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "USERNAME",
                        style: TextStyle(
                          color: Colors.red,
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
                      prefixIcon: const Icon(Icons.person),
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
                          color: Colors.red,
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
                      prefixIcon: const Icon(Icons.email),
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
                          color: Colors.red,
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
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "CONFIRM PASSWORD",
                        style: TextStyle(
                          color: Colors.red,
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
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10, top: 3),
                      labelText: "Re Enter Your Password",
                      labelStyle: const TextStyle(),
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
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "---------- Already Have An Account ? ----------",
                      style: TextStyle(
                        color: Colors.red,
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
