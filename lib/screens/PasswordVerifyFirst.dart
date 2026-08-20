import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/editInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_services.dart';

class Passwordverifyfirst extends StatefulWidget {
  @override
  State<Passwordverifyfirst> createState() => _PasswordverifyfirstState();
}

class _PasswordverifyfirstState extends State<Passwordverifyfirst> {
  final passwordcontroller = TextEditingController();

  Future<void> verifyPassword() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email") ?? "";
    String password = passwordcontroller.text;

    final result = await ApiService.login(email, password);

    if (result["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: 
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.check_box_outlined, color: Colors.green,), Text(" Correct Password ")],
          ),

        )
      );


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => editinfo() ));

      
      print("Password correct");
    } else {
      print("Wrong password");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.close, color: Colors.red,), Text(" Wrong Password Try Again")],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9E6),
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
                    "Is It Really You ?!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 80),

            Icon(Icons.remove_red_eye, color: Colors.blue[900], size: 90),

            SizedBox(height: 50),

            Text(
              "Enter your current password",
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Current password",
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.blue[900],
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 40),

            Container(
              height: 60,
              width: 300,

              child: ElevatedButton(
                onPressed: () {
                  verifyPassword();
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
