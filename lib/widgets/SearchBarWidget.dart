
// to import it else where : import 'package:rihla_4_0/widgets/SearchBarWidget.dart';



import 'package:flutter/material.dart';


class Searchbarwidget extends StatelessWidget {
  const Searchbarwidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 395,
      decoration: BoxDecoration(
        boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 15,
      offset: Offset(0, 4),
    ),
  ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 10, top: 3),
          labelText: "Search for a route or a station",
          labelStyle: const TextStyle(),
        ),
      ),
    );
  }
}

