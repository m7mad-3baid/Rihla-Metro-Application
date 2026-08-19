import 'package:flutter/material.dart';

import 'package:rihla_4_0/screens/splash.dart';
import 'package:rihla_4_0/themes/app_theme.dart';

void main() {
  runApp(const Rihla());
}

class Rihla extends StatelessWidget {
  const Rihla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Splash(),
    );
  }
}
