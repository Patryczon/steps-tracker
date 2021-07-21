abstract class NotificationScheduler {
  Future scheduleDailyNotification();

  Future cancelNextNotification();

  Future cancelAllNotifications();
}
