import 'package:flutter/material.dart';

class Studentinfo extends StatelessWidget {

  const Studentinfo({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              const SizedBox(height: 25),


              const Text(
                "Student Offers",

                style: TextStyle(

                  fontSize: 30,

                  fontWeight: FontWeight.bold,

                ),

              ),


              const SizedBox(height: 20),


              // Coming Soon Banner

              Container(

                margin: const EdgeInsets.symmetric(horizontal: 20),

                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(

                  color: const Color(0xFFFCEFB4),

                  borderRadius: BorderRadius.circular(15),

                ),

                child: const Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Icon(Icons.access_time),

                    SizedBox(width: 10),

                    Text(

                      "Student Discounts Coming Soon",

                      style: TextStyle(

                        fontSize: 16,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ],

                ),

              ),


              const SizedBox(height: 30),


              const Text(

                "🎓 Student Discount",

                style: TextStyle(

                  fontSize: 28,

                  fontWeight: FontWeight.bold,

                ),

              ),


              const SizedBox(height: 15),


              const Text(

                "Travel Smarter, Pay Less",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight: FontWeight.bold,

                ),

              ),


              const SizedBox(height: 10),


              const Padding(

                padding: EdgeInsets.symmetric(horizontal: 20),

                child: Text(

                  "As a student, you get special discounts designed to make your daily transportation easier and more affordable.",

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 16,

                  ),

                ),

              ),


              // Continue the rest of your original content here

            ],

          ),

        ),

      ),

    );

  }

}