import 'package:hive/hive.dart';
import 'package:todo_app/core/models/notification_model.dart';

class Boxes {
  static Box<NotificationMessageModel> getnotification() =>
      Hive.box<NotificationMessageModel>("all_messages");
}
