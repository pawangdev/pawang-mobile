import 'package:pawang_mobile/models/login_register_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/services/base_service.dart';

class UserService extends BaseService {
  Future<UserLoginRegisterDataModel?> userRegister(
      Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'name': data['name'],
        'email': data['email'],
        'password': data['password'],
        'onesignal_id': data['onesignal_id']
      };

      final response = await post("/auth/register", dataRegister);

      if (response.statusCode == 201) {
        return UserLoginRegisterDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == "Email telah terdaftar") {
        throw ("Email Telah Terdaftar!");
      } else {
        rethrow;
      }
    }
  }

  Future<UserLoginRegisterDataModel?> userLogin(
      Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
        'onesignal_id': data['onesignal_id']
      };

      final response = await post("/auth/login", dataLogin);

      if (response.statusCode == 200) {
        return UserLoginRegisterDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == "Email not found") {
        throw ("Email Tidak Ditemukan!");
      } else if (e.toString() == "Password invalid!") {
        throw ("Password Salah!");
      } else if (e.toString() == "email is not allowed to be empty") {
        throw ("Email Tidak Boleh Kosong!");
      } else if (e.toString() == "password is not allowed to be empty") {
        throw ("Password Tidak Boleh Kosong!");
      } else {
        rethrow;
      }
    }
  }

  Future<UserLoginRegisterDataModel?> userLoginWithGoogle(
      Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'google_id': data['google_id'],
        'name': data['name'],
        'image_profile': data['image_profile'],
        'onesignal_id': data['onesignal_id'],
      };

      final response = await post("/auth/login/google", dataLogin);

      if (response.statusCode == 200) {
        return UserLoginRegisterDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileDataModel?> userUpdateProfile(
      Map<String, dynamic> input) async {
    try {
      var dataProfile = <String, dynamic>{
        'name': input['name'],
        'phone': input['phone'],
        'gender': input['gender'],
      };

      final response = await post("/auth/change-profile", dataProfile);

      if (response.statusCode == 200) {
        return UserProfileDataModel.fromJson(response.body['data']['user']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileDataModel?> userProfile() async {
    try {
      final response = await get("/auth/profile");

      if (response.statusCode == 200) {
        return UserProfileDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> userChangePassword(Map<String, dynamic> data) async {
    try {
      var dataPassword = <String, dynamic>{
        'old_password': data['old_password'],
        'new_password': data['new_password'],
        'new_password_confirm': data['new_password_confirm'],
      };

      final response = await post("/auth/change-password", dataPassword);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> forgotPasswordRequestToken(Map<String, dynamic> data) async {
    try {
      var dataEmail = <String, dynamic>{'email': data['email']};

      final response = await post("/auth/reset-password/request", dataEmail);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == "Email tidak terdaftar") {
        throw ("Ups, Email Tidak Terdaftar !");
      } else {
        rethrow;
      }
    }
  }

  Future<bool> fogotPasswordVerifyToken(Map<String, dynamic> data) async {
    try {
      var dataToken = <String, dynamic>{
        "token": data['token'],
        "email": data['email'],
      };

      final response = await post("/auth/reset-password/verify", dataToken);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
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

  Future<bool> forgotPasswordConfirmation(Map<String, dynamic> data) async {
    try {
      var dataPassword = <String, dynamic>{
        'email': data['email'],
        'token': data['token'],
        'password': data['password'],
        'password_confirm': data['password_confirm'],
      };

      final response = await post("/auth/reset-password", dataPassword);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
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
