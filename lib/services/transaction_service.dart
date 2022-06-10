import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as file;
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

    var request = http.MultipartRequest(
        "POST", Uri.parse(baseURLAPI + "transactions/create"));
    request.headers.addAll({
      'Authorization': "Bearer $token",
    });

    if (data['image'] == null) {
      request.fields['amount'] = data['amount'].toString();
      request.fields['category_id'] = data['category_id'].toString();
      request.fields['wallet_id'] = data['wallet_id'].toString();
      request.fields['type'] = data['type'];
      request.fields['description'] = data['description'];
      request.fields['date'] = data['date'];
    } else {
      request.fields['amount'] = data['amount'].toString();
      request.fields['category_id'] = data['category_id'].toString();
      request.fields['wallet_id'] = data['wallet_id'].toString();
      request.fields['type'] = data['type'];
      request.fields['description'] = data['description'];
      request.fields['date'] = data['date'];
      request.files.add(await http.MultipartFile(
          'image',
          file.File(data['image']).readAsBytes().asStream(),
          file.File(data['image']).lengthSync(),
          filename: data['image'].split("/").last));
    }

    var response = await request.send();

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> destroyTransaction(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http
        .delete(Uri.parse(baseURLAPI + "transactions/$id/delete"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
