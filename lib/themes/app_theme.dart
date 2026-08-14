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





  static ThemeData darkTheme = ThemeData(


    brightness: Brightness.dark,


    scaffoldBackgroundColor:
        const Color(0xFF121212),



    primaryColor:
        const Color(0xFFF1E2AC),



    appBarTheme: const AppBarTheme(

      backgroundColor:
          Color(0xFF121212),

      foregroundColor:
          Colors.white,

      elevation: 0,

    ),



    cardColor:
        const Color(0xFF1E1E1E),

    dividerColor: const Color(0xFF3A3A3A),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF252525),
    ),

    dialogTheme: const DialogThemeData(
      backgroundColor: Color(0xFF1E1E1E),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFF1E2AC),
      unselectedItemColor: Colors.grey,
    ),



    colorScheme: const ColorScheme.dark(


      primary:
          Color(0xFFF1E2AC),


      secondary:
          Color(0xFFBF001C),


    ),


  );


}
