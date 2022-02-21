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
    print('j');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var topPadding = MediaQuery.of(context).padding.top;
    var bottomPadding = MediaQuery.of(context).padding.bottom;

    print((width).toString());
    print((height).toString());
    print((height-topPadding).toString());
    print(MediaQuery.of(context).devicePixelRatio.toString());

    return ScreenUtilInit(
      designSize: const Size(393 , 851),
      builder : ()=> SafeArea(
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
                      MediaQuery.of(context).padding.bottom.h,
                  width: MediaQuery.of(context).size.width.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.02.h,),
                      Text('Sign up', style: TextStyle(
                          fontSize: 35.sp,
                          color: const Color(0xff0F00FF),
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 25.h,),
                      buildTextField(hint: 'Full name', controller: fullName),
                      SizedBox(height: 20.h,),
                      buildTextField(hint: 'Email', controller: email),
                      SizedBox(height: 20.h,),
                      buildTextField(hint: 'Phone number', controller: phoneNum),
                      SizedBox(height: 20.h,),
                      buildTextField(hint: 'Date of birth', controller: dateOfBirth),
                      SizedBox(height: 20.h,),
                      buildTextField(hint: 'Password', controller: password),
                      SizedBox(height: 20.h,),
                      buildTextField(hint: 'Re-type password', controller: rePassword),
                      SizedBox(height: 20.h,),
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
                          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff0F00FF),
                            borderRadius: BorderRadius.circular(50.r)
                          ),
                          child: Text('Sign up', style: TextStyle(
                              color: Colors.white,
                          fontSize: 15.sp),),
                        ),
                      ),
                      SizedBox(height: 35.h,),
                      Text('Or sign up with', style: TextStyle(fontSize: 15.sp),),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset('images/twitter.png'),),
                          ),
                          SizedBox(width: 20.w,),
                          SizedBox(
                            height: 40.h,
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset('images/google.png'),),
                          ),
                          SizedBox(width: 20.w,),
                          SizedBox(
                            height: 40.h,
                            child: InkWell(
                              onTap: (){},
                              child: Image.asset('images/facebook.png'),),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Already have an account? ',
                                style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap=(){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => const NewLogInScreen()));
                              },
                                text: ' Login',
                                style: TextStyle(color: Color(0xff0F00FF), fontSize:15.sp))
                          ]
                      ),),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
  
  Widget buildTextField({required String hint, required TextEditingController controller}){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.30),
        borderRadius: BorderRadius.circular(50.r)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15.sp)
        ),
      ),
    );
  }
  
}
