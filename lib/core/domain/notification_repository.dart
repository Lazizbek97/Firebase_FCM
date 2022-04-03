import 'package:todo_app/core/models/notification_model.dart';
import 'package:todo_app/core/services/hive_service.dart';

abstract class NotificationApi {
  const NotificationApi();

  /// Provides  all of notifications.
  Future<List<NotificationMessageModel>> getNotifMessages();

  /// Saves a notications message.

  Future<void> saveMessage(NotificationMessageModel todo);

  /// Deletes the notications message

  Future<void> deleteMessage(NotificationMessageModel task);

  /// Sets the `markAsRead`
  Future<void> markAsRead(NotificationMessageModel task);
}

class TodoNotFoundException implements Exception {}

class Notification_CRUD extends NotificationApi {
  NotificationMessageService notifService;
  Notification_CRUD({required this.notifService});

  @override
  Future<void> deleteMessage(NotificationMessageModel task) async {
    notifService.deleteFromHive(task);
  }

  @override
  Future<List<NotificationMessageModel>> getNotifMessages() async {
    return await notifService.getnotifications();
  }

  @override
  Future markAsRead(NotificationMessageModel task) async {
    notifService.markAsReadHive(task);
  }

  @override
  Future<void> saveMessage(NotificationMessageModel task) async {
    notifService.addToHive(task);
  }
}
