import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/login_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/utils/storage.dart';

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
        'onesignal_id': data['onesignal_id'],
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

  static Future<UserProfileDataModel?> userUpdateProfile(
      Map<String, dynamic> input) async {
    try {
      final token = Storage.getValue(storageToken);

      var data = <String, dynamic>{
        'name': input['name'],
        'phone': input['phone'],
        'gender': input['gender'],
      };

      var response = await http
          .put(Uri.parse(baseURLAPI + "users/change-profile"),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': "bearer $token",
              },
              body: jsonEncode(data))
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Connection Time Out"),
          );

      if (response.statusCode == 200) {
        return UserProfileDataModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
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

  static Future<bool> userChangePassword(Map<String, dynamic> data) async {
    try {
      final token = Storage.getValue(storageToken);

      var dataPassword = <String, dynamic>{
        'old_password': data['old_password'],
        'new_password': data['new_password'],
      };

      var response = await http.put(
          Uri.parse(baseURLAPI + "users/change-password"),
          body: jsonEncode(dataPassword),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "Bearer $token",
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> forgotPasswordRequestToken(
      Map<String, dynamic> data) async {
    try {
      var dataEmail = <String, dynamic>{'email': data['email']};

      var response = await http.post(
        Uri.parse(baseURLAPI + "users/reset-password"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(dataEmail),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<http.Response> fogotPasswordVerifyToken(
      Map<String, dynamic> data) async {
    try {
      var dataToken = <String, dynamic>{"token": data['token']};

      var response = await http.post(
        Uri.parse(baseURLAPI + "users/reset-password/token"),
        body: jsonEncode(dataToken),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<http.Response> forgotPasswordConfirmation(
      Map<String, dynamic> data) async {
    try {
      var dataPassword = <String, dynamic>{
        'token': data['token'],
        'password': data['password'],
        'password_confirmation': data['password_confirmation'],
      };

      var response = await http.post(
        Uri.parse(baseURLAPI + "users/reset-password/password-confirmation"),
        body: jsonEncode(dataPassword),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
