import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:pawang_mobile/services/base_service.dart';

class ReminderService extends BaseService {
  Future<List<ReminderDataModel>?> getReminders() async {
    try {
      final response = await get("/task-reminders");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => ReminderDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createReminder(Map<String, dynamic> data) async {
    try {
      var dataReminder = <String, dynamic>{
        'name': data['name'],
        'type': data['type'],
        'date': data['date'],
        'time': data['time'],
        'is_active': data['is_active'],
      };

      final response = await post("/task-reminders/create", dataReminder);

      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateReminder(int id, Map<String, dynamic> data) async {
    try {
      var dataReminder = <String, dynamic>{
        'name': data['name'],
        'type': data['type'],
        'date': data['date'],
        'is_active': data['is_active'],
      };

      final response = await put("/task-reminders/update/$id", dataReminder);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteReminder(int id) async {
    try {
      final response = await delete("/task-reminders/delete/$id");

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
