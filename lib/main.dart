import 'package:flutter/material.dart';
import 'package:paddy/screens/splash_screen.dart';
import 'package:paddy/services/disease_data.dart';
// import 'package:paddy/services/yt_api_service.dart';

Future<void> main() async {
  DiseaseData().init();
  // YtApiService().sendRequest("MKBHD");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
