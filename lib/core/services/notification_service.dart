import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../config/app_colors.dart';
import '../extensions/colorful_logging_extension.dart';

class NotificationService {
  const NotificationService._();

  static final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const _channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true,
  );

  static Future<void> init() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.subscribeToTopic('global');
    log((await FirebaseMessaging.instance.getToken()).toString().logWhite,
        name: 'FCM Token');
    listen();
  }

  static void listen() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          if (message.notification!.android != null) {
            RemoteNotification notification = message.notification!;
            // AndroidNotification android = message.notification!.android!;
            _flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  _channel.id,
                  _channel.name,
                  channelDescription: _channel.description,
                  color: AppColors.primaryColor,
                  playSound: true,
                  icon: '@mipmap/launcher_icon',
                  importance: Importance.max,
                ),
              ),
            );
          }
        }
      },
    );
  }

  static void requestPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
  }
}
