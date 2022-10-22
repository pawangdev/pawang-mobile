import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/services/base_service.dart';

class CategoryService extends BaseService {
  Future<List<CategoryDataModel>?> getCategories({String? type = ""}) async {
    try {
      final response = await get("/categories");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => CategoryDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addSubCategory(int id, Map<String, dynamic> data) async {
    try {
      var dataSubCategory = <String, dynamic>{
        'name': data['name'],
      };

      final response = await post("/categories/create/$id", dataSubCategory);

      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateSubCategory({idCategory, idSubCategory, data}) async {
    try {
      var dataSubCategory = <String, dynamic>{
        'name': data['name'],
      };

      final response = await put(
          "/categories/update/$idCategory/$idSubCategory", dataSubCategory);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteSubCategory(
      {required int idCategory, required int idSubCategory}) async {
    try {
      final response =
          await delete("/categories/delete/$idCategory/$idSubCategory");

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
