import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_services.dart';

class editinfo extends StatefulWidget {
  @override
  State<editinfo> createState() => _editinfoState();
}

class _editinfoState extends State<editinfo> {
  String name = "";
  String email = "";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";

      nameController.text = name;
      emailController.text = email;
    });
  }

  Future<void> saveChanges() async {
    String newName = nameController.text;
    String newEmail = emailController.text;
    String newPassword = newPasswordController.text;
    String rePassword = rePasswordController.text;

    if (newPassword.isNotEmpty && newPassword != rePassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    final prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("user_id")!;

    var result = await ApiService.updateprofile(
      userId,
      newName,
      newEmail,
      newPassword,
    );

    await prefs.setString("name", newName);

    await prefs.setString("email", newEmail);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Information Updated Successfully"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9E6),

      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),

                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Icon(Icons.arrow_back_ios_new_rounded, size: 35),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),

                  child: Text(
                    "Edit Info",

                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            SizedBox(height: 40),

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
                controller: nameController,

                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white,

                  labelText: "Full Name",

                  prefixIcon: Icon(Icons.person, color: Colors.blue[900]),

                  border: InputBorder.none,
                ),
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
                controller: emailController,

                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white,

                  labelText: "Email",

                  prefixIcon: Icon(
                    Icons.mail_outline_rounded,

                    color: Colors.blue[900],
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: 350,

              child: Text(
                "Leave Passwords Empty if You Dont Want to Change Them *",

                style: TextStyle(color: Colors.grey[700], fontSize: 12),
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
                controller: newPasswordController,

                obscureText: true,

                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white,

                  labelText: "New Password",

                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,

                    color: Colors.blue[900],
                  ),

                  border: InputBorder.none,
                ),
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
                controller: rePasswordController,

                obscureText: true,

                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white,

                  labelText: "Confirm Password",

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
                  saveChanges();
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                child: Text(
                  "Save Changes",

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
