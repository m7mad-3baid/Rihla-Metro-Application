import 'package:flutter/material.dart';


class AppTheme {


  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,

    scaffoldBackgroundColor:
        const Color(0xFFFFF9E6),


    primaryColor:
        const Color(0xFF7C5700),


    appBarTheme: const AppBarTheme(

      backgroundColor:
          Color(0xFFFFF9E6),

      foregroundColor:
          Colors.black,

      elevation: 0,

    ),



    cardColor:
        Colors.white,

    dividerColor: const Color(0xFFE2E2E2),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
    ),

    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.white,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF00515A),
      unselectedItemColor: Colors.grey,
    ),



    colorScheme: const ColorScheme.light(

      primary:
          Color(0xFF7C5700),

      secondary:
          Color(0xFFBF001C),

    ),


  );





}
