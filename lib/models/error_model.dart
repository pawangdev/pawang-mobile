// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    required this.success,
    required this.message,
    required this.errorCode,
    required this.data,
  });

  bool success;
  String message;
  int errorCode;
  List<ErrorDataModel> data;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        success: json["success"],
        message: json["message"],
        errorCode: json["error_code"],
        data: List<ErrorDataModel>.from(
            json["data"].map((x) => ErrorDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error_code": errorCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ErrorDataModel {
  ErrorDataModel({
    required this.failedField,
    required this.tag,
    required this.value,
  });

  String failedField;
  String tag;
  String value;

  factory ErrorDataModel.fromJson(Map<String, dynamic> json) => ErrorDataModel(
        failedField: json["failed_field"],
        tag: json["tag"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "failed_field": failedField,
        "tag": tag,
        "value": value,
      };
}
