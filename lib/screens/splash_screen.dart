import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paddy/screens/onboarding_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'PADDY',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Lottie.asset("images/75789-pot-plant.json", repeat: false)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkFirstOpen();
  }

  checkFirstOpen() async {
    // Read value
    var value = await storage.read(key: "firstOpen");
    bool firstOpen = (value != "false") ? true : false;

    if (firstOpen) {
      await storage.write(key: "firstOpen", value: "false");
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      });
    }
  }
}
