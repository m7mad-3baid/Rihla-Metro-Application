import 'package:flutter/material.dart';

import 'package:rihla_4_0/screens/MainScreen.dart';
import 'package:rihla_4_0/services/theme_service.dart';
import 'package:rihla_4_0/services/theme_controller.dart';
import 'package:rihla_4_0/themes/app_theme.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  bool isDark = await ThemeService.getTheme();


  themeNotifier.value = isDark;


  runApp(
    const Rihla(),
  );

}



class Rihla extends StatelessWidget {

  const Rihla({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return ValueListenableBuilder<bool>(

      valueListenable: themeNotifier,


      builder: (context, isDark, child) {


        return MaterialApp(

          debugShowCheckedModeBanner: false,


          theme: AppTheme.lightTheme,

darkTheme: AppTheme.darkTheme,


          themeMode:
              isDark
              ?
              ThemeMode.dark
              :
              ThemeMode.light,


          home: MainScreen(),

        );


      },

    );


  }

}