import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paddy/allscreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('PADDY', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50),),
            Lottie.asset("images/75789-pot-plant.json")
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>HomeScreen()));    });

  }
}
