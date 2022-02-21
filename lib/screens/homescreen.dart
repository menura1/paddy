import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? diseaseName = 'Powdery Mildew';

  String? diseaseDescription = 'Powdery mildew leaves a telltale white dusty coating'
      ' on leaves, stems and flowers. Caused by a fungus, it affects a number of plants,'
      ' including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses.Powdery mildew leaves a telltale white dusty coating'
      ' on leaves, stems and flowers. Caused by a fungus, it affects a number of plants,'
      ' including lilacs, apples, grapes, cucumbers, peas, phlox, daisies and roses.'
  ;

  void pickImg(){

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Select an option', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp
              ),),
              SizedBox(height: 10.h,),
              ListTile(
                onTap: (){
                  getImage(ImageSource.camera);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text('Capture a photo from camera'),
              ),
              ListTile(
                onTap: (){
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

  Future getImage(ImageSource imgSource) async{
    final img = await ImagePicker().pickImage(source: imgSource);
    if (img != null){
      final image = File(img.path);
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ResultScreen(image: image, diseaseName: diseaseName!,
                                            diseaseDescription: diseaseDescription!,)));
    }
  }

  var appBar = AppBar(
    backgroundColor: const Color(0xff0F00FF),
    centerTitle: true,
    title: const Text('PADDY', style: TextStyle(fontWeight: FontWeight.bold),),

    actions: const [Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Icon(Icons.notifications_none_outlined),
    )],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393,851),
      builder : ()=> SafeArea(
        child: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            drawer: const SideBarMenu(),
            appBar: appBar,
            body: SingleChildScrollView(
              child: Material(
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height-
                          MediaQuery.of(context).padding.top-
                          MediaQuery.of(context).padding.bottom-
                          appBar.preferredSize.height,
                  child: Column(
                    children: [
                      SizedBox(height: 25.h,),
                      Text('Select category', style: TextStyle(
                          color: const Color(0xff0F00FF), fontSize:25.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: () {
                          pickImg();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: const Color(0xff2EB086).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15.r)
                        ),
                          height: 200.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Leaf', style: TextStyle(
                                  color: Colors.white, fontSize: 35.sp),),
                              Icon(Icons.spa_rounded, color: Colors.white,size: 35.sp,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          pickImg();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFAB76).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15.r)
                          ),
                          height: 200.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Fruit', style: TextStyle(
                                  color: Colors.white, fontSize: 35.sp),),
                              Icon(Icons.park, color: Colors.white,size: 35.sp,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 45.h,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                          color: const Color(0xff0F00FF).withOpacity(0.12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(Icons.info_outline,
                            color: const Color(0xff0F00FF).withOpacity(0.7), size: 18.sp,),
                          const SizedBox(width: 5,),
                          Text('Please select the correct category',
                            style: TextStyle(
                            color: const Color(0xff0F00FF).withOpacity(0.7),
                              fontSize: 15.sp
                          ),)
                        ],),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
