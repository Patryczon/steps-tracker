library background_work_manager;

import 'package:background_fetch/background_fetch.dart';
import 'package:notifications/notifications.dart';
import 'package:steps_repository/goal/steps_goal_repository.dart';
import 'package:steps_repository/steps_repository.dart';

export 'dependency_register.dart';

abstract class BackgroundStepsGoalNotificationTracker {
  Future startBackgroundWorkManager();
}

class BackgroundFetchStepsTracker
    extends BackgroundStepsGoalNotificationTracker {
  BackgroundFetchStepsTracker(this._stepsGoalRepository, this._stepsRepository,
      this._notificationScheduler);

  final StepsGoalRepository _stepsGoalRepository;
  final StepsRepository _stepsRepository;
  final NotificationScheduler _notificationScheduler;

  @override
  Future startBackgroundWorkManager() => BackgroundFetch.configure(
          BackgroundFetchConfig(
            minimumFetchInterval: const Duration(minutes: 30).inMilliseconds,
            startOnBoot: true,
            stopOnTerminate: false,
            requiredNetworkType: NetworkType.NONE,
          ), (taskId) async {
        var _stepsCount = await _stepsRepository.getStepsCount();
        var _stepsGoal = await _stepsGoalRepository.getStepsGoal();
        if (_stepsCount >
            (_stepsGoal ?? StepsGoalRepository.defaultStepsCount)) {
          await _notificationScheduler.cancelNextNotification();
        }
        BackgroundFetch.finish(taskId);
      }, (String taskId) async {
        BackgroundFetch.finish(taskId);
      });
}
