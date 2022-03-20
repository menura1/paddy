import 'dart:io';
import 'package:paddy/models/disease_model.dart';

class ResultModel{
  //holds the relevant disease instance
  DiseaseModel diseaseModel;
  //image file selected by the user
  File imagePreview;
  //confidence of the prediction made by the model
  double confidence;

  //constructor
  ResultModel({required this.diseaseModel, required this.imagePreview, required this.confidence});
}