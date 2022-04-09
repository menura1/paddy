import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global/global_user.dart';
import '../models/user_model.dart';

class AuthService {
  Future<Map<String, dynamic>>login({required String email, required String password}) async {
    var response;
    await http.post(
        Uri.parse("https://paddy-backend.herokuapp.com/authenticate"),
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
        Uri.parse("https://paddy-backend.herokuapp.com/adduser"),
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
      'success': response["success"],
      'msg': response["msg"],
    };
  }

  getInfo() async{

    var response;

    try{
      await http.get(
          Uri.parse("https://paddy-backend.herokuapp.com/getinfo"),
          headers: {
            'Authorization' : 'Bearer ${GlobalUser.authToken}'
          }
      ).then((value) {
        response = jsonDecode(value.body);
        GlobalUser.currentUser = User(
            name: response['name']?? response['email'],
            email: response['email'],
            phoneNum: response['phoneNumber']?? "0001110001",
            dateOfBirth: '');
      });
    }
    catch(e){
      print(e.toString());
    }
  }

}
