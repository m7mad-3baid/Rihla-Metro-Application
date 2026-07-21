import 'package:flutter/material.dart';

class Studentinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: const Text(
                      "Student Offers",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 20),


              // Coming Soon Banner

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFFCEFB4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.access_time,
                      size: 22,
                    ),

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


              const SizedBox(height: 30),


              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "✨ Your Student Benefits",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 15),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "🚆 Discounted Train Tickets",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Enjoy reduced prices on train journeys by verifying your student status.",
                    ),


                    SizedBox(height: 15),


                    Text(
                      "💰 Save More on Every Trip",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Keep more money in your pocket while traveling between university, home, and other destinations.",
                    ),


                    SizedBox(height: 15),


                    Text(
                      "⚡ Quick Access",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Your student discount is automatically applied when purchasing eligible tickets.",
                    ),


                    SizedBox(height: 15),


                    Text(
                      "🎓 Exclusive Student Offers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Get access to special promotions and seasonal discounts available only for verified students.",
                    ),

                  ],
                ),
              ),


              const SizedBox(height: 30),


              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "How It Works",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 15),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "1. Verify Your Student Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Upload your student information and complete verification.",
                    ),


                    SizedBox(height: 15),


                    Text(
                      "2. Choose Your Trip",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Search routes and select your preferred train.",
                    ),


                    SizedBox(height: 15),


                    Text(
                      "3. Apply Your Discount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Your student discount will be calculated automatically before payment.",
                    ),

                  ],
                ),
              ),


              const SizedBox(height: 30),


              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Student Verification",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 15),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Required Information:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text("• Full Name"),
                    Text("• University Name"),
                    Text("• Student ID"),
                    Text("• University Email (if available)"),


                    SizedBox(height: 20),


                    Text(
                      "Verification Status:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    SizedBox(height: 10),

                    Text("✅ Verified Student"),
                    Text("⏳ Verification Pending"),
                    Text("❌ Verification Failed"),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}