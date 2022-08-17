import 'dart:async';
import 'dart:convert';
import 'dart:io' as file;
import 'package:http/http.dart' as http;
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/error_model.dart';
import 'package:pawang_mobile/models/login_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<http.Response> userRegister(Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'name': data['name'],
        'email': data['email'],
        'password': data['password'],
        'phone': data['phone'],
        'gender': data['gender'],
      };

      var response = await http.post(Uri.parse(baseURLAPI + "users/register"),
          body: jsonEncode(dataRegister),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<LoginDataModel?> userLogin(Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
      };

      var response = await http.post(Uri.parse(baseURLAPI + "users/login"),
          body: jsonEncode(dataLogin),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException("Connection Time Out"),
      );

      if (response.statusCode == 200) {
        return LoginDataModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> userUpdateProfile(Map<String, dynamic> data) async {
    final token = Storage.getValue(storageToken);

    var request = http.MultipartRequest(
        "POST", Uri.parse(baseURLAPI + "profile/change-profile"));
    request.headers.addAll({
      'Authorization': "Bearer $token",
    });

    if (data['image'] == null) {
      request.fields['name'] = data['name'];
    } else {
      request.fields['name'] = data['name'];
      request.files.add(http.MultipartFile(
        "image",
        file.File(data['image']).readAsBytes().asStream(),
        file.File(data['image']).lengthSync(),
        filename: data['image'].toString().split("/").last,
      ));
    }

    var response = await request.send();

    if (response.reasonPhrase == "OK") {
      return true;
    } else {
      return false;
    }
  }

  static Future<http.Response> userProfile() async {
    final token = Storage.getValue(storageToken);

    var response =
        await http.get(Uri.parse(baseURLAPI + "users/profile"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer $token",
    });

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(false);
    }
  }

  Future<LoginModel> userChangePassword(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var dataPassword = <String, dynamic>{
      'password_now': data['password_now'],
      'password_new': data['password_new'],
      'password_new_confirmation': data['password_new_confirmation'],
    };

    var response = await http.post(
        Uri.parse(baseURLAPI + "profile/change-password"),
        body: jsonEncode(dataPassword),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "bearer $token",
        });

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      return LoginModel.fromJson(jsonDecode(response.body));
    }
  }
}
