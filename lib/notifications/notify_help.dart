import 'dart:developer';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationHelper notificationHelper = NotificationHelper();

class NotificationHelper {
  // in main before runApp
  // NotificationHelper().initializeNotification();
  //
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialize notification
  initializeNotification() async {
    log('NotificationHelper: initializeNotification');
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            'EnjoyChannelId',
            'Enjoy Channel',
            importance: Importance.max,
          ),
        );

    InitializationSettings initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Request IOS permissions
  void requestIOSPermissions() {
    // PermissionStatus status = await Permission.notification.request();
    //       if (status.isGranted) {
    //         // notification permission is granted
    //       }
    //       else {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    // }
  }

  Future<List<PendingNotificationRequest>>
      getPendingNotificationRequestsString() async {
    var pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return pendingNotificationRequests;
  }

  periodicNotification() async {
    if (Platform.isIOS) {
      requestIOSPermissions();
    }
    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Enjoy television',
      'Uploaded new content, check it out !',
      RepeatInterval.weekly,
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'repeating channel id', 'repeating channel name'),
      ),
    );
  }

  cancelAll() async => await flutterLocalNotificationsPlugin.cancelAll();
  cancel(id) async => await flutterLocalNotificationsPlugin.cancel(id);

  Future<bool> checkNotification() async {
    var pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return pendingNotificationRequests.isNotEmpty ? true : false;
  }
}

void getPendingNotificationRequests() async {
  var pendingNotificationRequests =
      await notificationHelper.getPendingNotificationRequestsString();
  log('Pending Notification Requests: $pendingNotificationRequests');
}

void cancelPeriodicNotification() {
  notificationHelper.cancelAll();
}

class NotificationItem {
  final int id;
  final String title;
  final String body;

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
  });
}
