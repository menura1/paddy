import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          drawer: SideBarMenu(),
          appBar: AppBar(
            backgroundColor: const Color(0xff0F00FF),
            centerTitle: true,
            title: const Text('PADDY', style: TextStyle(fontWeight: FontWeight.bold),),

            actions: const [Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(Icons.notifications_none_outlined),
            )],
          ),
          body: SingleChildScrollView(
            child: Material(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                  const Text('Select category', style: TextStyle(
                      color: Color(0xff0F00FF), fontSize:25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25,),
                  InkWell(
                    onTap: (){},
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
                    onTap: (){},
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
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color(0xff0F00FF).withOpacity(0.12)
                    ),
                    child: Container(
                      width: 250,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
