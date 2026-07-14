import 'package:flutter/material.dart';

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
                    Icons.house_rounded,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
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
                    Icons.route_outlined,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Routes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
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
                    Icons.airplane_ticket_outlined,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
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
                    Icons.person,
                    size: 30,
                    color: Color.fromRGBO(191, 0, 28, 100),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(191, 0, 28, 100),
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
