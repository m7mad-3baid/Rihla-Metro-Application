import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/home.dart';
import 'package:rihla_4_0/screens/studentInfo.dart';

import 'routes_screen.dart';
import 'Tickets.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';
import 'Profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        onViewRoutesTap: () {
          setState(() {
            currentIndex = 1; // Routes tab
          });
        },
        onRoutesTap: () {
          setState(() {
            currentIndex = 1; // Routes tab
          });
        },
        onTicketsTap: () {
          setState(() {
            currentIndex = 2; // Tickets tab
          });
        },
      ),
      RoutesScreen(),
      Tickets(),
      Profile(),
      Studentinfo(),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFFCF9F8),
      body: pages[currentIndex],

      bottomNavigationBar: BottomBar(
        selectedIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
