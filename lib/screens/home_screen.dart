import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:paddy/components/image_tips.dart';
import 'package:paddy/components/weather_popup.dart';
import 'package:paddy/screens/results_screen.dart';
import 'package:paddy/services/ml_service.dart';
import '../components/side_bar_menu.dart';
import '../services/disease_data.dart';
import '../models/result_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //creating an instance of the ML Service class
  MLService mlService = MLService();

  @override
  void initState() {
    super.initState();
    //loading the tflite model on the initState
    mlService.loadModel();
    getWeather();
  }

  //this function let the user to select or take an image
  void pickImg() {
    //showing the bottom sheet
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Select an option',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              //Camera option
              ListTile(
                onTap: () {
                  getImage(ImageSource.camera);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text('Capture a photo from camera'),
              ),
              //Gallery option
              ListTile(
                onTap: () {
                  getImage(ImageSource.gallery);
                },
                leading: const Icon(Icons.collections),
                title: const Text('Choose a photo from gallery'),
              )
            ],
          ),
        );
      },
    );
  }

  //Capturing an image or selecting an image from storage
  Future getImage(ImageSource imgSource) async {
    //getting the user selected image
    final img = await ImagePicker().pickImage(source: imgSource);
    //dismissing the bottom sheet
    Navigator.of(context).pop();
    if (img != null) {
      //creating image file
      final image = File(img.path);
      //running the tflite model on the image
      var result = await mlService.runModel(image);

      if (result != null) {
        if (result.isNotEmpty) {
          //this list contains the indexes of the healthy classes that need to be ignored
          List<int> healthyIndexes = [3, 4, 6, 10, 14, 17, 19, 23, 24, 27, 37];

          //checking if the ignoring list contains the index of the result
          if (!healthyIndexes.contains(result[0]['index'])) {
            //extracting the confidence of the prediction and formatting it
            double confidence =
                double.parse(result[0]['confidence'].toStringAsFixed(2)) * 100;

            //extracting the disease index (index of the disease given in labels.txt file)
            int index = result[0]['index'];

            //creating a instance of ResultModel with the extracted info from the model prediction
            ResultModel resultModel = ResultModel(
                //relevant instance of the disease
                diseaseModel: DiseaseData.diseases[index],
                //preview image
                imagePreview: image,
                //confidence of the prediction
                confidence: confidence);

            //navigating to the results screen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          resultModel: resultModel,
                        )));
          }

          //if the leaf is healthy then showing a toast
          else {
            Fluttertoast.showToast(
                msg: 'It looks like the leaf is healthy!',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
        //if the model fails to predict then showing a toast
        else {
          Fluttertoast.showToast(
              msg: 'Couldn\'t predict, please try again!',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }
  }

  // customizing the app bar
  var appBar = AppBar(
    backgroundColor: const Color(0xff0F00FF),
    centerTitle: true,
    title: const Text(
      'PADDY',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    // actions: const [
    //   Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 15),
    //     child: Icon(Icons.notifications_none_outlined),
    //   )
    // ],
  );

  String? temp;
  String? main;

  bool weatherLoading = false;

  //build method
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: () => SafeArea(
        //auto ignore the keyboard
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xffF7F7F7),
            drawer: const SideBarMenu(),
            appBar: appBar,
            body: Center(
                child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: weatherWidget(context)),
                buildHomeBody(),
              ],
            )),
          ),
        ),
      ),
    );
  }

  //Home page body UI
  Widget buildHomeBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 65),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'GET STARTED',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xff0F00FF)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  SizedBox(
                      height: 100,
                      child: Lottie.asset('images/plant-home.json')),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Identify leaf diseases & find remedies within seconds!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   'Easily choose a photo from the gallery or capture a photo from the device camera.',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(
                  //   height: 25,
                  // ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pickImg();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff0F00FF),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: const Text(
                        'START',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      content: const ImageTips());
                });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.r),
                color: const Color(0xff0F00FF).withOpacity(0.12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: const Color(0xff0F00FF).withOpacity(0.5),
                  size: 25,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '''Quality of the photo will\nalways affect the final result''',
                  style: TextStyle(
                      color: const Color(0xff0F00FF).withOpacity(0.7),
                      fontSize: 15.sp),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget weatherWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  content: const WeatherPopup());
            });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40, child: Image.asset('images/weather.png')),
              const SizedBox(
                width: 10,
              ),
              weatherLoading
                  ? const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator()),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          main ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        Text(
                          temp ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  void getWeather() async {
    setState(() {
      weatherLoading = true;
    });
    await WeatherService().getCurrentWeather().then((value) {
      setState(() {
        weatherLoading = false;
        temp = value['temp'].toString().substring(0, 5) + ' °C';
        main = value['main'];
      });
    });
  }
}
