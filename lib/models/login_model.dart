// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  String? data;

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
