import 'dart:io';

import 'package:paddy/disease_data.dart';
import 'package:paddy/models/result_model.dart';
import 'package:tflite/tflite.dart';

class Predictions{

  loadModel() async {
    var result = await Tflite.loadModel(
      labels: 'assets/labels.txt',
        model: "assets/model.tflite");
  }

  Future<List?> runModel(File file) async{
    var runResult = await Tflite.runModelOnImage(
        path: file.path,
      numResults: 1,
      imageMean: 255,
      imageStd: 255,
      threshold: 0.5
    );
    print(runResult.toString());


    return runResult;
  }

}