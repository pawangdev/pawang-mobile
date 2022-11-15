// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserProfileModel welcomeFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String welcomeToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
  });

  UserProfileDataModel user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserProfileDataModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class UserProfileDataModel {
  UserProfileDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.imageProfile,
    required this.googleId,
    required this.onesignalId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String? phone;
  String? gender;
  dynamic imageProfile;
  dynamic googleId;
  dynamic onesignalId;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      UserProfileDataModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"] ?? "",
        gender: json["gender"] ?? "",
        imageProfile: json["image_profile"],
        googleId: json["google_id"],
        onesignalId: json["onesignal_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "image_profile": imageProfile,
        "google_id": googleId,
        "onesignal_id": onesignalId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
