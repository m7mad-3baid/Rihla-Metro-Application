import 'package:flutter/material.dart';

import 'routes_screen.dart';
import 'Tickets.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;


  final List<Widget> pages = [
    RoutesScreen(),
    Tickets(),
  ];


  // PUT THE BUILD METHOD HERE 👇

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomBar(
        selectedIndex: currentIndex,
        onTap: (index){

          setState(() {
            currentIndex = index;
          });

        },
      ),

    );

  }

}