import 'package:get_it/get_it.dart';

import 'background_work_manager.dart';

void registerBackgroundStepsGoalTracker(GetIt injector) {
  injector.registerSingleton<BackgroundStepsGoalNotificationTracker>(
      BackgroundFetchStepsTracker(
          injector.get(), injector.get(), injector.get()));
}
