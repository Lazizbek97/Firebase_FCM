import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/domain/notification_repository.dart';
import 'package:todo_app/core/models/notification_model.dart';

part 'notifications_lists_state.dart';

class NotificationsListsCubit extends Cubit<NotificationsListsState> {
  Notification_CRUD notification_crud;
  NotificationsListsCubit(this.notification_crud)
      : super(NotificationsListsInitial());

  getNotifMessages() async {
    emit(NotificationsListsLoading());
    reGetMessages();
  }

  deleteMessage(NotificationMessageModel message) async {
    notification_crud.deleteMessage(message);
    reGetMessages();
  }

  saveMessage(NotificationMessageModel message) async {
    notification_crud.saveMessage(message);
    reGetMessages();
  }

  markAsRead(NotificationMessageModel message) async {
    notification_crud.markAsRead(message);
    reGetMessages();
  }

  reGetMessages() async {
    List<NotificationMessageModel> messages =
        await notification_crud.getNotifMessages();
    emit(NotificationsListsLoaded(messages));
  }
}
