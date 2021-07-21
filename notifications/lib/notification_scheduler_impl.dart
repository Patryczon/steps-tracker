import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart' as t;

import 'notification_scheduler.dart';

class NotificationSchedulerImpl extends NotificationScheduler {
  final int notificationHour;
  final String notificationTitle;
  final String notificationDescription;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationSchedulerImpl(this.notificationHour, this.notificationTitle,
      this.notificationDescription) {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_notification');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Future<void> scheduleDailyNotification() async {
    final timeZone = TimeZone();
    String timeZoneName = await timeZone.getTimeZoneName();
    final location = await timeZone.getLocation(timeZoneName);
    var _now = DateTime.now();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        _now.day,
        notificationTitle,
        notificationDescription,
        t.TZDateTime.from(
            DateTime(_now.year, _now.month, _now.day, notificationHour),
            location),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                "1", "stepCounter", "Notification for Step Counter")),
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  @override
  Future cancelNextNotification() => _flutterLocalNotificationsPlugin
          .pendingNotificationRequests()
          .then((value) {
        value.forEach((element) {
          print(element.id);
          print(element.title);
          print(element.body);
        });
        _flutterLocalNotificationsPlugin.cancel(value.first.id);
      });

  @override
  Future cancelAllNotifications() =>
      _flutterLocalNotificationsPlugin.cancelAll();
}

class TimeZone {
  factory TimeZone() => _this ?? TimeZone._();

  TimeZone._() {
    initializeTimeZones();
  }

  static TimeZone? _this;

  Future<String> getTimeZoneName() async =>
      FlutterNativeTimezone.getLocalTimezone();

  Future<t.Location> getLocation([String? timeZoneName]) async {
    if (timeZoneName == null || timeZoneName.isEmpty) {
      timeZoneName = await getTimeZoneName();
    }
    return t.getLocation(timeZoneName);
  }
}
