import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paddy/all_screens.dart';
import 'package:http/http.dart' as http;
import 'package:paddy/global/global_user.dart';
import 'package:paddy/models/user_model.dart';
import 'package:paddy/services/auth_service.dart';
import 'package:paddy/services/validation_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  //controls the name text field
  TextEditingController email = TextEditingController();
  //controls the email text field
  TextEditingController fullName = TextEditingController();
  //controls the phone number text field
  TextEditingController phoneNum = TextEditingController();
  //controls the password text field
  TextEditingController password = TextEditingController();
  //controls the confirm password text field
  TextEditingController rePassword = TextEditingController();
  //controls the date of birth text field
  TextEditingController dateOfBirth = TextEditingController();

  AuthService auth = AuthService();
  ValidationService validationService = ValidationService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => SafeArea(
        child: GestureDetector(
          //auto dismissing the keyboard
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                height: height,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0F00FF)),
                    ),
                    Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              color: Color(0xff737373), fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInScreen()));
                          },
                          child: Text(
                            ' Log in',
                            style: TextStyle(
                                color: Color(0xff3F66F2),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //name text field
                    buildTextField(hint: 'Full name', controller: fullName),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    // email field
                    buildTextField(hint: 'Email', controller: email),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    // phone number field
                    buildTextField(hint: 'Phone number', controller: phoneNum),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    // dob text field
                    buildTextField(
                        hint: 'Date of birth', controller: dateOfBirth),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    //password text field
                    buildTextField(hint: 'Password', controller: password),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    //re password text field
                    buildTextField(
                        hint: 'Re-type password', controller: rePassword),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'By signing up to Paddy you agree to our',
                      style:
                          TextStyle(fontSize: 11.sp, color: Color(0xff737373)),
                    ),
                    Text(
                      'terms & conditions',
                      style:
                          TextStyle(color: Color(0xff0F00FF), fontSize: 11.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //sign up button
                    InkWell(
                      onTap: () async {
                        //sending the register request to the backend
                        Map result = validationService.registrationValidation(
                            name: fullName.text, 
                            email: email.text, 
                            phoneNumber: phoneNum.text, 
                            password: password.text, 
                            rePassword: rePassword.text
                        );
                        //if the request is a success then creating the global user
                        if(result['valid']){
                          var response = await auth.register(
                              email: email.text,
                              password: password.text,
                              name: fullName.text,
                              phoneNumber: phoneNum.text,
                              dateOfBirth: dateOfBirth.text
                          );
                          print("$response");
                          if(response["success"] == true){
                            GlobalUser.currentUser = User(
                                name: fullName.text,
                                email: email.text,
                                phoneNum: phoneNum.text,
                                dateOfBirth: dateOfBirth.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response['msg']))
                            );
                          }
                        }
                        
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result['msg']))
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff0F00FF),
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Text(
                          'Sign up',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //google sign up button
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffB9B9B9)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 19.h,
                                child: Image.asset('images/google.png')),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //building a text field
  Widget buildTextField(
      {required String hint, required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6.r)),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff737373),
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
