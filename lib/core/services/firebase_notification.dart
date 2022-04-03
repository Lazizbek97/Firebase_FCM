// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/notification_model.dart';
import 'package:todo_app/screens/notifications_list_page/cubit/notifications_lists_cubit.dart';
import 'package:todo_app/screens/provider/category_provider.dart';

class FirebaseNotification {
  static int pageIndex = 0;
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    "id",
    "name",
    description: "disctription",
    importance: Importance.high,
    playSound: true,
  );

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> _firebaseMessagingBackgoundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static initFirebaseMessaging() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgoundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static listenNotificaiton(BuildContext context) async {
    return FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("listening listening listening");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      flutterLocalNotificationsPlugin
          .show(
              notification.hashCode,
              notification!.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  color: Colors.blue,
                  importance: Importance.high,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ))
          .then((value) async {
        NotificationMessageModel newMessage = NotificationMessageModel(
          id: message.senderId,
          title: notification.title,
          disc: notification.body,
          isRead: false,
          time: message.sentTime.toString(),
        );
        await context.read<NotificationsListsCubit>().saveMessage(newMessage);
        await context.read<PageProvider>().changePage(1);
        print("hivega qoshildi--------------------------");
      });
    });
  }

  static onTapListening(BuildContext context) async =>
      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        RemoteNotification notification = message.notification!;
        AndroidNotification android = message.notification!.android!;

        NotificationMessageModel newMessage = NotificationMessageModel(
          id: message.senderId,
          title: notification.title,
          disc: notification.body,
          isRead: false,
          time: message.sentTime.toString(),
        );
        print("ontap ontap ontap ontap ontap ontap----------------------");
        await context.read<NotificationsListsCubit>().saveMessage(newMessage);
        await context.read<PageProvider>().changePage(1);
        pageIndex = 1;
      });
  static onTapWhileterminated(BuildContext context) async =>
      FirebaseMessaging.onBackgroundMessage((message) async {
        RemoteNotification notification = message.notification!;
        NotificationMessageModel newMessage = NotificationMessageModel(
          id: message.senderId,
          title: notification.title,
          disc: notification.body,
          isRead: false,
          time: message.sentTime.toString(),
        );
        print("ontap ontap ontap ontap ontap ontap----------------------");
        await context.read<NotificationsListsCubit>().saveMessage(newMessage);
        await context.read<PageProvider>().changePage(1);
      });
}
