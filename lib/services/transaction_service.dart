import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'package:pawang_mobile/utils/storage.dart';
import 'dart:io' as file;

class TransactionService {
  static Future<List<TransactionDataModel>?> getTransactions() async {
    final token = Storage.getValue(storageToken);

    var response =
        await http.get(Uri.parse(baseURLAPI + "/transactions"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((e) => TransactionDataModel.fromJson(e)).toList();
    } else {
      throw jsonDecode(response.body)['message'];
    }
  }

  static Future<bool> createTransaction(Map<String, dynamic> data) async {
    final token = Storage.getValue(storageToken);

    var request = http.MultipartRequest(
        "POST", Uri.parse(baseURLAPI + "/transactions/create"));
    request.headers.addAll({
      'Authorization': "Bearer $token",
    });

    if (data['image'] == null) {
      request.fields['amount'] = data['amount'].toString();
      request.fields['category_id'] = data['category_id'].toString();
      request.fields['sub_category_id'] = data['sub_category_id'].toString();
      request.fields['wallet_id'] = data['wallet_id'].toString();
      request.fields['type'] = data['type'];
      request.fields['description'] = data['description'];
      request.fields['date'] = data['date'];
    } else {
      request.fields['amount'] = data['amount'].toString();
      request.fields['category_id'] = data['category_id'].toString();
      request.fields['sub_category_id'] = data['sub_category_id'].toString();
      request.fields['wallet_id'] = data['wallet_id'].toString();
      request.fields['type'] = data['type'];
      request.fields['description'] = data['description'];
      request.fields['date'] = data['date'];
      request.files.add(http.MultipartFile(
          'image',
          file.File(data['image']).readAsBytes().asStream(),
          file.File(data['image']).lengthSync(),
          filename: data['image'].split("/").last));
    }

    var response = await request.send();

    return http.Response.fromStream(response).then((res) {
      if (res.statusCode == 200) {
        return true;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    });
  }

  static Future<bool> updateTransaction(
      Map<String, dynamic> data, int id) async {
    final token = Storage.getValue(storageToken);

    var request = http.MultipartRequest(
        "PUT", Uri.parse(baseURLAPI + "/transactions/update/$id"));
    request.headers.addAll({
      'Authorization': "Bearer $token",
    });

    if (data['image'] == null) {
      request.fields['amount'] = data['amount'].toString();
      request.fields['category_id'] = data['category_id'].toString();
      request.fields['sub_category_id'] = data['sub_category_id'].toString();
      request.fields['wallet_id'] = data['wallet_id'].toString();
      request.fields['type'] = data['type'];
      request.fields['description'] = data['description'];
      request.fields['date'] = data['date'];
    } else {
      request.fields['amount'] = data['amount'].toString();
      request.fields['category_id'] = data['category_id'].toString();
      request.fields['sub_category_id'] = data['sub_category_id'].toString();
      request.fields['wallet_id'] = data['wallet_id'].toString();
      request.fields['type'] = data['type'];
      request.fields['description'] = data['description'];
      request.fields['date'] = data['date'];
      request.files.add(http.MultipartFile(
          'image',
          file.File(data['image']).readAsBytes().asStream(),
          file.File(data['image']).lengthSync(),
          filename: data['image'].split("/").last));
    }

    var response = await request.send();

    return http.Response.fromStream(response).then((res) {
      if (res.statusCode == 200) {
        return true;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    });
  }

  static Future<bool> destroyTransaction(int id) async {
    final token = Storage.getValue(storageToken);

    var response = await http
        .delete(Uri.parse(baseURLAPI + "/transactions/delete/$id"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)['message'];
    }
  }
}
