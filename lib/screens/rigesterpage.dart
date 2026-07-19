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

  bool isStudent = false;
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFBF001C),
                borderRadius: BorderRadius.only(bottomRight:Radius.circular(20), bottomLeft: Radius.circular(20),)
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
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 25,
                      ),
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
                color:  Colors.white,

                child: Column(
                  children: [

                    // Username
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


                    // Email
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


                    // Password
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


                    // Confirm password
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


                    // Student checkbox
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

                            onChanged: (value){
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                "Unlock 50% off all tickets",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),

                              SizedBox(height: 10,)

                            ],
                          )

                        ],
                      ),
                    ),



                    // Terms checkbox
                    Row(
                      children: [

                        Checkbox(
                          value: agreedToTerms,

                          activeColor: Color(0xFFBF001C),

                          onChanged:(value){

                            setState(() {
                              agreedToTerms = value ?? false;
                            });

                          },
                        ),


                        Text(
                          "I agree to Terms & Privacy Policy",
                          style: TextStyle(
                            color: Color(0xFFBF001C),
                          ),
                        )

                      ],
                    ),



                    // Register button
                    // Register button
ElevatedButton(

  onPressed: agreedToTerms
      ? () async {

          final result =
              await ApiService.register(
            usernameController.text,
            emailController.text,
            passwordController.text,
            isStudent,
          );


          print(result);


          if (result["success"] == true) {

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Loginpage(),
              ),
            );

          }

          else {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result["message"]),
              ),
            );

          }

        }
      : null,


  child: Text(
    "Create Your Account",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),


  style: ElevatedButton.styleFrom(

    backgroundColor: Color(0xFFBF001C),

    minimumSize: Size(395,50),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),

  ),

),



                    SizedBox(height:10),


                    Text(
                      " Already Have An Account ? ",
                      style: TextStyle(
                        color: Color(0xFFBF001C),
                      ),
                    ),

                    SizedBox(height: 25,),



                    ElevatedButton(

                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:(context)=>Loginpage(),
                          ),
                        );
                      },


                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Color(0xFFBF001C),
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(395,50),
                      ),

                    )

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