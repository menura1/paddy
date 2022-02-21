import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.image, required this.diseaseName,
                      required this.diseaseDescription}) : super(key: key);

  final image;
  final String diseaseName;
  final String diseaseDescription;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  var appBar = AppBar(
    backgroundColor: const Color(0xff0F00FF),
    centerTitle: true,
    title: const Text('PADDY', style: TextStyle(fontWeight: FontWeight.bold),),

    actions: const [Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Icon(Icons.notifications_none_outlined),
    )],
  );
  
  void popUp(){
    showDialog(context: context, builder: (BuildContext context){
      return Stack(
        children :[ Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            width : MediaQuery.of(context).size.width*0.85,
            // height: MediaQuery.of(context).size.height*0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Material(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.diseaseName, style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height*0.50,
                    child: SingleChildScrollView(
                      child: Text(widget.diseaseDescription, style: TextStyle(
                        fontSize: 17
                      ),),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Close', style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: const SideBarMenu(),
        body: Material(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            // alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                        width: MediaQuery.of(context).size.height*0.25,
                        child: Image.file(widget.image,
                        fit: BoxFit.cover,)),
                  ),
                ),
                //disease name section
                const SizedBox(height: 35,),
                const Text('Disease name', style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600),),
                const SizedBox(height: 5,),
                Text(widget.diseaseName, style: const TextStyle(
                    fontSize: 15
                ),),

                // disease description section
                const SizedBox(height: 30,),
                const Text('Disease description', style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600),),
                const SizedBox(height: 5,),
                Container(
                  // height: MediaQuery.of(context).size.height*0.1,
                  child: Text(widget.diseaseDescription.substring(0,
                  widget.diseaseDescription.length>210? 210: widget.diseaseDescription.length),
                        style: const TextStyle(fontSize: 15),),
                ),
                InkWell(
                  onTap: (){
                    popUp();
                  },
                    child: Container(
                      alignment: Alignment.centerRight,
                        child: Text('See more', style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),))
                ),

                const SizedBox(height: 30,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff0F00FF),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric( vertical: 15),
                    child: const Text('Find a remedy', style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff0F00FF),
                              width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 38),
                    padding: const EdgeInsets.symmetric( vertical: 13),
                    child: const Text('Retake a photo', style: TextStyle(
                        color: Color(0xff0F00FF),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),),
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color(0xff0F00FF).withOpacity(0.12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lightbulb_outline_rounded,
                        color: const Color(0xff0F00FF).withOpacity(0.7), size: 20,),
                      const SizedBox(width: 10,),
                      Text('''Quality of the photo will 
always affect the final result''',
                        style: TextStyle(
                            color: const Color(0xff0F00FF).withOpacity(0.7),
                            fontSize: 15
                        ),textAlign: TextAlign.left,)
                    ],),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
