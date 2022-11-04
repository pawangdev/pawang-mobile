// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

import 'package:pawang_mobile/models/transaction_model.dart';

WalletModel walletModelFromJson(String str) =>
    WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  WalletModel({
    required this.message,
    required this.data,
  });

  String message;
  List<WalletDataModel> data;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        message: json["message"],
        data: List<WalletDataModel>.from(
            json["data"].map((x) => WalletDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WalletDataModel {
  WalletDataModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    required this.transactions,
  });

  int id;
  String name;
  int userId;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;
  List<TransactionWalletDataModel> transactions;

  factory WalletDataModel.fromJson(Map<String, dynamic> json) =>
      WalletDataModel(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        balance: json["balance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        transactions: List<TransactionWalletDataModel>.from(json["transactions"]
            .map((x) => TransactionWalletDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "balance": balance,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class TransactionWalletDataModel {
  TransactionWalletDataModel({
    required this.id,
    required this.amount,
    required this.categoryId,
    required this.walletId,
    required this.subcategoryId,
    required this.type,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.subcategory,
  });

  int id;
  int amount;
  int categoryId;
  int walletId;
  int? subcategoryId;
  String type;
  String? description;
  dynamic? imageUrl;
  DateTime date;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  TransactionCategoryWalletDataModel category;
  Subcategory? subcategory;

  factory TransactionWalletDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionWalletDataModel(
        id: json["id"],
        amount: json["amount"],
        categoryId: json["category_id"],
        walletId: json["wallet_id"],
        subcategoryId:
            json["subcategory_id"] == null ? null : json["subcategory_id"],
        type: json["type"],
        description: json["description"] == null ? null : json["description"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        date: DateTime.parse(json["date"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: TransactionCategoryWalletDataModel.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Subcategory.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "category_id": categoryId,
        "wallet_id": walletId,
        "subcategory_id": subcategoryId,
        "type": type,
        "description": description,
        "image_url": imageUrl,
        "date": date.toIso8601String(),
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
        "subcategory": subcategory,
      };
}

class TransactionCategoryWalletDataModel {
  TransactionCategoryWalletDataModel({
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

  factory TransactionCategoryWalletDataModel.fromJson(
          Map<String, dynamic> json) =>
      TransactionCategoryWalletDataModel(
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
