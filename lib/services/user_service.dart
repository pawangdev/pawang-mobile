import 'package:get/get.dart';
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

      final response = await post('/auth/register', dataRegister);

      if (response.statusCode == 201) {
        return UserLoginRegisterDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == 'EMAIL_HAS_REGISTERED') {
        throw ('Email Telah Terdaftar !'.tr);
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

      final response = await post('/auth/login', dataLogin);

      if (response.statusCode == 200) {
        return UserLoginRegisterDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == 'EMAIL_NOT_FOUND') {
        throw ('Email Tidak Ditemukan!'.tr);
      } else if (e.toString() == 'WRONG_PASSWORD') {
        throw ('Kata Sandi Salah!'.tr);
      } else if (e.toString() == 'email is not allowed to be empty') {
        throw ('Email Tidak Boleh Kosong!'.tr);
      } else if (e.toString() == 'Kata Sandi is not allowed to be empty') {
        throw ('Kata Sandi Tidak Boleh Kosong!'.tr);
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

      final response = await post('/auth/login/google', dataLogin);

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

      final response = await post('/auth/change-profile', dataProfile);

      if (response.statusCode == 200) {
        return UserProfileDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileDataModel?> userProfile() async {
    try {
      final response = await get('/auth/profile');

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

      final response = await post('/auth/change-password', dataPassword);

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

      final response = await post('/auth/reset-password/request', dataEmail);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == 'EMAIL_NOT_FOUND') {
        throw ('Ups, Email Tidak Terdaftar !'.tr);
      } else {
        rethrow;
      }
    }
  }

  Future<bool> fogotPasswordVerifyToken(Map<String, dynamic> data) async {
    try {
      var dataToken = <String, dynamic>{
        'token': data['token'],
        'email': data['email'],
      };

      final response = await post('/auth/reset-password/verify', dataToken);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == 'TOKEN_NOT_MISMATCH') {
        throw ('Maaf, token kamu salah / tidak sesuai silahkan request ulang !'
            .tr);
      } else if (e.toString() == 'TOKEN_EXPIRED') {
        throw ('Maaf, token sudah expired silahkan request ulang !'.tr);
      } else if (e.toString() == 'EMAIL_NOT_FOUND') {
        throw ('Ups, Email Tidak Terdaftar !'.tr);
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

      final response = await post('/auth/reset-password', dataPassword);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == 'TOKEN_NOT_MISMATCH') {
        throw ('Maaf, token kamu salah / tidak sesuai silahkan request ulang !'
            .tr);
      } else if (e.toString() == 'TOKEN_EXPIRED') {
        throw ('Maaf, token sudah expired silahkan request ulang !'.tr);
      } else if (e.toString() == 'EMAIL_NOT_FOUND') {
        throw ('Ups, Email Tidak Terdaftar !'.tr);
      } else {
        rethrow;
      }
    }
  }

  Future<bool> userLogout(Map<String, dynamic> data) async {
    try {
      var payload = <String, dynamic>{
        'onesignal_id': data['onesignal_id'],
      };

      final response = await post('/auth/logout', payload);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
