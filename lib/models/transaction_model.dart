// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

import 'dart:convert';

TransactionsModel transactionsModelFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) =>
    json.encode(data.toJson());

class TransactionsModel {
  TransactionsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<TransactionModel> data;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        success: json["success"],
        message: json["message"],
        data: List<TransactionModel>.from(
            json["data"].map((x) => TransactionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionModel {
  TransactionModel({
    required this.id,
    required this.amount,
    required this.categoryId,
    required this.walletId,
    required this.type,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int amount;
  int categoryId;
  int walletId;
  String type;
  String description;
  String imageUrl;
  DateTime date;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        amount: json["amount"],
        categoryId: json["category_id"],
        walletId: json["wallet_id"],
        type: json["type"],
        description: json["description"],
        imageUrl: json["image_url"],
        date: DateTime.parse(json["date"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "category_id": categoryId,
        "wallet_id": walletId,
        "type": type,
        "description": description,
        "image_url": imageUrl,
        "date": date.toIso8601String(),
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
