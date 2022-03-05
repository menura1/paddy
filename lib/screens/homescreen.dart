import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paddy/screens/results_screen.dart';

import 'package:paddy/services/ml_service.dart';

import '../disease_data.dart';
import '../models/result_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Predictions pred = Predictions();

  @override
  void initState() {
    pred.loadModel();
  }

  String? diseaseName = 'Powdery Mildew';

  String? diseaseDescription =
      'Powdery mildew leaves a telltale white dusty coating'
      ' on leaves, stems and flowers. Caused by a fungus, it affects a number of plants,'
      ' including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses.Powdery mildew leaves a telltale white dusty coating'
      ' on leaves, stems and flowers. Caused by a fungus, it affects a number of plants,'
      ' including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses.Powdery mildew leaves a telltale white dusty coating'
      ' on leaves, stems and flowers. Caused by a fungus, it affects a number of plants,'
      ' including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses.Powdery mildew leaves a telltale white dusty coating'
      ' on leaves, stems and flowers. Caused by a fungus, it affects a number of plants,'
      ' including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses ';

  void pickImg() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Select an option',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  getImage(ImageSource.camera);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text('Capture a photo from camera'),
              ),
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

  Future getImage(ImageSource imgSource) async {
    final img = await ImagePicker().pickImage(source: imgSource);
    Navigator.of(context).pop();
    if (img != null) {
      final image = File(img.path);
      var result = await pred.runModel(image);
      Fluttertoast.showToast(
          msg: result.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      if(result!=null){
        if(result.isNotEmpty){
          String label = result[0]['label'];
          print("Disease - $label");
          double confidence = double.parse(result[0]['confidence'].toStringAsFixed(2))*100;
          print("Confidence - $confidence %");
          int index = DiseaseData.diseases[result[0]['index']].index;

          ResultModel resultModel = ResultModel(diseaseModel: DiseaseData.diseases[index], image: image, confidence: confidence);

          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ResultScreen(resultModel: resultModel,)));
        }
        else{
          print('Couldn\'t predict, please try again!');
        }

      }
      
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ResultScreen(
      //               image: image,
      //               diseaseName: diseaseName!,
      //               diseaseDescription: diseaseDescription!,
      //             )));
    }
  }

  var appBar = AppBar(
    backgroundColor: const Color(0xff0F00FF),
    centerTitle: true,
    title: const Text(
      'PADDY',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Icon(Icons.notifications_none_outlined),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: () => SafeArea(
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
            body: Center(child: buildHomeBody()),
            // body: SingleChildScrollView(
            //   child: Material(
            //     color: Colors.white,
            //     child: Container(
            //       height: MediaQuery.of(context).size.height-
            //               MediaQuery.of(context).padding.top-
            //               MediaQuery.of(context).padding.bottom-
            //               appBar.preferredSize.height,
            //       child: Column(
            //         children: [
            //           SizedBox(height: 25.h,),
            //           Text('Select category', style: TextStyle(
            //               color: const Color(0xff0F00FF), fontSize:25.sp, fontWeight: FontWeight.bold)),
            //           SizedBox(height: 25.h,),
            //           InkWell(
            //             onTap: () {
            //               pickImg();
            //             },
            //             child: Container(
            //               margin: EdgeInsets.symmetric(horizontal: 20.w),
            //               decoration: BoxDecoration(
            //                   color: const Color(0xff2EB086).withOpacity(0.8),
            //                   borderRadius: BorderRadius.circular(15.r)
            //             ),
            //               height: 200.h,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text('Leaf', style: TextStyle(
            //                       color: Colors.white, fontSize: 35.sp),),
            //                   Icon(Icons.spa_rounded, color: Colors.white,size: 35.sp,)
            //                 ],
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 25.h,),
            //           InkWell(
            //             onTap: (){
            //               pickImg();
            //             },
            //             child: Container(
            //               margin: EdgeInsets.symmetric(horizontal: 20.w),
            //               decoration: BoxDecoration(
            //                   color: const Color(0xffFFAB76).withOpacity(0.8),
            //                   borderRadius: BorderRadius.circular(15.r)
            //               ),
            //               height: 200.h,
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text('Fruit', style: TextStyle(
            //                       color: Colors.white, fontSize: 35.sp),),
            //                   Icon(Icons.park, color: Colors.white,size: 35.sp,)
            //                 ],
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 45.h,),
            //           Container(
            //             margin: EdgeInsets.symmetric(horizontal: 30.w),
            //             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(35.r),
            //               color: const Color(0xff0F00FF).withOpacity(0.12)
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //               Icon(Icons.info_outline,
            //                 color: const Color(0xff0F00FF).withOpacity(0.7), size: 18.sp,),
            //               const SizedBox(width: 5,),
            //               Text('Please select the correct category',
            //                 style: TextStyle(
            //                 color: const Color(0xff0F00FF).withOpacity(0.7),
            //                   fontSize: 15.sp
            //               ),)
            //             ],),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  Widget buildHomeBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 65),
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
                        fontSize: 24,
                        color: Color(0xff0F00FF)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Identify leaf diseases within seconds!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(height: 100, child: Image.asset('images/plant.png')),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Easily choose a photo from the gallery or capture a photo from the device camera.',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: (){
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
          height: 5,
        ),
        Container(
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
                Icons.lightbulb,
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
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
