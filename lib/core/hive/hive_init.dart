import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_app/core/models/notification_model.dart';

class HiveData {
  static init() async {
    final appDocDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    Hive.registerAdapter(NotificationMessageModelAdapter());
    await Hive.openBox<NotificationMessageModel>("all_messages");
  }
}
