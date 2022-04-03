import 'package:hive/hive.dart';
import 'package:todo_app/core/hive/hive_boxes.dart';
import 'package:todo_app/core/models/notification_model.dart';

class NotificationMessageService {
  Box<NotificationMessageModel> notificationBox = Boxes.getnotification();

  Future<List<NotificationMessageModel>> getnotifications() async {
    return notificationBox.values.toList();
  }

  addToHive(NotificationMessageModel notification) async {
    if (notificationBox.containsKey(notification.key)) {
      await notification.save();
    } else {
      await notificationBox.add(notification);
    }
  }

  deleteFromHive(NotificationMessageModel notification) async {
    await notification.delete();
  }

  markAsReadHive(NotificationMessageModel notification) async {
    notification.isRead = !notification.isRead!;
    await notification.save();
  }
}
