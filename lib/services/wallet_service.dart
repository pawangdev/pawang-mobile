import 'dart:async';
import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:http/http.dart' as http;
import 'package:pawang_mobile/utils/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletService {
  static Future<List<WalletsDataModel>?> getWallets() async {
    final token = Storage.getValue(storageToken);

    var response = await http.get(Uri.parse(baseURLAPI + "wallets"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer $token",
    }).timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeoutException("Connection Time Out"),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((e) => WalletsDataModel.fromJson(e)).toList();
    } else {
      throw jsonDecode(response.body)['message'];
    }
  }

  Future<bool> createWallet(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var dataWallet = <String, dynamic>{
      'name': data['name'],
      'balance': data['balance'],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "wallets/create"),
        body: jsonEncode(dataWallet),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception(false);
    }
  }

  Future<bool> updateWallet(Map<String, dynamic> data, int idWallet) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var dataWallet = <String, dynamic>{
      'name': data['name'],
      'balance': data['balance'],
    };

    var response = await http.put(
        Uri.parse(baseURLAPI + "wallets/$idWallet/update"),
        body: jsonEncode(dataWallet),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(false);
    }
  }

  Future<bool> deleteWallet(int idWallet) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http
        .delete(Uri.parse(baseURLAPI + "wallets/$idWallet/delete"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(false);
    }
  }
}
