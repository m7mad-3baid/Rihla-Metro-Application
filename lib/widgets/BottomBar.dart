import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTapp;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTapp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: const BorderSide(color: Color(0xFFE2E2E2), width: 0.5),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(110, 32, 5, 5),
            spreadRadius: 1,
            offset: Offset(0, 5),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                onTapp(0);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 0
                        ? Icons.house_rounded
                        : Icons.house_outlined,
                    size: selectedIndex == 0 ? 30 : 25,
                    color: selectedIndex == 0 ? Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 0
                          ? Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                onTapp(1);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 1 ? Icons.map : Icons.map_outlined,
                    size: selectedIndex == 1 ? 30 : 25,
                    color: selectedIndex == 1 ? Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Routes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 1
                          ? Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                onTapp(2);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 2
                        ? Icons.confirmation_num
                        : Icons.confirmation_num_outlined,
                    size: selectedIndex == 2 ? 30 : 25,
                    color: selectedIndex == 2 ? Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 2
                          ? Color(0xFF00515A)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                onTapp(3);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 3 ? Icons.person : Icons.person_outline,
                    size: selectedIndex == 3 ? 30 : 25,
                    color: selectedIndex == 3 ? Color(0xFF00515A) : Colors.grey,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 3
                          ? Color(0xFF00515A)
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
