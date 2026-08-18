import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/wallet.dart';
import 'package:rihla_4_0/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Set<int> visibleQR = {};
  bool isStudent = false;
  double twoHoursPrice = 200;
  double sevenDaysPrice = 2000;

  @override
  void initState() {
    super.initState();
    loadStudentStatus();
    loadUserId();
    loadTicketPrices();
  }

  Future<void> loadTicketPrices() async {
    final result = await ApiService.getTicketPrices();

    if (!mounted) return;

    if (result['success'] == true) {
      for (var ticket in result['data']) {
        if (ticket['ticket_name'] == '2-Hours Ticket') {
          twoHoursPrice = double.parse(ticket['price'].toString());
        }

        if (ticket['ticket_name'] == '7-Days Ticket') {
          sevenDaysPrice = double.parse(ticket['price'].toString());
        }
      }

      setState(() {});
    }
  }

  Future<void> loadStudentStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;

    setState(() {
      isStudent = prefs.getBool("is_student") ?? false;
    });
  }

  int? userId;
  List<dynamic> myTickets = [];

  Future<void> loadTickets() async {
    if (userId == null) return;
    final result = await ApiService.getMyTickets(userId!);
    if (!mounted) return;

    if (result['success'] == true) {
      setState(() {
        myTickets = result["data"];
      });
    }
  }

  Future<void> loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;

    setState(() {
      userId = prefs.getInt("user_id");
    });
    await loadTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                          loadTickets();
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
                // Card 1: 2-Hour standard ticket
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
                            Text(
                              "${isStudent ? twoHoursPrice / 2 : twoHoursPrice} SDG",
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
                            const Row(
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
                            const SizedBox(height: 16),
                            // Purchase button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => wallet(),
                                    ),
                                  );
                                },
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

                SizedBox(height: 20),

                // Card 2: 7-Day pass ticket
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
                              "7 DAYS PASS",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${isStudent ? sevenDaysPrice / 2 : sevenDaysPrice} SDG",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4B5320),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              "Unlimited rides on all 3 metro lines for 7-DAYS after activation.",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const Spacer(),
                            const Row(
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
                            const SizedBox(height: 16),
                            // Purchase button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => wallet(),
                                    ),
                                  );
                                },
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

                SizedBox(height: 25),
              ] else ...[
                if (myTickets.isEmpty)
                  // Empty state: nothing purchased yet
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Icon(
                          Icons.confirmation_num_outlined,
                          size: 60,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "No active tickets",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Buy a ticket to see it here",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                else
                  // One card per active ticket, most recent first (already sorted by the backend)
                  Column(
                    children: myTickets.map((ticket) {
                      final int ticketId = ticket['id'];
                      final bool isQRVisible = visibleQR.contains(ticketId);
                      final DateTime expiresAt = DateTime.parse(
                        ticket['expires_at'],
                      );

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                          height: isQRVisible ? 470 : 250,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Color(0xFF355C8A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
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
                                        ticket['ticket_name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 330),
                                        curve: Curves.easeInOut,
                                        height: isQRVisible ? 180 : 0,
                                        child: Center(
                                          child: AnimatedSwitcher(
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            child: isQRVisible
                                                ? Icon(
                                                    Icons.qr_code_2_sharp,
                                                    size: 170,
                                                    key: ValueKey(true),
                                                    opticalSize: 170,
                                                    color: Colors.white,
                                                  )
                                                : SizedBox(
                                                    key: ValueKey(false),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 70),
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
                                                "${expiresAt.day}/${expiresAt.month}/${expiresAt.year}  ${TimeOfDay.fromDateTime(expiresAt).format(context)}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isQRVisible) {
                                                  visibleQR.remove(ticketId);
                                                } else {
                                                  visibleQR.add(ticketId);
                                                }
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                isQRVisible
                                                    ? "Hide QR"
                                                    : "View QR",
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
                      );
                    }).toList(),
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
