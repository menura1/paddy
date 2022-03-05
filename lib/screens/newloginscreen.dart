import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';

class NewLogInScreen extends StatefulWidget {
  const NewLogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<NewLogInScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var topPadding = MediaQuery.of(context).padding.top;
    var bottomPadding = MediaQuery.of(context).padding.bottom;

    print((width).toString());
    print((height).toString());
    print((height-topPadding).toString());
    print(MediaQuery.of(context).devicePixelRatio.toString());

    print('build');
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275,750.909090909091),
      builder : ()=> GestureDetector(
        onTap: (){
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
                    SizedBox(height: 80.h,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('PADDY', style: TextStyle(
                              fontSize: 55.00.sp, fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: Image.asset('images/leaficon.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ]
                    ),
                    SizedBox(height: 80.h,),
                    Text('Login', style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0F00FF),
                    ),),
                    SizedBox(height: 20.sp),
                    buildTextField(hint: 'Email', controller: email, icon : const Icon(Icons.person_outline)),
                    SizedBox(height: 20.h,),
                    buildTextField(hint: 'Password', controller: password, icon: const Icon(Icons.lock_outline)),
                    SizedBox(height: 5.h,),
                    Container(
                      alignment: Alignment.centerRight,
                      color: Colors.white,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewRegisterScreen()));
                        },
                          child: Text('Forgot password?', style: TextStyle(color: const Color(0xff0F00FF),fontSize: 14.sp),)),
                    ),
                    SizedBox(height: 30.h,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: const Color(0xff0F00FF)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        margin: EdgeInsets.symmetric(horizontal: 0.w),
                        child: Text('Login', style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15.sp
                        ),),
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              margin: EdgeInsets.symmetric(horizontal: 0.w),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45, width: 1.5),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)
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
                          SizedBox(height: 25.h,),
                          RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'New user? ',
                                    style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()..onTap= (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=> NewRegisterScreen()));
                                    },
                                    text: ' Register',
                                    style: TextStyle(color: Color(0xff0F00FF), fontSize:15.sp))
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
      ),
    );
  }

  Widget buildTextField({required String hint, required TextEditingController controller,
    required Icon icon}){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6.r)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      child: TextField(
        cursorColor: Color(0xff0F00FF),
        controller: controller,
        decoration: InputDecoration(
            icon: icon,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xff737373), fontWeight: FontWeight.normal)
        ),
      ),
    );
  }


}
