import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global/global_user.dart';
import '../models/user_model.dart';

class AuthService {
  Future<Map<String, dynamic>>login({required String email, required String password}) async {
    var response;
    await http.post(
        Uri.parse("https://paddy-backend-jm544.ondigitalocean.app/authenticate"),
        body: {
          "email": email,
          "password": password,
        }).then((value) {
      print(value.body);
      response = jsonDecode(value.body);
      print(response.toString());
    });

    return {
      'success': response["success"],
      'msg': response["msg"],
      'token' : response["token"]
    };
  }

  register(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String dateOfBirth}) async {
    var response;
    await http.post(
        Uri.parse("https://paddy-backend-jm544.ondigitalocean.app/adduser"),
        body: {
          "email": email,
          "password": password,
          "name": name,
          "dateOfBirth": dateOfBirth,
          "phoneNumber": phoneNumber,
        }).then((value) {
      print(value.body);
      response = jsonDecode(value.body);

      //setting the current user
      if (response["success"]) {
        GlobalUser.currentUser = User(
            name: name,
            email: email,
            phoneNum: phoneNumber,
            dateOfBirth: dateOfBirth);
      }
    });
    return {
      'success': response["suceess"],
      'msg': response["msg"],
    };
  }

  getInfo() async{

    var response;

    try{
      await http.get(
          Uri.parse("https://paddy-backend-jm544.ondigitalocean.app/getinfo"),
          headers: {
            'Authorization' : 'Bearer ${GlobalUser.authToken}'
          }
      ).then((value) {
        response = jsonDecode(value.body);
        GlobalUser.currentUser = User(
            name: response['name'],
            email: response['email'],
            phoneNum: response['phoneNumber'],
            dateOfBirth: '');
      });
    }
    catch(e){
      print(e.toString());
    }
  }


  sendPasswordResetRequest() async{

    var response;

    try{
      await http.post(
          Uri.parse("https://paddy-backend-jm544.ondigitalocean.app/reset-password"),
          body: {
            'email' : "menuradulsara@gmail.com"
          }
      ).then((value) {
        response = jsonDecode(value.body);
        print(response['message']);
      });
    }
    catch(e){
      print(e.toString());
    }
  }

  updatePassword(String ) async{

    var response;

    try{
      await http.put(
          Uri.parse("https://paddy-backend-jm544.ondigitalocean.app/reset-password"),
          body: {
            'email' : "menuradulsara@gmail.com",
            'otp' : '',
            'newPassword' : ''
          }
      ).then((value) {
        response = jsonDecode(value.body);
        print(response['message']);
      });
    }
    catch(e){
      print(e.toString());
    }
  }


}
