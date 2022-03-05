// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:paddy/allscreens.dart';
// import 'package:paddy/models/disease_model.dart';
//
// class ResultScreen extends StatefulWidget {
//   const ResultScreen({Key? key,  required this.disease, required this.image}) : super(key: key);
//
//   final DiseaseModel disease;
//   final File image;
//
//   @override
//   _ResultScreenState createState() => _ResultScreenState();
// }
//
// class _ResultScreenState extends State<ResultScreen> {
//
//   var appBar = AppBar(
//     backgroundColor: const Color(0xff0F00FF),
//     centerTitle: true,
//     title: const Text('PADDY', style: TextStyle(fontWeight: FontWeight.bold),),
//
//     actions: const [Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.0),
//       child: Icon(Icons.notifications_none_outlined),
//     )],
//   );
//
//   void popUp(){
//     showDialog(context: context, builder: (BuildContext context){
//       return ScreenUtilInit(
//         designSize: const Size(392.72727272727275,750.909090909091),
//         builder : ()=> Stack(
//           children :[ SingleChildScrollView(
//             child: Center(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
//                 width : MediaQuery.of(context).size.width*0.85,
//                 // height: MediaQuery.of(context).size.height*0.55,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.r)
//                 ),
//                 child: Material(
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(widget.diseaseName, style: TextStyle(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold
//                       ),),
//                       SizedBox(height: 10.h,),
//                       Container(
//                         color: Colors.white,
//                         // height: MediaQuery.of(context).size.height*0.50,
//                         child: SingleChildScrollView(
//                           child: Text(widget.diseaseDescription, style: TextStyle(
//                             fontSize: 17.sp
//                           ),),
//                         ),
//                       ),
//
//                       InkWell(
//                         onTap: (){
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                           color: Colors.white,
//                           padding: EdgeInsets.only(top: 20.h),
//                           child: Text('Close', style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.sp
//                           ),),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ]
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     var topPadding = MediaQuery.of(context).padding.top;
//     var bottomPadding = MediaQuery.of(context).padding.bottom;
//
//
//     print((width).toString());
//     print((height).toString());
//     print((height-topPadding).toString());
//
//     return ScreenUtilInit(
//       designSize: const Size(392.72727272727275,750.909090909091),
//       builder : ()=> SafeArea(
//         child: Scaffold(
//           appBar: appBar,
//           drawer: const SideBarMenu(),
//           body: Material(
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
//               // alignment: Alignment.center,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20.r),
//                       child: SizedBox(
//                         height: MediaQuery.of(context).size.height*0.25,
//                           width: MediaQuery.of(context).size.height*0.25,
//                           child: Image.file(widget.image,
//                           fit: BoxFit.cover,)),
//                     ),
//                   ),
//                   //disease name section
//                   SizedBox(height: 35.h,),
//                   Text('Disease name', style: TextStyle(
//                       fontSize: 20.sp, fontWeight: FontWeight.w600),),
//                   SizedBox(height: 5.h,),
//                   Text(widget.diseaseName, style: TextStyle(
//                       fontSize: 15.sp
//                   ),),
//
//                   // disease description section
//                   SizedBox(height: 30.h,),
//                   Text('Disease description', style: TextStyle(
//                       fontSize: 20.sp, fontWeight: FontWeight.w600),),
//                   SizedBox(height: 5.h,),
//                   Container(
//                     // height: MediaQuery.of(context).size.height*0.1,
//                     child: Text(widget.diseaseDescription.substring(0,
//                     widget.diseaseDescription.length>210? 210: widget.diseaseDescription.length),
//                           style: TextStyle(fontSize: 15.sp),),
//                   ),
//                   InkWell(
//                     onTap: (){
//                       popUp();
//                     },
//                       child: Container(
//                         alignment: Alignment.centerRight,
//                           child: const Text('See more', style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold
//                           ),))
//                   ),
//
//                   SizedBox(height: 30.h,),
//                   InkWell(
//                     onTap: (){},
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: const Color(0xff0F00FF),
//                         borderRadius: BorderRadius.circular(50.r)
//                       ),
//                       margin: EdgeInsets.symmetric(horizontal: 40.w),
//                       padding: EdgeInsets.symmetric( vertical: 15.h),
//                       child: Text('Find a remedy', style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.bold),),
//                     ),
//                   ),
//                   SizedBox(height: 8.h,),
//                   InkWell(
//                     onTap: (){
//                       Navigator.of(context).pop();
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xff0F00FF),
//                                 width: 2),
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(50.r),
//                       ),
//                       margin: EdgeInsets.symmetric(horizontal: 38.w),
//                       padding: EdgeInsets.symmetric( vertical: 13.h),
//                       child: Text('Retake a photo', style: TextStyle(
//                           color: const Color(0xff0F00FF),
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.bold),),
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 20.w),
//                     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(35.r),
//                         color: const Color(0xff0F00FF).withOpacity(0.12)
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.lightbulb_outline_rounded,
//                           color: const Color(0xff0F00FF).withOpacity(0.7), size: 20,),
//                         SizedBox(width: 10.w,),
//                         Text('''Quality of the photo will
// always affect the final result''',
//                           style: TextStyle(
//                               color: const Color(0xff0F00FF).withOpacity(0.7),
//                               fontSize: 15.sp
//                           ),textAlign: TextAlign.left,)
//                       ],),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
