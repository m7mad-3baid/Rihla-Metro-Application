import 'package:flutter/material.dart';

// Wallet screen displaying balance, payment methods, and recent activity
class wallet extends StatelessWidget {
  const wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button and title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back navigation button
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded, size: 35),
                    ),
                  ),
                  // Screen title
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Text(
                      "My Wallet",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Wallet card showing balance and add money button
              Container(
                width: 350,
                height: 260,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Color(0xff4B0082),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Decorative wallet icon in background
                    Positioned(
                      right: -25,
                      bottom: -25,
                      child: Icon(
                        Icons.account_balance_wallet_rounded,
                        size: 160,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Wallet name and icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rihla Wallet",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.white,
                              size: 35,
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // Wallet balance display
                        Row(
                          children: [
                            // Balance amount
                            Text(
                              "125",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Currency label
                            Text(
                              "SDG",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        // Pushes button to bottom of card
                        const Spacer(),

                        // Add money button
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 150,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Color(0xff4B0082),
                                  size: 22,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Add Money",
                                  style: TextStyle(
                                    color: Color(0xff4B0082),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Payment Methods section title
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    "Payment Methods",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Saved payment method card: Bankak ending in 4532
              Container(
                height: 120,
                width: 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Bank logo
                    Image.asset("assets/imgs/bankaklogo.png", scale: 8),
                    const SizedBox(width: 15),
                    // Payment details
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Masked account number with last four digits
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Account Number ending in : ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 47, 65, 74),
                                  ),
                                ),
                                // Last four digits
                                Text(
                                  "4532",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Expiry date and change link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Expires 09/23",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 47, 65, 74),
                                ),
                              ),
                              // Change payment method link
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 100,
                                  top: 30,
                                ),
                                child: Text(
                                  "Change",
                                  style: TextStyle(color: Color(0xff1A318F)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Recent Activity section title
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Recent activity transaction card: 2-Hours ticket purchase
              Container(
                width: 375,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Ticket icon
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 194, 180, 219),
                      ),
                      child: Icon(
                        Icons.confirmation_number_outlined,
                        color: Color(0xff4B0082),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Ticket information
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ticket name
                        Text("2-Hours ticket"),
                        // Transaction date and time
                        Text(
                          "Oct 22, 06:45 PM",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    // Pushes amount details to the right
                    Spacer(),
                    // Transaction amount and payment method
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Amount spent
                          Text(
                            "-200",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Payment method label
                          Text(
                            "Online",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                width: 375,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Ticket icon
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 109, 225, 113),
                      ),
                      child: Icon(
                        Icons.wallet,
                        color: Color.fromARGB(255, 9, 100, 17),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Ticket information
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ticket name
                        Text("Wallet Top-Up"),
                        // Transaction date and time
                        Text(
                          "Oct 20, 06:55 PM",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    // Pushes amount details to the right
                    Spacer(),
                    // Transaction amount and payment method
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Amount spent
                          Text(
                            "+5000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Payment method label
                          Text(
                            "Via Bankak *4532",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
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
