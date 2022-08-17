// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

import 'package:meta/meta.dart';
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
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.date,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.wallet,
  });

  int id;
  int amount;
  int categoryId;
  int walletId;
  String description;
  String imageUrl;
  String type;
  DateTime date;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  CategoryWalletModel category;
  TransactionWalletModel wallet;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        amount: json["amount"],
        categoryId: json["category_id"],
        walletId: json["wallet_id"],
        description: json["description"],
        imageUrl: json["image_url"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryWalletModel.fromJson(json["category"]),
        wallet: TransactionWalletModel.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "category_id": categoryId,
        "wallet_id": walletId,
        "description": description,
        "image_url": imageUrl,
        "type": type,
        "date": date.toIso8601String(),
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
        "wallet": wallet.toJson(),
      };
}

class CategoryWalletModel {
  CategoryWalletModel({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.userId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String iconUrl;
  int userId;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory CategoryWalletModel.fromJson(Map<String, dynamic> json) =>
      CategoryWalletModel(
        id: json["id"],
        name: json["name"],
        iconUrl: json["icon_url"],
        userId: json["user_id"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon_url": iconUrl,
        "user_id": userId,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class TransactionWalletModel {
  TransactionWalletModel({
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

  factory TransactionWalletModel.fromJson(Map<String, dynamic> json) =>
      TransactionWalletModel(
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
