import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                           Navigator.of(context).pop();
                         },
                         child: const Icon(Icons.arrow_back_rounded),
                 ),
                ),
                   const Text(
                   'Contact Us',
                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                   const SizedBox(
                     height: 5,
                   ),

                   Image.asset('images/contact.png',width: 300,height: 300,),
                   const SizedBox(height: 13,),
                   const Card(
                       child:ListTile(
                       tileColor: Colors.white24,
                       leading: Icon(Icons.email, size: 28,color: Colors.deepPurple,),
                       title: Text('paddy123@gmail.com', style: TextStyle(fontSize: 20, color: Colors.black),),
                  )),
                   SizedBox(height: 4,),
                   const Card(
                       child: ListTile(
                       tileColor: Colors.white24,
                       leading: Icon(Icons.phone, size: 28,color: Colors.deepPurple,),
                       title: Text('0776677656', style: TextStyle(fontSize: 20, color: Colors.black),),
                  )),
                   SizedBox(height: 4,),
                   const Card(
                       child: ListTile(
                       tileColor: Colors.white24,
                       leading: Icon(Icons.facebook, size: 28,color: Colors.deepPurple,),
                       title: Text('PaddyApp', style: TextStyle(fontSize: 20, color: Colors.black),),
                )),

              ],
         ),
        ),
        ),
     ),
     );


  }
}
