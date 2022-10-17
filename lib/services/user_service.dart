import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/login_register_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/utils/storage.dart';

class UserService {
  static Future<UserLoginRegisterDataModel?> userRegister(
      Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'name': data['name'],
        'email': data['email'],
        'password': data['password'],
        'phone': data['phone'],
        'gender': data['gender'],
        'onesignal_id': data['onesignal_id']
      };

      var response = await http.post(
        Uri.parse(baseURLAPI + "/auth/register"),
        body: jsonEncode(dataRegister),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 201) {
        return UserLoginRegisterDataModel.fromJson(
            jsonDecode(response.body)['data']);
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      if (e.toString() == "Email telah terdaftar") {
        throw ("Email Telah Terdaftar!");
      } else {
        rethrow;
      }
    }
  }

  static Future<UserLoginRegisterDataModel?> userLogin(
      Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
        'onesignal_id': data['onesignal_id']
      };

      var response = await http.post(
        Uri.parse(baseURLAPI + "/auth/login"),
        body: jsonEncode(dataLogin),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        return UserLoginRegisterDataModel.fromJson(
            jsonDecode(response.body)['data']);
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      if (e.toString() == "Email not found") {
        throw ("Email Tidak Ditemukan!");
      } else if (e.toString() == "Password invalid!") {
        throw ("Password Salah!");
      } else {
        rethrow;
      }
    }
  }

  static Future<UserLoginRegisterDataModel?> userLoginWithGoogle(
      Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'google_id': data['google_id'],
        'name': data['name'],
        'image_profile': data['image_profile'],
        'onesignal_id': data['onesignal_id'],
      };

      var response = await http.post(
        Uri.parse(baseURLAPI + "/auth/login/google"),
        body: jsonEncode(dataLogin),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        return UserLoginRegisterDataModel.fromJson(
            jsonDecode(response.body)['data']);
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
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

      var response =
          await http.post(Uri.parse(baseURLAPI + "/auth/change-profile"),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': "bearer $token",
              },
              body: jsonEncode(data));
      if (response.statusCode == 200) {
        return UserProfileDataModel.fromJson(
            jsonDecode(response.body)['data']['updateUser']);
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
        await http.get(Uri.parse(baseURLAPI + "/auth/profile"), headers: {
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
        'new_password_confirm': data['new_password_confirm'],
      };

      var response = await http.post(
          Uri.parse(baseURLAPI + "/auth/change-password"),
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

  static Future<bool> forgotPasswordRequestToken(
      Map<String, dynamic> data) async {
    try {
      var dataEmail = <String, dynamic>{'email': data['email']};

      var response = await http.post(
        Uri.parse(baseURLAPI + "/auth/reset-password/request"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(dataEmail),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      if (e.toString() == "Email tidak terdaftar") {
        throw ("Ups, Email Tidak Terdaftar !");
      } else {
        rethrow;
      }
    }
  }

  static Future<bool> fogotPasswordVerifyToken(
      Map<String, dynamic> data) async {
    try {
      var dataToken = <String, dynamic>{
        "token": data['token'],
        "email": data['email'],
      };

      var response = await http.post(
        Uri.parse(baseURLAPI + "/auth/reset-password/verify"),
        body: jsonEncode(dataToken),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      if (e.toString() == "token tidak valid") {
        throw ("Maaf, token sudah tidak valid silahkan request ulang !");
      } else if (e.toString() ==
          "token tidak valid, silahkan request token kembali") {
        throw ("Maaf, token sudah tidak valid silahkan request ulang !");
      } else {
        rethrow;
      }
    }
  }

  static Future<bool> forgotPasswordConfirmation(
      Map<String, dynamic> data) async {
    try {
      var dataPassword = <String, dynamic>{
        'email': data['email'],
        'token': data['token'],
        'password': data['password'],
        'password_confirm': data['password_confirm'],
      };

      var response = await http.post(
        Uri.parse(baseURLAPI + "/auth/reset-password"),
        body: jsonEncode(dataPassword),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      if (e.toString() == "token tidak valid") {
        throw ("Maaf, token sudah tidak valid silahkan request ulang !");
      } else if (e.toString() ==
          "token tidak valid, silahkan request token kembali") {
        throw ("Maaf, token sudah tidak valid silahkan request ulang !");
      } else {
        rethrow;
      }
    }
  }
}
