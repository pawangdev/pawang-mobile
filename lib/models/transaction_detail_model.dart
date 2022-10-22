import 'dart:convert';

TransactionDetailModel transactionDetailModelFromJson(String str) =>
    TransactionDetailModel.fromJson(json.decode(str));

String transactionDetailModelToJson(TransactionDetailModel data) =>
    json.encode(data.toJson());

class TransactionDetailModel {
  TransactionDetailModel({
    required this.message,
    required this.data,
  });

  String message;
  TransactionDetailDataModel data;

  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailModel(
        message: json["message"],
        data: TransactionDetailDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class TransactionDetailDataModel {
  TransactionDetailDataModel({
    required this.totalIncome,
    required this.totalOutcome,
    required this.totalBalance,
  });

  int totalIncome;
  int totalOutcome;
  int totalBalance;

  factory TransactionDetailDataModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailDataModel(
        totalIncome: json["total_income"],
        totalOutcome: json["total_outcome"],
        totalBalance: json["total_balance"],
      );

  Map<String, dynamic> toJson() => {
        "total_income": totalIncome,
        "total_outcome": totalOutcome,
        "total_balance": totalBalance,
      };
}
