
import 'package:paddy/models/disease_treatment_model.dart';

class DiseaseModel{
  String name;
  String description;
  int index;
  List<DiseaseTreatment> treatments;

  DiseaseModel({
    required this.treatments, required this.name, required this.description, required this.index});
}