// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<TransactionDataModel> data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        success: json["success"],
        message: json["message"],
        data: List<TransactionDataModel>.from(
            json["data"].map((x) => TransactionDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionDataModel {
  TransactionDataModel({
    required this.id,
    required this.amount,
    required this.categoryId,
    required this.subcategoryId,
    required this.walletId,
    required this.type,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.userId,
    required this.category,
    required this.subCategory,
    required this.wallet,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int amount;
  int categoryId;
  int subcategoryId;
  int walletId;
  String type;
  String description;
  String imageUrl;
  DateTime date;
  int userId;
  Category category;
  dynamic subCategory;
  Wallet wallet;
  DateTime createdAt;
  DateTime updatedAt;

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionDataModel(
        id: json["id"],
        amount: json["amount"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        walletId: json["wallet_id"],
        type: json["type"],
        description: json["description"],
        imageUrl: json["image_url"],
        date: DateTime.parse(json["date"]),
        userId: json["user_id"],
        category: Category.fromJson(json["category"]),
        subCategory: json["sub_category"],
        wallet: Wallet.fromJson(json["wallet"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "wallet_id": walletId,
        "type": type,
        "description": description,
        "image_url": imageUrl,
        "date": date.toIso8601String(),
        "user_id": userId,
        "category": category.toJson(),
        "sub_category": subCategory,
        "wallet": wallet.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String icon;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Wallet {
  Wallet({
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

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
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
