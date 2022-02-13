import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('PADDY', style: TextStyle(
                          fontSize: 55.00, fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('images/leaficon.png',
                        fit: BoxFit.fill,
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                  const Text('Login', style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0F00FF),
                  ),),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      icon: Icon(Icons.person)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.go,
                    controller: password,
                    decoration: InputDecoration(
                      suffix: InkWell(
                          onTap: (){},
                          child:
                      const Text('Forgot?', style: TextStyle(color: Color(0xff0F00FF)),)),
                      hintText: 'Password',
                      icon: const Icon(Icons.lock)
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff0F00FF)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        child: const Text('Login', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Center(
                    child: Column(
                      children:  [
                        const Text('Or login with', style: TextStyle(fontSize: 15),),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: InkWell(
                              onTap: (){},
                                child: Image.asset('images/twitter.png'),),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset('images/google.png'),),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset('images/facebook.png'),),
                          )
                        ],
                      ),
                        const SizedBox(height: 25,),
                        RichText(text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(text: 'New user? ',
                                style: TextStyle(color: Colors.black, fontSize: 15)),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap= (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=> RegisterScreen()));
                              },
                                text: ' Register',
                                style: const TextStyle(color: Color(0xff0F00FF), fontSize:15))
                          ]
                        ),)

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
}
