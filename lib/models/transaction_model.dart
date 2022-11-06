import 'dart:convert';

TransactionsModel transactionsModelFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) =>
    json.encode(data.toJson());

class TransactionsModel {
  TransactionsModel({
    required this.message,
    required this.data,
  });

  String message;
  List<TransactionDataModel> data;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        message: json["message"],
        data: List<TransactionDataModel>.from(
            json["data"].map((x) => TransactionDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionDataModel {
  TransactionDataModel({
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
    required this.wallet,
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
  String? imageUrl;
  DateTime date;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  Wallet wallet;
  Category category;
  Subcategory? subcategory;

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionDataModel(
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
        wallet: Wallet.fromJson(json["wallet"]),
        category: Category.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Subcategory.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "category_id": categoryId,
        "wallet_id": walletId,
        "subcategory_id": subcategoryId == null ? null : subcategoryId,
        "type": type,
        "description": description == null ? null : description,
        "image_url": imageUrl == null ? null : imageUrl,
        "date": date.toIso8601String(),
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "wallet": wallet.toJson(),
        "category": category.toJson(),
        "subcategory": subcategory == null ? null : subcategory?.toJson(),
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

class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.type,
    required this.userId,
    required this.categoryId,
  });

  int id;
  String name;
  String type;
  int userId;
  int categoryId;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        userId: json["user_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "user_id": userId,
        "category_id": categoryId,
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
