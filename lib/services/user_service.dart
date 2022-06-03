import 'package:dio/dio.dart';
import 'package:pawang_mobile/constants/strings.dart';

class UserService {
  Future<bool> userRegister(Map<String, dynamic> data) async {
    Dio dio = new Dio();
    dio.options.baseUrl = baseURLAPI;
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var dataRegister = <String, dynamic>{
      'name': data['name'],
      'email': data['email'],
      'password': data['password'],
      'phone': data['phone'],
      'gender': data['gender'],
    };

    var response = await dio.post("register", data: dataRegister);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
