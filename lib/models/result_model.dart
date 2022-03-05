import 'dart:io';
import 'package:paddy/models/disease_model.dart';

class ResultModel{
  DiseaseModel diseaseModel;
  File image;
  double confidence;

  ResultModel({required this.diseaseModel, required this.image, required this.confidence});
}