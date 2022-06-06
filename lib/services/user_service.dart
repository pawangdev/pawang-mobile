import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/login_model.dart';
import 'package:pawang_mobile/models/profile_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> userRegister(Map<String, dynamic> data) async {
    var dataRegister = <String, dynamic>{
      'name': data['name'],
      'email': data['email'],
      'password': data['password'],
      'phone': data['phone'],
      'gender': data['gender'],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "register"),
        body: jsonEncode(dataRegister),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<LoginModel> userLogin(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    var dataLogin = <String, dynamic>{
      'email': data['email'],
      'password': data['password'],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "login"),
        body: jsonEncode(dataLogin),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 202) {
      Map<dynamic, dynamic> temp = jsonDecode(response.body);
      await prefs.setString('token', temp['data']['token']);
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      return LoginModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<ProfileModel> userProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http.get(Uri.parse(baseURLAPI + "profile"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer $token",
    });

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception(response);
    }
  }
}
