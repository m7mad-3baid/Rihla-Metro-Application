import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Custom bottom navigation bar widget
class BottomBar extends StatelessWidget {
  // Currently selected tab index
  final int selectedIndex;
  // Callback function when a tab is tapped
  final Function(int) onTap;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        // Top border line
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        // Rounded top corners
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        // Shadow effect for elevation
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(110, 32, 5, 5),
            spreadRadius: 1,
            offset: Offset(0, 5),
            blurRadius: 20.0,
          ),
        ],
      ),
      // Navigation items row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Home tab
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                // Notify parent of tab selection
                onTap(0);
              },
              child: Column(
                children: [
                  // Filled icon when selected, outlined when not
                  Icon(
                    selectedIndex == 0 ? Icons.house_rounded : Icons.house_outlined,
                    size: selectedIndex == 0 ? 30 : 25,
                    color: selectedIndex == 0 ?  Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 0
                          ?  Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Routes tab
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                // Notify parent of tab selection
                onTap(1);
              },
              child: Column(
                children: [
                  // Filled icon when selected, outlined when not
                  Icon(
                    selectedIndex == 1 ? Icons.map : Icons.map_outlined,
                    size: selectedIndex == 1 ? 30 : 25,
                    color: selectedIndex == 1 ?  Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Routes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 1
                          ?  Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tickets tab
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                // Notify parent of tab selection
                onTap(2);
              },
              child: Column(
                children: [
                  // Filled icon when selected, outlined when not
                  Icon(
                    selectedIndex == 2
                        ? Icons.confirmation_num
                        : Icons.confirmation_num_outlined,
                    size: selectedIndex == 2 ? 30 : 25,
                    color: selectedIndex == 2 ?  Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 2
                          ?  Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Profile tab
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                // Notify parent of tab selection
                onTap(3);
              },
              child: Column(
                children: [
                  // Filled icon when selected, outlined when not
                  Icon(
                    selectedIndex == 3 ? Icons.person : Icons.person_outline,
                    size: selectedIndex == 3 ? 30 : 25,
                    color: selectedIndex == 3 ?  Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 3
                          ?  Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}