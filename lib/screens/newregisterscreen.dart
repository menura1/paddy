import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';

class NewRegisterScreen extends StatelessWidget {
  NewRegisterScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var topPadding = MediaQuery.of(context).padding.top;
    var bottomPadding = MediaQuery.of(context).padding.bottom;


    print((width).toString());
    print((height).toString());
    print((height-topPadding).toString());

    return ScreenUtilInit(
      designSize: const Size(360,640),
      builder: () => SafeArea(
        child: GestureDetector(
          onTap: (){
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
                height: height-topPadding-bottomPadding,
                width: width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h,),
                    Text('Sign up', style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold, color: Color(0xff0F00FF)),),
                    SizedBox(height: 5.h),
                    Row(children: [
                      Text('Already have an account?', style: TextStyle(
                        color: Color(0xff737373), fontSize: 14.sp
                      ),),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewLogInScreen()));
                        },
                        child: Text(' Log in', style: TextStyle(
                          color: Color(0xff3F66F2), fontSize: 14.sp, fontWeight: FontWeight.w500
                        ),),
                      ),
                    ],),
                    SizedBox(height: 20.h,),
                    buildTextField(hint: 'Full name', controller: fullName),
                    SizedBox(height: 14.5.h,),
                    buildTextField(hint: 'Email', controller: email),
                    SizedBox(height: 14.5.h,),
                    buildTextField(hint: 'Phone number', controller: phoneNum),
                    SizedBox(height: 14.5.h,),
                    buildTextField(hint: 'Date of birth', controller: dateOfBirth),
                    SizedBox(height: 14.5.h,),
                    buildTextField(hint: 'Password', controller: password),
                    SizedBox(height: 14.5.h,),
                    buildTextField(hint: 'Re-type password', controller: rePassword),
                    SizedBox(height: 20.h,),
                    Text('By signing up to Paddy you agree to our', style: TextStyle(fontSize: 11.sp, color: Color(0xff737373)),),
                    Text('terms & conditions', style: TextStyle(color: Color(0xff0F00FF), fontSize: 11.sp),),
                    SizedBox(height: 10.h,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10.h,),
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff0F00FF),
                          borderRadius: BorderRadius.circular(6.r)
                        ),
                        child: Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 14.sp),),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10.h,),
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffB9B9B9)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)
                        ),
                        child: Row(
                          mainAxisAlignment : MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 19.h,
                                child: Image.asset('images/google.png')),
                            SizedBox(width: 10.w,),
                            Text('Google', style: TextStyle(
                                color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),),
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

  Widget buildTextField({required String hint, required TextEditingController controller}){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6.r)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xff737373), fontWeight: FontWeight.normal)
        ),
      ),
    );
  }

}

