import 'dart:convert';

import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:http/http.dart' as http;

class ReminderService {
  static Future<List<ReminderDataModel>?> getReminders() async {
    final token = Storage.getValue(storageToken);

    var response =
        await http.get(Uri.parse(baseURLAPI + "/task-reminders"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer $token",
    });

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((e) => ReminderDataModel.fromJson(e)).toList();
    } else {
      throw jsonDecode(response.body)['message'];
    }
  }

  static Future<bool> createReminder(Map<String, dynamic> data) async {
    try {
      final token = Storage.getValue(storageToken);

      var dataReminder = <String, dynamic>{
        'name': data['name'],
        'type': data['type'],
        'date': data['date'],
        'time': data['time'],
        'is_active': data['is_active'],
      };

      var response = await http.post(
          Uri.parse(baseURLAPI + "/task-reminders/create"),
          body: jsonEncode(dataReminder),
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

  static Future<bool> updateReminder(int id, Map<String, dynamic> data) async {
    try {
      final token = Storage.getValue(storageToken);

      var dataReminder = <String, dynamic>{
        'name': data['name'],
        'type': data['type'],
        'date': data['date'],
        'is_active': data['is_active'],
      };

      var response = await http.put(
          Uri.parse(baseURLAPI + "/task-reminders/update/$id"),
          body: jsonEncode(dataReminder),
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

  static Future<bool> deleteReminder(int id) async {
    try {
      final token = Storage.getValue(storageToken);

      var response = await http.delete(
          Uri.parse(baseURLAPI + "/task-reminders/delete/$id"),
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
