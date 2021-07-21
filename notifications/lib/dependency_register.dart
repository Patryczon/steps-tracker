import 'package:get_it/get_it.dart';
import 'package:notifications/notification_scheduler.dart';
import 'package:notifications/notification_scheduler_impl.dart';

void registerNotificationsDependencies(GetIt injector, int notificationHour,
    String notificationTitle, String notificationDescription) {
  injector.registerSingleton<NotificationScheduler>(NotificationSchedulerImpl(
      notificationHour, notificationTitle, notificationDescription));
}
