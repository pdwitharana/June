import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final fcm = FirebaseMessaging.instance;
  static String token;

  //Providing notification channels as described in Android Manifest
  static final AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', 'high_importance_channel', "This is a test description",
      importance: Importance.high, ledColor: Colors.blue);
  static String serverKey =
      'AAAA8LDYDu4:APA91bHi_5Lg4dlStn1RknoI-uGnOLyfgPVALw7XZHCusRHT3MCwuZFERjIjk9OBEFaUNi-rBz6OtGmWaCfQEgr0ILNJhRDGKifqQnKICT7gMyceXX9AIKwGL2kOH3mV_n8Z65m2wXrZ';
  static final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  static AndroidInitializationSettings androidSettings;

  static IOSInitializationSettings iosSettings;

  static Future<void> initFcm() async {
    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen(handleNewRemoteMessage);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandleBackgroundMessage);

    await fcm.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    log('Notification Service is initialized!');
  }

  static void handleNewRemoteMessage(RemoteMessage remoteMessage) {
    RemoteNotification notification = remoteMessage.notification;

    AndroidNotification androidNotification = remoteMessage.notification.android;

    if (notification != null && androidNotification != null) {
      notificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name, channel.description,
                icon: androidNotification.smallIcon),
            iOS: IOSNotificationDetails(
              presentAlert: true,
              presentBadge: true,
            )),
      );
    }
  }

  static Future<void> getPushToken() async {
    token = await fcm.getToken();

    fcm.onTokenRefresh.listen((refreshedToken) => token = refreshedToken);
  }

  static Future<void> _firebaseMessagingHandleBackgroundMessage(RemoteMessage message) async {}

  void initNotificationService() {
    androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    iosSettings = IOSInitializationSettings(
        requestSoundPermission: false, requestBadgePermission: false, requestAlertPermission: false);

    InitializationSettings settings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    notificationsPlugin.initialize(settings);
  }
}
