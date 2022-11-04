import 'dart:async';

import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/services/base_service.dart';

class WalletService extends BaseService {
  Future<List<WalletDataModel>?> getWallets() async {
    try {
      final response = await get("/wallets");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => WalletDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createWallet(Map<String, dynamic> data) async {
    try {
      var dataWallet = <String, dynamic>{
        'name': data['name'],
        'balance': data['balance'],
      };

      final response = await post("/wallets/create", dataWallet);

      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateWallet(Map<String, dynamic> data, int idWallet) async {
    try {
      var dataWallet = <String, dynamic>{
        'name': data['name'],
        'balance': data['balance'],
      };

      final response = await put("/wallets/update/$idWallet", dataWallet);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteWallet(int idWallet) async {
    try {
      final response = await delete("/wallets/delete/$idWallet");

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
