import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TransactionService {
  static Future<TransactionsModel> getTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response =
        await http.get(Uri.parse(baseURLAPI + "transactions"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return TransactionsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error Get Data");
    }
  }

  static Future<bool> createTransaction(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var dataTransaction = <String, dynamic>{
      'amount': data['amount'],
      'category_id': data['category_id'],
      'wallet_id': data['wallet_id'],
      'type': data['type'],
      'description': data['description'],
      'date': data['date'],
    };

    var response = await http.post(
        Uri.parse(baseURLAPI + "transactions/create"),
        body: jsonEncode(dataTransaction),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
