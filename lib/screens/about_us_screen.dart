import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'About us',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 150,
                    child: ClipOval(
                        child: LottieBuilder.asset("images/about_us.json"))),
                const SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Paddy is an app which is specially developed for farmers and gardeners to identify plant diseases. Our mission is to help farmers to make their work beneficial and get more profits to make their lives stable, also help gardeners to work efficiently. Our app can help you find plant diseases instantly and more accurately, and can give detailed information about treatments in seconds for your plants.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
