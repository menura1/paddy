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

  void pickImg(){

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Select an option', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              const SizedBox(height: 10,),
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
    final image = await ImagePicker().pickImage(source: imgSource);
  }

  var appBar = AppBar(
    backgroundColor: const Color(0xff0F00FF),
    centerTitle: true,
    title: const Text('PADDY', style: TextStyle(fontWeight: FontWeight.bold),),

    actions: const [Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Icon(Icons.notifications_none_outlined),
    )],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    const SizedBox(height: 25,),
                    const Text('Select category', style: TextStyle(
                        color: Color(0xff0F00FF), fontSize:25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25,),
                    InkWell(
                      onTap: () {
                        pickImg();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xff2EB086).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15)
                      ),
                        height: MediaQuery.of(context).size.height*0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Leaf', style: TextStyle(
                                color: Colors.white, fontSize: 35),),
                            Icon(Icons.spa_rounded, color: Colors.white,size: 35,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    InkWell(
                      onTap: (){
                        pickImg();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFAB76).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: MediaQuery.of(context).size.height*0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Fruit', style: TextStyle(
                                color: Colors.white, fontSize: 35),),
                            Icon(Icons.park, color: Colors.white,size: 35,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 45,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color(0xff0F00FF).withOpacity(0.12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.info_outline,
                          color: const Color(0xff0F00FF).withOpacity(0.7), size: 18,),
                        const SizedBox(width: 5,),
                        Text('Please select the correct category',
                          style: TextStyle(
                          color: const Color(0xff0F00FF).withOpacity(0.7),
                            fontSize: 15
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
    );
  }
}
