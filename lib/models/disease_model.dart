
import 'package:paddy/models/disease_treatment_model.dart';

class DiseaseModel{
  String name;
  String description;
  int index;
  String source;

  DiseaseModel({
    required this.name,
    required this.description,
    required this.source,
    required this.index});
}