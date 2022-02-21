import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        // margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Colors.red,
        child: SizedBox(height: 781.0909090909091-MediaQuery.of(context).padding.top, width: 100,
        child: Container(
          color: Colors.green,
        ),),
      ),
    );
  }
}
