import 'dart:convert';

ScanReceiptModel scanReceiptModelFromJson(String str) =>
    ScanReceiptModel.fromJson(json.decode(str));

String scanReceiptModelToJson(ScanReceiptModel data) =>
    json.encode(data.toJson());

class ScanReceiptModel {
  ScanReceiptModel({
    required this.amount,
    required this.status,
  });

  int amount;
  bool status;

  factory ScanReceiptModel.fromJson(Map<String, dynamic> json) =>
      ScanReceiptModel(
        amount: json["amount"] == null ? 0 : json["amount"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "status": status,
      };
}
