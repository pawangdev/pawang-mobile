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
}
