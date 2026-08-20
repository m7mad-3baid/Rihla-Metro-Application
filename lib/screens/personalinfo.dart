import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/PasswordVerifyFirst.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personalInfo extends StatefulWidget {
  @override
  State<personalInfo> createState() => _personalInfoState();
}

class _personalInfoState extends State<personalInfo> {
  String name = "";
  String email = "";
  bool is_student = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "guest username";
      email = prefs.getString("email") ?? "guest email";
      is_student = prefs.getBool("is_student") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    "My Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: AlignmentGeometry.center,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: is_student ? Colors.amber : Colors.transparent,
                      width: 10,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),

                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: Center(
                      child: Text(
                        name.isNotEmpty
                            ? name
                                  .trim()
                                  .split(" ")
                                  .map((word) => word[0])
                                  .take(2)
                                  .join()
                                  .toUpperCase()
                            : "?",

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

            SizedBox(height: 40),

            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E2E2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.person, color: Colors.blue[900]),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Accounts Name :",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 63, 85, 95),
                          ),
                        ),

                        SizedBox(height: 3),

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

                  Spacer(),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E2E2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email :",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 63, 85, 95),
                          ),
                        ),

                        SizedBox(height: 3),

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

                  Spacer(),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E2E2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.school_outlined,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Student Status :",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 63, 85, 95),
                          ),
                        ),

                        SizedBox(height: 3),

                        Row(
                          children: [
                            Text(
                              is_student
                                  ? "Student Status Verified"
                                  : "Not Student ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),

                            if (is_student)
                              Icon(Icons.verified, color: Colors.amber),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                ],
              ),
            ),

            SizedBox(height: 100),

            GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Passwordverifyfirst(),
                  ),
                );

                await loadUser();
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[900],
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_note_rounded,
                      color: Colors.white,
                      size: 30,
                    ),

                    Text(
                      " Edit Password & Details",
                      style: TextStyle(color: Colors.white),
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
