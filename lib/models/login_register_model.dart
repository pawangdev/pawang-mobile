import 'dart:convert';

UserLoginRegisterModel userLoginRegisterModelFromJson(String str) =>
    UserLoginRegisterModel.fromJson(json.decode(str));

String userLoginRegisterModelToJson(UserLoginRegisterModel data) =>
    json.encode(data.toJson());

class UserLoginRegisterModel {
  UserLoginRegisterModel({
    required this.message,
    required this.data,
  });

  String message;
  UserLoginRegisterDataModel data;

  factory UserLoginRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserLoginRegisterModel(
        message: json["message"],
        data: UserLoginRegisterDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class UserLoginRegisterDataModel {
  UserLoginRegisterDataModel({
    required this.user,
    required this.accessToken,
  });

  User user;
  String accessToken;

  factory UserLoginRegisterDataModel.fromJson(Map<String, dynamic> json) =>
      UserLoginRegisterDataModel(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.gender,
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
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
