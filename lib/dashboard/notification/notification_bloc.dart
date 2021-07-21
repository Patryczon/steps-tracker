import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superloop/dashboard/notification/notification_event.dart';
import 'package:superloop/dashboard/notification/notification_state.dart';

class NotificationBloc extends Bloc<ToggleNotifications, NotificationsState> {
  NotificationBloc(this._notificationScheduler, this._sharedPreferences,
      bool areNotificationsEnabled)
      : super(areNotificationsEnabled
            ? NotificationsEnabled()
            : NotificationsDisabled());
  final NotificationScheduler _notificationScheduler;
  final SharedPreferences _sharedPreferences;
  static const notificationStatusKey = 'notificationStatus';

  @override
  Stream<NotificationsState> mapEventToState(ToggleNotifications event) async* {
    if (state is NotificationsEnabled) {
      await _notificationScheduler.cancelAllNotifications();
      await _sharedPreferences.setBool(notificationStatusKey, false);
      yield NotificationsDisabled();
    } else {
      await _sharedPreferences.setBool(notificationStatusKey, true);
      await _notificationScheduler.scheduleDailyNotification();
      yield NotificationsEnabled();
    }
  }
}
