import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter = to allow only digits in the top-up field.
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rihla_4_0/services/api_services.dart';

// Wallet screen displaying balance, payment methods, and recent activity
class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  bool isStudent = false;
  double balance = 0;
  List<dynamic> transactions = [];
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadStudentStatus();
    loadBalance();
    loadTransactions();
  }

  Future<void> loadBalance() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("user_id");
    if (userId == null) return;

    final result = await ApiService.getBalance(userId);
    if (result['success'] == true) {
      setState(() {
        balance = double.parse(result['data']['balance'].toString());
      });
    }
  }

  Future<void> loadStudentStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isStudent = prefs.getBool("is_student") ?? false;
    });
  }

  Future<void> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("user_id");
    if (userId == null) return;

    final result = await ApiService.getTransactions(userId);
    if (result['success'] == true) {
      setState(() {
        transactions = result['data'];
      });
    }
  }

  void showTopUpDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Top Up Wallet"),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Enter The Amount",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF7C5700),
              ),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                String amount = amountController.text;
                if (amount.isEmpty) {
                  return;
                }
                final prefs = await SharedPreferences.getInstance();
                int? userId = prefs.getInt("user_id");
                if (userId == null) {
                  return;
                }
                final result = await ApiService.topUp(userId, amount);
                if (!mounted) return;
                if (result['success'] == true) {
                  setState(() {
                    loadTransactions();
                    balance = double.parse(
                      result['data']['balance'].toString(),
                    );
                  });
                  Navigator.pop(dialogContext);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Money added Successful!")),
                  );
                  amountController.clear();
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(result['message'])));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C5700),
                foregroundColor: Colors.white,
              ),
              child: Text("Top Up"),
            ),
          ],
        );
      },
    );
  }

  void showBuyTicketDialog() {
    String selectedTicket = "2-Hours Ticket";

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text("Buy a Ticket"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    activeColor: const Color(0xFF7C5700),
                    title: const Text("2-Hours Ticket"),
                    value: "2-Hours Ticket",
                    groupValue: selectedTicket,
                    onChanged: (value) {
                      setDialogState(() {
                        selectedTicket = value!;
                      });
                    },
                  ),

                  RadioListTile(
                    activeColor: const Color(0xFF7C5700),
                    title: const Text("7-Days Ticket"),
                    value: "7-Days Ticket",
                    groupValue: selectedTicket,
                    onChanged: (value) {
                      setDialogState(() {
                        selectedTicket = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    int? userId = prefs.getInt("user_id");
                    if (userId == null) {
                      return;
                    }

                    final result = await ApiService.purchaseTicket(
                      userId,
                      selectedTicket,
                    );
                    if (!mounted) return;

                    if (result['success'] == true) {
                      setState(() {
                        loadTransactions();
                        balance = double.parse(
                          result['data']['balance'].toString(),
                        );
                      });
                      Navigator.pop(dialogContext);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Ticket purchased: $selectedTicket"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result['message'])),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF7C5700),
                  ),
                  child: const Text("BUY"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9E6),
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

              // Wallet card showing balance and Top UP button
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
                            Row(
                              children: [
                                if (isStudent) ...[
                                  Icon(
                                    Icons.school_rounded,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                  const SizedBox(width: 10),
                                ],
                                Icon(
                                  Icons.account_balance_wallet_rounded,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // Wallet balance display
                        Row(
                          children: [
                            // Balance amount
                            Text(
                              balance.toStringAsFixed(0),
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

                        // Top UP button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: showBuyTicketDialog,
                              child: Container(
                                width: 135,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.confirmation_number_outlined,
                                      color: Color(0xff4B0082),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "BUY TICKET",
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
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: showTopUpDialog,
                              child: Container(
                                width: 135,
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
                                      "TOP UP",
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
                                child: Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0xff4B0082),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                        color: Color(0xff1A318F),
                                      ),
                                    ),
                                  ),
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

              Column(
                children: transactions.map((tx) {
                  final double amount = double.parse(tx['amount'].toString());
                  final bool isPositive = amount >= 0;
                  final DateTime createdAt = DateTime.parse(tx['created_at']);

                  final bool isTopUp = tx['type'] == 'top_up';

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
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
                          Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isTopUp
                                  ? const Color.fromARGB(255, 109, 225, 113)
                                  : const Color.fromARGB(255, 194, 180, 219),
                            ),
                            child: Icon(
                              isTopUp
                                  ? Icons.wallet
                                  : Icons.confirmation_number_outlined,
                              color: isTopUp
                                  ? const Color.fromARGB(255, 9, 100, 17)
                                  : const Color(0xff4B0082),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tx['description']),
                              Text(
                                "${createdAt.day}/${createdAt.month}/${createdAt.year}  ${TimeOfDay.fromDateTime(createdAt).format(context)}",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "${isPositive ? '+' : ''}${amount.toStringAsFixed(0)}",
                              style: TextStyle(
                                fontSize: 20,
                                color: isPositive
                                    ? Colors.green[900]
                                    : Colors.red[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
