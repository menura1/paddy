import 'package:paddy/models/disease_model.dart';

class DiseaseData{

  static late List<DiseaseModel> diseases = [] ;
  static const des = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  init(){
    for(int c = 0; c<38; c++){
      diseases.add(DiseaseModel(
          treatments: [],
          name: 'init',
          description: 'init',
          index: 0));
    }
    diseases[0] = DiseaseModel(
        treatments: [],
        name: 'Apple Scab',
        description: des,
        index: 0);

    diseases[1] = DiseaseModel(
        treatments: [],
        name: 'Apple Black rot',
        description: des,
        index: 1);

    diseases[2] = DiseaseModel(
        treatments: [],
        name: 'Apple Cedar Rust',
        description: des,
        index: 2);

    diseases[6] = DiseaseModel(
        treatments: [],
        name: 'Cherry Powdery mildew',
        description: des,
        index: 6);

    diseases[7] = DiseaseModel(
        treatments: [],
        name: 'Corn Grey leaf spot',
        description: des,
        index: 7);

    diseases[8] = DiseaseModel(
        treatments: [],
        name: 'Corn Common rust',
        description: des,
        index: 8);

    diseases[10] = DiseaseModel(
        treatments: [],
        name: 'Corn Northern Leaf Blight',
        description: des,
        index: 10);

    diseases[11] = DiseaseModel(
        treatments: [],
        name: 'Grape Black rot',
        description: des,
        index: 11);

    diseases[12] = DiseaseModel(
        treatments: [],
        name: 'Grape Esca (Black Measles)',
        description: des,
        index: 12);

    diseases[14] = DiseaseModel(
        treatments: [],
        name: 'Grape Leaf blight (Isariopsis Leaf Spot)',
        description: des,
        index: 14);

    diseases[15] = DiseaseModel(
        treatments: [],
        name: 'Orange Haunglongbing (Citrus greening)',
        description: des,
        index: 15);

    diseases[16] = DiseaseModel(
        treatments: [],
        name: 'Peach Bacterial spot',
        description: des,
        index: 16);

    diseases[18] = DiseaseModel(
        treatments: [],
        name: 'Bell pepper bacterial spot',
        description: des,
        index: 18);

    diseases[20] = DiseaseModel(
        treatments: [],
        name: 'Potato Early blight',
        description: des,
        index: 20);

    diseases[22] = DiseaseModel(
        treatments: [],
        name: 'Potato Late blight',
        description: des,
        index: 22);

    diseases[25] = DiseaseModel(
        treatments: [],
        name: 'Squash Powdery mildew',
        description: des,
        index: 25);

    diseases[27] = DiseaseModel(
        treatments: [],
        name: 'Strawberry Leaf scorch',
        description: des,
        index: 27);

    diseases[28] = DiseaseModel(
        treatments: [],
        name: 'Tomato Bacterial spot',
        description: des,
        index: 28);

    diseases[29] = DiseaseModel(
        treatments: [],
        name: 'Tomato Early blight',
        description: des,
        index: 29);

    diseases[31] = DiseaseModel(
        treatments: [],
        name: 'Tomato Late blight',
        description: des,
        index: 31);

    diseases[32] = DiseaseModel(
        treatments: [],
        name: 'Tomato Leaf Mold',
        description: des,
        index: 32);

    diseases[33] = DiseaseModel(
        treatments: [],
        name: 'Tomato Septoria leaf spot',
        description: des,
        index: 33);

    diseases[34] = DiseaseModel(
        treatments: [],
        name: 'Tomato Spider mites (Two-spotted spider mite)',
        description: des,
        index: 34);

    diseases[35] = DiseaseModel(
        treatments: [],
        name: 'Tomato Target Spot',
        description: des,
        index: 35);

    diseases[36] = DiseaseModel(
        treatments: [],
        name: 'Tomato Mosaic Virus',
        description: des,
        index: 36);

    diseases[37] = DiseaseModel(
        treatments: [],
        name: 'Tomato Yellow Leaf Curl Virus',
        description: des,
        index: 37);

    print(diseases.length);
    print(diseases[37].name);
  }


}