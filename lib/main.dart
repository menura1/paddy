import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:paddy/services/disease_data.dart';
import 'package:paddy/services/image_pick_service.dart';
import 'package:provider/provider.dart';
import 'all_screens.dart';

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
    return ChangeNotifierProvider(
      create: (context) => ImagePick(),
      builder: (BuildContext context, child) {
        return HomeScreen();
      },
    );
  }
}
