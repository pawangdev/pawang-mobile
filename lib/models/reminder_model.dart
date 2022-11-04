class ReminderModel {
  String? message;
  List<ReminderDataModel>? data;

  ReminderModel({this.message, this.data});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ReminderDataModel>[];
      json['data'].forEach((v) {
        data!.add(ReminderDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReminderDataModel {
  int? id;
  String? name;
  String? type;
  String? date;
  String? time;
  bool? isActive;
  int? userId;

  ReminderDataModel(
      {this.id,
      this.name,
      this.type,
      this.date,
      this.time,
      this.isActive,
      this.userId});

  ReminderDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    date = json['date'];
    time = json['time'];
    isActive = json['is_active'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['date'] = date;
    data['time'] = time;
    data['is_active'] = isActive;
    data['user_id'] = userId;
    return data;
  }
}
