import 'package:flutter/material.dart';

import '../services/theme_controller.dart';
import '../services/theme_service.dart';



class Preferences extends StatelessWidget {


  const Preferences({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Preferences"),
      ),



      body: ValueListenableBuilder<bool>(

        valueListenable: themeNotifier,


        builder: (context, isDark, child) {


          return ListView(

            padding: const EdgeInsets.all(20),


            children: [


              const Text(
                "Appearance",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),



              const SizedBox(height: 10),



              SwitchListTile(

                title: const Text(
                  "Dark Mode",
                ),


                value: isDark,


                onChanged: (value) async {


                  // Change app theme instantly
                  themeNotifier.value = value;


                  // Save preference
                  await ThemeService.saveTheme(value);


                },


              ),



            ],

          );


        },

      ),

    );

  }

}