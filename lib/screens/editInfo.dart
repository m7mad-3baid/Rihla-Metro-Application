import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class editinfo extends StatefulWidget {
  @override
  State<editinfo> createState() => _editinfoState();
}

class _editinfoState extends State<editinfo> {
  // Variables to store user information
  String name = "";
  String email = "";
  // String password = "";
  bool is_student = false;

  // Controller for the name text field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load existing user data when screen initializes
    loadUser();
  }

  // Load user data from SharedPreferences
  Future<void> loadUser() async {
    // Get SharedPreferences instance
    final prefs = await SharedPreferences.getInstance();

    // Update state with loaded data or set empty defaults
    setState(() {
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";
      is_student = prefs.getBool("is_student") ?? false;

      // Populate the name text field with existing name
      nameController.text = name;
      emailController.text = email;
    });
  }

  Future<void> saveChanges() async {

  String newName = nameController.text;
  String newEmail = emailController.text;
  String newPassword = newPasswordController.text;
  String rePassword = rePasswordController.text;
  bool newStudentStatus = is_student;


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


  await prefs.setString("name", newName);

  await prefs.setString("email", newEmail);

  await prefs.setBool("is_student", newStudentStatus);


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
                    "Edit Info",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            // Spacing between header and instruction text
            SizedBox(height: 40),

            // // Instruction text for the user
            // Container(
            //   width: 375,
            //   child: Text(
            //     "Kindly fill out your informations then submit it ! *",
            //     style: TextStyle(color: Colors.grey[700]),
            //   ),
            // ),

            // Spacing between instruction text and input field
            SizedBox(height: 40),

            // Full Name input field container
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                // Add shadow effect for elevation
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                // Connect the text editing controller
                controller: nameController,
                decoration: InputDecoration(
                  // Label for the name field
                  labelText: "Full Name",
                  // Person icon as prefix for visual indication
                  prefixIcon: Icon(Icons.person, color: Colors.blue[900]),
                  // Remove default border for cleaner look
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
              child: 
              TextField(
                controller: rePasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
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
              height: 80,
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

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Student Status",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Switch(
                    value: is_student,

                    onChanged: (value) {
                      setState(() {
                        is_student = value;
                      });
                    },

                    activeColor: Colors.blue[900],
                  ),
                ],
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
