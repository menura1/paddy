import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';
import 'package:paddy/models/result_model.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key, required this.resultModel}) : super(key: key);

  ResultModel resultModel;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(360, 640),
        builder: () => Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 250.h,
                        width: 360.w,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30.r),
                                bottomLeft: Radius.circular(30.r)),
                            child: Image.file(
                            widget.resultModel.image,
                              fit: BoxFit.cover,
                            ))),
                    Positioned(
                      top: 0,
                        left: 0,
                        child: IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_rounded, color: Colors.white,),))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h,),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: widget.resultModel.confidence>70?Colors.green: widget.resultModel.confidence>50? Colors.orange: Colors.red,
                                    width: 1.5.w)
                            ),
                            child: Text('${widget.resultModel.confidence}%',textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Text('Confidence', style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                          ),)
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Text(widget.resultModel.diseaseModel.name, style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap:(){},
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 155.w,
                              decoration: BoxDecoration(
                                color: Color(0xff3F66F2),
                                borderRadius: BorderRadius.circular(5.r)
                              ),
                              child: Text("Details", style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp
                              ), textAlign: TextAlign.center,),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 155.w,
                              decoration: BoxDecoration(
                                color: Color(0xffD6D6D6),
                                borderRadius: BorderRadius.circular(5.r)
                              ),
                              child: Text("Treatments", style: TextStyle(
                                color: Color(0xff686868),
                                fontSize: 14.sp
                              ), textAlign: TextAlign.center,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h,),
                      Text('Disease details', style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 5.h,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        padding: EdgeInsets.all(15),
                        child: Text(widget.resultModel.diseaseModel.description,
                        style: TextStyle(
                          fontSize: 14.sp
                        ),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
