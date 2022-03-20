import 'package:flutter/material.dart';
import 'package:paddy/global/global_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentUser = GlobalUser.currentUser;

  //controls the email text field
  late TextEditingController name = TextEditingController();
  //controls the email text field
  late TextEditingController email = TextEditingController();
  //controls the email phone number field
  late TextEditingController phoneNum = TextEditingController();
  //controls the email date of birth field
  late TextEditingController dateOfBirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = currentUser.name;
    email.text = currentUser.email;
    phoneNum.text = currentUser.phoneNum.toString();
    dateOfBirth.text = currentUser.dateOfBirth;

    return SafeArea(
        child: GestureDetector(
      onTap: () {
        //auto dismissing the keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 90,
                  width: 90,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Ryan Reynolds',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildTextField(label: "Name", controller: name),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(label: "Email", controller: email),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(label: "Phone number", controller: phoneNum),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(label: "Date of birth", controller: dateOfBirth),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: const Text(
                        'Update info',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildTextField(
      {required String label, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
