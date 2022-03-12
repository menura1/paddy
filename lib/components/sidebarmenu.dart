import 'package:flutter/material.dart';
import 'package:paddy/allscreens.dart';
import 'package:paddy/screens/about_us_screen.dart';
import 'package:paddy/screens/faqs_screen.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ScreenUtilInit(
        designSize: const Size(393,851),
        builder : () => Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 100.h,
                color: Color(0xff0F00FF).withOpacity(0.75),
                child: const ListTile(
                  title: Text('User', style: TextStyle(color: Colors.white),),
                  subtitle: Text('user@gmail.com',style: TextStyle(color: Colors.white70)),
                  leading: CircleAvatar(child: Text('J'),backgroundColor: Colors.red,),

                ),
              ),
              menuItem(
                  title: 'Home',
                  icon: const Icon(Icons.home),
                  ontap:  (){
                    Navigator.of(context).pop();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const HomeScreen()));

                  }),
              menuItem(
                  title: 'Profile',
                  icon: const Icon(Icons.account_circle),
                  ontap:  (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));

                  }),
              menuItem(
                  title: 'Expert Advice',
                  icon: const Icon(Icons.menu_book),
                  ontap:  (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ExpertAdviceScreen()));

                  }),
              menuItem(
                  title: "FAQs",
                  icon: const Icon(Icons.contact_support),
                  ontap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> FaqsScreen()));
                  }
              ),


              menuItem(
                  title: 'About us',
                  icon: const Icon(Icons.info),
                  ontap:  (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));

                  }),
              menuItem(
                  title: 'Contact us',
                  icon: const Icon(Icons.phone),
                  ontap:  (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ContactScreen()));

                  }),
              menuItem(
                  title: 'Help',
                  icon: const Icon(Icons.help),
                  ontap:  (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const HelpScreen()));

                  }),
              Spacer(),
              menuItem(
                  title: 'Log out',
                  icon: const Icon(Icons.logout),
                  ontap:  (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const NewLogInScreen()));

                  }),
            ],
          )
        ),
      ),
    );
  }

  Widget menuItem({required String title, required Icon icon, required Function() ontap}){
    return ListTile(
      title: Text(title),
      leading: icon,
      onTap: ontap,
    );
  }

}
