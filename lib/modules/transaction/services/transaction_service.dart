import 'dart:io';

import 'package:get/get_connect.dart';
import 'package:pawang_mobile/models/transaction_detail_model.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/services/base_service.dart';

class TransactionService extends BaseService {
  Future<List<TransactionDataModel>?> getTransactions() async {
    try {
      final response = await get("/transactions");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse
            .map((e) => TransactionDataModel.fromJson(e))
            .toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionDetailDataModel> getTransactionDetails() async {
    try {
      final response = await get("/transactions/details");

      if (response.statusCode == 200) {
        return TransactionDetailDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createTransaction(Map<String, dynamic> data) async {
    try {
      late FormData form;

      if (data['receipt_image'] == null) {
        if (data['subcategory_id'] != 0) {
          form = FormData({
            'amount': data['amount'].toString(),
            'category_id': data['category_id'].toString(),
            'wallet_id': data['wallet_id'].toString(),
            'description': data['description'].toString(),
            'date': data['date'].toString(),
            'subcategory_id': data['subcategory_id'].toString(),
          });
        } else {
          form = FormData({
            'amount': data['amount'].toString(),
            'category_id': data['category_id'].toString(),
            'wallet_id': data['wallet_id'].toString(),
            'description': data['description'].toString(),
            'date': data['date'].toString(),
          });
        }
      }

      final response = await post("/transactions/create", form);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateTransaction(Map<String, dynamic> data, int id) async {
    try {
      late FormData form;

      if (data['receipt_image'] != null) {
        if (data['subcategory_id'] != 0) {
          form = FormData({
            'amount': data['amount'].toString(),
            'category_id': data['category_id'].toString(),
            'wallet_id': data['wallet_id'].toString(),
            'description': data['description'].toString(),
            'date': data['date'].toString(),
            'subcategory_id': data['subcategory_id'].toString(),
            'receipt_image': MultipartFile(data['receipt_image'].path,
                filename: data['receipt_image'].path.split("/").last)
          });
        } else {
          form = FormData({
            'amount': data['amount'].toString(),
            'category_id': data['category_id'].toString(),
            'wallet_id': data['wallet_id'].toString(),
            'description': data['description'].toString(),
            'date': data['date'].toString(),
            'receipt_image': MultipartFile(data['receipt_image'].path,
                filename: data['receipt_image'].path.split("/").last)
          });
        }
      } else {
        if (data['subcategory_id'] != 0) {
          form = FormData({
            'amount': data['amount'].toString(),
            'category_id': data['category_id'].toString(),
            'wallet_id': data['wallet_id'].toString(),
            'description': data['description'].toString(),
            'subcategory_id': data['subcategory_id'].toString(),
            'date': data['date'].toString(),
          });
        } else {
          form = FormData({
            'amount': data['amount'].toString(),
            'category_id': data['category_id'].toString(),
            'wallet_id': data['wallet_id'].toString(),
            'description': data['description'].toString(),
            'date': data['date'].toString(),
          });
        }
      }

      final response = await put("/transactions/update/$id", form);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> destroyTransaction(int id) async {
    try {
      final response = await delete("/transactions/delete/$id");

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
