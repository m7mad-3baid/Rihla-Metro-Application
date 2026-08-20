import 'package:flutter/material.dart';

import 'package:rihla_4_0/screens/splash.dart';

void main() {
  runApp(const Rihla());
}

class Rihla extends StatelessWidget {
  const Rihla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
