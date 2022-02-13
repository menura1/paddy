import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool checkBoxValue = false;

  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();

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
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    const Text('Sign up', style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff0F00FF),
                        fontWeight: FontWeight.bold),),
                    const SizedBox(height: 25,),
                    buildTextField(hint: 'Full name', controller: fullName),
                    const SizedBox(height: 20,),
                    buildTextField(hint: 'Email', controller: email),
                    const SizedBox(height: 20,),
                    buildTextField(hint: 'Phone number', controller: phoneNum),
                    const SizedBox(height: 20,),
                    buildTextField(hint: 'Date of birth', controller: dateOfBirth),
                    const SizedBox(height: 20,),
                    buildTextField(hint: 'Password', controller: password),
                    const SizedBox(height: 20,),
                    buildTextField(hint: 'Re-type password', controller: rePassword),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (value){
                            setState(() {
                              checkBoxValue = value!;
                            });}
                        ),
                        const Text('I agree to the terms & conditions')
                      ],
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xff0F00FF),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Text('Sign up', style: TextStyle(
                            color: Colors.white,
                        fontSize: 15),),
                      ),
                    ),
                    const Spacer(),
                    const Text('Or sign up with', style: TextStyle(fontSize: 15),),
                    const SizedBox(height: 10,),
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
                    const Spacer(),
                    RichText(text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(text: 'Already have an account? ',
                              style: const TextStyle(color: Colors.black, fontSize: 15)),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap=(){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const LogInScreen()));
                            },
                              text: ' Login',
                              style: const TextStyle(color: Color(0xff0F00FF), fontSize:15))
                        ]
                    ),),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  
  Widget buildTextField({required String hint, required TextEditingController controller}){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.30),
        borderRadius: BorderRadius.circular(50)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
  
}
