import 'package:flutter/material.dart';
import 'package:paddy/all_screens.dart';
import 'package:paddy/global/global_user.dart';
import 'package:paddy/models/user_model.dart';
import 'package:paddy/screens/about_us_screen.dart';
import 'package:paddy/screens/faqs_screen.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.white,
          child: Column(
            //Items in the side bar menu
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: const Color(0xff332FD0).withOpacity(0.75),
                    borderRadius: BorderRadius.circular(50)),
                child: ListTile(
                  onTap: GlobalUser.currentUser.name == ''
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()));
                        }
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        },
                  title: Text(
                    GlobalUser.currentUser.name == ''
                        ? 'Hello there!'
                        : GlobalUser.currentUser.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                      GlobalUser.currentUser.name == ''
                          ? 'Tap here to login.'
                          : GlobalUser.currentUser.email,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12)),
                  leading: CircleAvatar(
                    child: GlobalUser.currentUser.name == ''
                        ? const Icon(Icons.person)
                        : Text(GlobalUser.currentUser.name == ''
                            ? ''
                            : GlobalUser.currentUser.name
                                .substring(0, 1)
                                .toUpperCase()),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              menuItem(
                  title: 'Home',
                  icon: const Icon(Icons.home),
                  ontap: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }),
              menuItem(
                  title: 'Profile',
                  icon: const Icon(Icons.account_circle),
                  ontap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  }),
              menuItem(
                  title: "FAQs",
                  icon: const Icon(Icons.contact_support),
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FaqsScreen()));
                  }),
              menuItem(
                  title: 'About us',
                  icon: const Icon(Icons.info),
                  ontap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsScreen()));
                  }),
              menuItem(
                  title: 'Contact us',
                  icon: const Icon(Icons.phone),
                  ontap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactScreen()));
                  }),
              menuItem(
                  title: 'Help',
                  icon: const Icon(Icons.help),
                  ontap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpScreen()));
                  }),
              const Spacer(),
              menuItem(
                  title: 'Log out',
                  icon: const Icon(Icons.logout),
                  ontap: () {
                    //removing current user
                    GlobalUser.currentUser = User(
                        name: '', email: '', phoneNum: '', dateOfBirth: '');
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                  }),
            ],
          )),
    );
  }

  Widget menuItem(
      {required String title, required Icon icon, required Function() ontap}) {
    return ListTile(
      title: Text(title),
      leading: icon,
      onTap: ontap,
    );
  }
}
