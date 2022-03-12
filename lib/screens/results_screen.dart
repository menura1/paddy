import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';
import 'package:paddy/models/result_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key, required this.resultModel}) : super(key: key);

  ResultModel resultModel;
  bool detailsSelected= true;

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
            child: Material(
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
                              child: Text('${widget.resultModel.confidence.toString().length>3 ? widget.resultModel.confidence.toString().substring(0,4) : widget.resultModel.confidence
                              }%',textAlign: TextAlign.center,
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
                                color: Colors.blueAccent
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
                              onTap:(){
                                setState(() {
                                  widget.detailsSelected = true;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                width: 155.w,
                                decoration: BoxDecoration(
                                  color: widget.detailsSelected? Color(0xff3F66F2): Color(0xffD6D6D6),
                                  borderRadius: BorderRadius.circular(5.r)
                                ),
                                child: Text("Details", style: TextStyle(
                                  color: widget.detailsSelected? Colors.white: Color(0xff686868),
                                  fontSize: 14.sp
                                ), textAlign: TextAlign.center,),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                launch("https://www.google.com/search?q=${widget.resultModel.diseaseModel.name}+treatments");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                width: 155.w,
                                decoration: BoxDecoration(
                                  color: widget.detailsSelected? Color(0xffD6D6D6): Color(0xff3F66F2),
                                  borderRadius: BorderRadius.circular(5.r)
                                ),
                                child: Text("Treatments", style: TextStyle(
                                  color: widget.detailsSelected? Color(0xff686868): Colors.white,
                                  fontSize: 14.sp
                                ), textAlign: TextAlign.center,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h,),
                        widget.detailsSelected? detailsTab(): treatmentsTab(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailsTab(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Disease details', style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700
            ),),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(widget.resultModel.diseaseModel.source, style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff084594)
              ),),
            ),
          ],
        ),
        SizedBox(height: 15.h,),
        Text(widget.resultModel.diseaseModel.description,
          style: TextStyle(
              fontSize: 14.sp,
            color: Colors.black87
          ),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }

  Widget treatmentsTab(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

    );
  }

  Widget treatment(String name, String description){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 5.h,),
        Text(description,
          style: TextStyle(
              fontSize: 14.sp
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 25.h,)
      ],
    );
  }

}
