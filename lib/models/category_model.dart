// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<CategoryDataModel> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<CategoryDataModel>.from(
            json["data"].map((x) => CategoryDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryDataModel {
  CategoryDataModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.subcategories,
  });

  int id;
  String name;
  String icon;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  List<SubcategoryDataModel> subcategories;

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subcategories: List<SubcategoryDataModel>.from(
            json["subcategories"].map((x) => SubcategoryDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subcategories":
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
      };
}

class SubcategoryDataModel {
  SubcategoryDataModel({
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

  factory SubcategoryDataModel.fromJson(Map<String, dynamic> json) =>
      SubcategoryDataModel(
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
