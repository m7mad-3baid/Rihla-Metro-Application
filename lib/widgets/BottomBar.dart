import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
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
            padding: EdgeInsetsGeometry.only(left: 35, top: 10),
            child: GestureDetector(
              onTap: () {
                onTap(0);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 0 ? Icons.house : Icons.house_outlined,
                    size: selectedIndex == 0 ? 35 : 30,
                    color: selectedIndex == 0 ? Color(0xFFBF001C) : Colors.grey,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 0
                          ? Color(0xFFBF001C)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                onTap(1);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 1 ? Icons.map : Icons.map_outlined,
                    size: selectedIndex == 1 ? 35 : 30,
                    color: selectedIndex == 1 ? Color(0xFFBF001C) : Colors.grey,
                  ),
                  Text(
                    "Routes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 1
                          ? Color(0xFFBF001C)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                onTap(2);
              },
              child: Column(
                children: [
                  Icon(
                    selectedIndex == 2
                        ? Icons.confirmation_num
                        : Icons.confirmation_num_outlined,
                    size: selectedIndex == 2 ? 35 : 30,
                    color: selectedIndex == 2 ? Color(0xFFBF001C) : Colors.grey,
                  ),
                  Text(
                    "Tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 2
                          ? Color(0xFFBF001C)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 50, top: 10),
            child: GestureDetector(
              onTap: () {
                onTap(3);
              },

              child: Column(
                children: [
                  Icon(
                    selectedIndex == 3 ? Icons.person : Icons.person_outline,
                    size: selectedIndex == 3 ? 35 : 30,
                    color: selectedIndex == 3 ? Color(0xFFBF001C) : Colors.grey,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 3
                          ? Color(0xFFBF001C)
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
