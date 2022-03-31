import 'package:flutter/material.dart';
import 'package:paddy/screens/splash_screen.dart';
import 'package:paddy/services/disease_data.dart';

Future<void> main() async {
  DiseaseData().init();
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const Paddy(),
    ),
  );
}

class Paddy extends StatelessWidget {
  const Paddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();

  }
}
