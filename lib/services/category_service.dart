import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<CategoryDataModel>?> getCategories(
      {String? type = ""}) async {
    try {
      final token = Storage.getValue(storageToken);

      var response = await http
          .get(Uri.parse(baseURLAPI + "/categories?type=$type"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      });

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body)['data'];
        return jsonResponse.map((e) => CategoryDataModel.fromJson(e)).toList();
      } else {
        throw (jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> addSubCategory(int id, Map<String, dynamic> data) async {
    try {
      final token = Storage.getValue(storageToken);

      var dataSubCategory = <String, dynamic>{
        'name': data['name'],
      };

      var response = await http.post(
          Uri.parse(baseURLAPI + "/categories/create/$id"),
          body: jsonEncode(dataSubCategory),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "Bearer $token",
          });

      if (response.statusCode == 201) {
        return true;
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> updateSubCategory(
      {idCategory, idSubCategory, data}) async {
    try {
      final token = Storage.getValue(storageToken);

      var dataSubCategory = <String, dynamic>{
        'name': data['name'],
      };

      var response = await http.put(
          Uri.parse(
              baseURLAPI + "/categories/update/$idCategory/$idSubCategory"),
          body: jsonEncode(dataSubCategory),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "Bearer $token",
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> deleteSubCategory({idCategory, idSubCategory}) async {
    try {
      final token = Storage.getValue(storageToken);
      var response = await http.delete(
          Uri.parse(
              baseURLAPI + "/categories/delete/$idCategory/$idSubCategory"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "Bearer $token",
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (jsonDecode(response.body)['data'] ??
            jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
