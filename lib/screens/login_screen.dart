import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paddy/screens/forgot_password_screen.dart';
import 'package:paddy/screens/register_screen.dart';
import 'package:paddy/services/auth_service.dart';
import 'package:paddy/services/validation_service.dart';

import '../global/global_user.dart';
import 'home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //controls the email text field
  TextEditingController email = TextEditingController();
  //controls the name text field
  TextEditingController password = TextEditingController();

  AuthService auth = AuthService();
  ValidationService validationService = ValidationService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 750.909090909091),
      builder: () => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Color(0xff0F00FF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    //logo section
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'PADDY',
                        style: TextStyle(
                            fontSize: 55.00.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: Image.asset(
                          'images/leaficon.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      'Hi there!',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0F00FF),
                      ),
                    ),
                    Text(
                      'Welcome back, please login to continue.',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    //email text field
                    buildTextField(
                        hint: 'Email',
                        controller: email,
                        icon: const Icon(Icons.person_outline)),
                    SizedBox(
                      height: 20.h,
                    ),
                    //password text field
                    buildTextField(
                        hint: 'Password',
                        controller: password,
                        icon: const Icon(Icons.lock_outline)),
                    SizedBox(
                      height: 5.h,
                    ),
                    //forgot password button
                    Container(
                      alignment: Alignment.centerRight,
                      color: Colors.white,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: const Color(0xff0F00FF),
                                fontSize: 14.sp),
                          )),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    //login button
                    InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        var validation = validationService.loginValidation(
                            email: email.text, password: password.text);

                        if (validation['valid']) {
                          var response = await auth.login(
                              email: email.text, password: password.text);
                          if (response["success"] == true) {
                            GlobalUser.authToken = response['token'];
                            await auth.getInfo();

                            setState(() {
                              loading = false;
                            });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          } else {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response['msg'])));
                          }
                        } else {
                          setState(() {
                            loading = false;
                          });
                          String msg = validation['msg'];
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(msg)));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xff0F00FF)),
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15.sp),
                            ),
                            const SizedBox(width: 10,),
                            Visibility(
                              visible: loading,
                              child: const SizedBox(
                                height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(color: Colors.white,)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //google login button
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> const RegisterScreen()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              margin: EdgeInsets.symmetric(horizontal: 0.w),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff0F00FF), width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: const Color(0xff0F00FF),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          //skip button
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Sign in later?',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp)),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
                                    },
                                  text: '  Skip',
                                  style: TextStyle(
                                      color: const Color(0xff0F00FF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp))
                            ]),
                          )
                        ],
                      ),
                    )
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
      {required String hint,
      required TextEditingController controller,
      required Icon icon}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6.r)),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      child: TextField(
        cursorColor: const Color(0xff0F00FF),
        controller: controller,
        decoration: InputDecoration(
            icon: icon,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff737373),
                fontWeight: FontWeight.normal)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
