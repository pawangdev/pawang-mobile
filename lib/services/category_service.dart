import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<CategoriesModel> getCategories({String? type}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http
        .get(Uri.parse(baseURLAPI + "categories?type=$type"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error Get Data");
    }
  }
}
