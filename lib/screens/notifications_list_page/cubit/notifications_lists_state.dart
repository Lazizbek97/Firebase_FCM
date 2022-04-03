part of 'notifications_lists_cubit.dart';

@immutable
abstract class NotificationsListsState {}

class NotificationsListsInitial extends NotificationsListsState {}

class NotificationsListsLoading extends NotificationsListsState {}

class NotificationsListsLoaded extends NotificationsListsState {
  List<NotificationMessageModel> messages;
  NotificationsListsLoaded(this.messages);
}
