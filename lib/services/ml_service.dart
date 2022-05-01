import 'dart:io';
import 'package:tflite/tflite.dart';

class MLService{

  //loading the trained tflite model and labels file
  loadModel() async {
    await Tflite.loadModel(
      labels: 'assets/labels.txt', model: "assets/model.tflite");
  }

  //running the model on the current image file
  Future<List?> runModel(File file) async{

    var startTime = DateTime.now().millisecondsSinceEpoch;
    var runResult = await Tflite.runModelOnImage(
        path: file.path,
      numResults: 1,
      imageMean: 255,
      imageStd: 255,
      threshold: 0.5
    );
    var endTime = DateTime.now().millisecondsSinceEpoch;
    print('Predicted in ${startTime-endTime} milliseconds');

    print(runResult.toString());

    //returning the predictions of the model as a list
    return runResult;
  }

}