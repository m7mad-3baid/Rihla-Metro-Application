import 'package:flutter/material.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

// Screen displaying ticket purchasing options and user's active tickets
class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  // Toggle state: true shows Buy Tickets, false shows My Tickets
  bool isBuySelected = true;
  // Toggles QR code visibility in the active trip card
  bool showQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Screen title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: const Text(
                      "Tickets",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Segmented toggle: Buy A Ticket | My Tickets
              Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFFE2E2E2),
                ),
                child: Row(
                  children: [
                    // Buy A Ticket segment
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBuySelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isBuySelected
                                ? const Color(0xFF00515A)
                                : const Color(0xFFE2E2E2),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Buy A Ticket",
                              style: TextStyle(
                                color: isBuySelected
                                    ? Colors.white
                                    : const Color(0xFF627595),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // My Tickets segment
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBuySelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isBuySelected
                                ? const Color(0xFFE2E2E2)
                                : Color(0xFF00515A),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "My Tickets",
                              style: TextStyle(
                                color: isBuySelected
                                    ? const Color(0xFF627595)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // Buy Tickets View
              if (isBuySelected) ...[
                // Card 1: 2-Hour standard ticket (Most Popular)
                Container(
                  height: 375,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFFDCEEFF),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Decorative watermark ticket icon
                      Positioned(
                        right: -25,
                        top: -20,
                        child: Opacity(
                          opacity: 0.08,
                          child: Icon(
                            Icons.confirmation_num_rounded,
                            size: 170,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Most Popular badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00515A).withOpacity(.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "MOST POPULAR",
                                style: TextStyle(
                                  color: Color(0xFF00515A),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              "2-HOUR TICKET",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "200 SDG",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00515A),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              "Unlimited rides on all 3 metro lines for 2 hours after activation.",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const Spacer(),
                            // View details link
                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 18,
                                    color: Color(0xFF00515A),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                      color: Color(0xFF00515A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Purchase button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00515A),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.shopping_cart_checkout,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Purchase Ticket",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                // Card 2: 3-Day pass ticket
                Container(
                  height: 375,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFFBFC988),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Decorative watermark ticket icon
                      Positioned(
                        right: -25,
                        top: -20,
                        child: Opacity(
                          opacity: 0.08,
                          child: Icon(
                            Icons.confirmation_num_rounded,
                            size: 170,
                            color: Color(0xFF4B5320),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 18),
                            const Text(
                              "3 DAYS PASS",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "700 SDG",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4B5320),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              "Unlimited rides on all 3 metro lines for 3-DAYS after activation.",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const Spacer(),
                            // View details link
                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 18,
                                    color: Color(0xFF4B5320),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                      color: Color(0xFF4B5320),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Purchase button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4B5320),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.shopping_cart_checkout,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Purchase Ticket",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                                SizedBox(height: 20,),


                // Card 3: Student discount 2-Hour ticket (50% off)
                Container(
                  height: 375,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2C7),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Decorative watermark ticket icon
                      Positioned(
                        right: -25,
                        top: -20,
                        child: Opacity(
                          opacity: 0.08,
                          child: Icon(
                            Icons.confirmation_num_rounded,
                            size: 170,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Student discount badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC48A00).withOpacity(.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "STUDENT DISCOUNT",
                                style: TextStyle(
                                  color: Color(0xFFC48A00),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              "2-HOUR TICKET",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "100 SDG",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC48A00),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              "Unlimited rides on all 3 metro lines for 2 hours after activation.",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const Spacer(),
                            // View details link
                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 18,
                                    color: Color(0xFFC48A00),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                      color: Color(0xFFC48A00),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Purchase button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFC48A00),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.shopping_cart_checkout,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Purchase Ticket",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                SizedBox(height: 25),
              ] else ...[
                // My Tickets View: Active trip card with animated QR code
                AnimatedContainer(
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  height: showQR ? 470 : 250,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFF355C8A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      // Decorative background ticket icon
                      Positioned(
                        right: -20,
                        top: -15,
                        child: Opacity(
                          opacity: 0.15,
                          child: Icon(
                            Icons.confirmation_num,
                            size: 120,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Active trip badge
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "ACTIVE TRIP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "2-HOURS-TICKET",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Animated QR code section
                              AnimatedContainer(
                                duration: Duration(milliseconds: 330),
                                curve: Curves.easeInOut,
                                height: showQR ? 180 : 0,
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 300),
                                    child: showQR
                                        ? Icon(
                                            Icons.qr_code_2_sharp,
                                            size: 170,
                                            key: ValueKey(true),
                                            opticalSize: 170,
                                            color: Colors.white,
                                          )
                                        : SizedBox(key: ValueKey(false)),
                                  ),
                                ),
                              ),
                              SizedBox(height: showQR ? 70 : 70),
                              // Expiry info and QR toggle
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Active Untill:",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "14:30 PM ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Today ",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            158, 255, 255, 255,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // QR toggle button
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showQR = !showQR;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        showQR ? "Hide QR" : "View QR",
                                        style: TextStyle(
                                          color: Color(0xFF355C8A),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
              ],
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomBar(selectedIndex: 2, onTap: (index) {},),
    );
  }
}