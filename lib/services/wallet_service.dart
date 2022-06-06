import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WalletService {
  Future<WalletsModel> getWallets() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http.get(Uri.parse(baseURLAPI + "wallets"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer $token",
    });

    if (response.statusCode == 200) {
      return WalletsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
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
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
