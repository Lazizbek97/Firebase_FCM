import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/domain/notification_repository.dart';
import 'package:todo_app/core/services/hive_service.dart';
import 'package:todo_app/screens/home_page/page/home_page.dart';
import 'package:todo_app/screens/notifications_list_page/cubit/notifications_lists_cubit.dart';

class RouteGenerator {
  late Notification_CRUD notification_crud;
  late NotificationMessageService service;
  RouteGenerator() {
    service = NotificationMessageService();
    notification_crud = Notification_CRUD(notifService: service);
  }

  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NotificationsListsCubit>(
            create: (context) => NotificationsListsCubit(
                Notification_CRUD(notifService: NotificationMessageService())),
            child: const HomePage(),
          ),
        );
    }
    return null;
  }
}
