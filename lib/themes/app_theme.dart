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



    colorScheme: const ColorScheme.dark(


      primary:
          Color(0xFFF1E2AC),


      secondary:
          Color(0xFFBF001C),


    ),


  );


}