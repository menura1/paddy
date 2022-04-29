import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paddy/models/result_model.dart';
import 'package:paddy/services/yt_api_service.dart';
import 'package:paddy/ui_components/yt_results.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.resultModel}) : super(key: key);

  final ResultModel resultModel;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool detailsSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      //image preview
                      SizedBox(
                          height: 250.h,
                          width: 360.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.r),
                                  bottomLeft: Radius.circular(30.r)),
                              child: Image.file(
                                widget.resultModel.imagePreview,
                                fit: BoxFit.cover,
                              ))),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            //showing the prediction confidence
                            Container(
                              alignment: Alignment.center,
                              height: 20.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      // changing the color dynamically according to the confidence
                                      color: widget.resultModel.confidence > 70
                                          ? Colors.green
                                          : widget.resultModel.confidence > 50
                                              ? Colors.orange
                                              : Colors.red,
                                      width: 1.5.w)),
                              child: Text(
                                '${widget.resultModel.confidence.toString().length > 3 ? widget.resultModel.confidence.toString().substring(0, 4) : widget.resultModel.confidence}%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Confidence',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff332FD0),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset('images/leaficon.png'))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //showing disease name
                        Text(
                          widget.resultModel.diseaseModel.name,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detailsSelected = true;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                width: 155.w,
                                decoration: BoxDecoration(
                                    color: detailsSelected
                                        ? const Color(0xff332FD0)
                                        : const Color(0xffD1D1D1)
                                            .withOpacity(0.45),
                                    borderRadius: BorderRadius.circular(12.r)),
                                //disease description
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                      color: detailsSelected
                                          ? Colors.white
                                          : const Color(0xff686868),
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  detailsSelected = false;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                width: 155.w,
                                decoration: BoxDecoration(
                                    color: detailsSelected
                                        ? const Color(0xffD1D1D1)
                                            .withOpacity(0.45)
                                        : const Color(0xff332FD0),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Text(
                                  "Remedies",
                                  style: TextStyle(
                                      color: detailsSelected
                                          ? const Color(0xff686868)
                                          : Colors.white,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        detailsSelected
                            ? detailsTab()
                            : remedyTab(widget.resultModel.diseaseModel.remedy),
                        SizedBox(
                          height: 20.h,
                        ),
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

  //building the details tab ui
  Widget detailsTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Disease details',
                style: TextStyle(
                    color: const Color(0xff332FD0),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Text(
                  widget.resultModel.diseaseModel.source,
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff084594)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            widget.resultModel.diseaseModel.description,
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

  //treatment tab
  Widget remedyTab(String remedy) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remedies',
                    style: TextStyle(
                        color: const Color(0xff332FD0),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      launch(
                          "https://www.google.com/search?q=${widget.resultModel.diseaseModel.name}+treatments");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Row(
                        children: [
                          Text(
                            "Find more remedies",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xff084594)),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Icon(
                            Icons.search,
                            color: Color(0xff084594),
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                remedy,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
        
        //yt results
        Container(
          height: 635,
          padding : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin : const EdgeInsets.symmetric( vertical: 20),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Results from YouTube',
                    style: TextStyle(
                        color: const Color(0xff332FD0),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      launch(
                          "https://www.youtube.com/search?q=${widget.resultModel.diseaseModel.name}+treatments");
                    },
                    child: const Icon(
                        Icons.ondemand_video_rounded,
                      color: Color(0xff332FD0),
                    )
                  ),
                ],
              ),
              Expanded(
                child: YtResults(results: YtApiService().sendRequest(
                    "${widget.resultModel.diseaseModel.name} treatments"),
                name: widget.resultModel.diseaseModel.name,
                ),
              ),
              const SizedBox(height: 10,)
            ],
          )
        ),
        
      ],
    );
  }
}
