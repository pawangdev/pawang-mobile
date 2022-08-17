// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletsModel walletModelFromJson(String str) =>
    WalletsModel.fromJson(json.decode(str));

String walletModelToJson(WalletsModel data) => json.encode(data.toJson());

class WalletsModel {
  WalletsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<WalletModel> data;

  factory WalletsModel.fromJson(Map<String, dynamic> json) => WalletsModel(
        success: json["success"],
        message: json["message"],
        data: List<WalletModel>.from(
            json["data"].map((x) => WalletModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WalletModel {
  WalletModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int userId;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        balance: json["balance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "balance": balance,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
