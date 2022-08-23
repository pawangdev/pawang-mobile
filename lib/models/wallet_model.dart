// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) =>
    WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  WalletModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<WalletsDataModel> data;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        success: json["success"],
        message: json["message"],
        data: List<WalletsDataModel>.from(
            json["data"].map((x) => WalletsDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WalletsDataModel {
  WalletsDataModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.balance,
    required this.transactions,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int userId;
  int balance;
  dynamic transactions;
  DateTime createdAt;
  DateTime updatedAt;

  factory WalletsDataModel.fromJson(Map<String, dynamic> json) =>
      WalletsDataModel(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        balance: json["balance"],
        transactions: json["transactions"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "balance": balance,
        "transactions": transactions,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
