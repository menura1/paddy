
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paddy/disease_data.dart';
import 'package:paddy/screens/results_screen.dart';
import 'package:paddy/services/image_pick_service.dart';
import 'package:provider/provider.dart';
import 'allscreens.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  DiseaseData().init();
  runApp(
    MaterialApp(
       home: Paddy(),
    ),
  );
}
class Paddy extends StatelessWidget {
  const Paddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImagePick(),
      builder: (BuildContext context, child){
        return HomeScreen();
      },
    );
  }
}

