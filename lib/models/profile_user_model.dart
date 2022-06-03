// To parse this JSON data, do
//
//     final profileUserModel = profileUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModelUserModel profileUserModelFromJson(String str) =>
    ProfileModelUserModel.fromJson(json.decode(str));

String profileUserModelToJson(ProfileModelUserModel data) =>
    json.encode(data.toJson());

class ProfileModelUserModel {
  ProfileModelUserModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  ProfileModel data;

  factory ProfileModelUserModel.fromJson(Map<String, dynamic> json) =>
      ProfileModelUserModel(
        success: json["success"],
        message: json["message"],
        data: ProfileModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String phone;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
