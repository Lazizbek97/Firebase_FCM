// To parse this JSON data, do
//
//     final notificationMessageModel = notificationMessageModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'notification_model.g.dart';

NotificationMessageModel notificationMessageModelFromJson(String str) =>
    NotificationMessageModel.fromJson(json.decode(str));

String notificationMessageModelToJson(NotificationMessageModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 0)
class NotificationMessageModel extends HiveObject {
  NotificationMessageModel(
      {this.id, this.title, this.disc, this.time, this.isRead});

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? disc;
  @HiveField(3)
  String? time;
  @HiveField(4)
  bool? isRead;

  factory NotificationMessageModel.fromJson(Map<String, dynamic> json) =>
      NotificationMessageModel(
        id: json["id"],
        title: json["title"],
        disc: json["disc"],
        time: json["time"],
        isRead: json["isRead"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "disc": disc,
        "time": time,
        "isDelete": isRead,
      };
}
