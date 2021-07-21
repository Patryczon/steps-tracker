import 'package:background_work_manager/background_work_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:notifications/dependency_register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_repository/dependency_register.dart';
import 'package:steps_repository/goal/steps_goal_repository.dart';
import 'package:superloop/app/const_values.dart';
import 'package:superloop/dashboard/calories/calories_burnt_bloc.dart';
import 'package:superloop/dashboard/notification/notification_bloc.dart';
import 'package:superloop/dashboard/steps/steps_bloc.dart';
import 'package:superloop/dashboard/steps/steps_event.dart';
import 'package:superloop/goal_update/goal_update_navigation.dart';
import 'package:superloop/goal_update/input/goal_input_cubit.dart';
import 'package:superloop/goal_update/update/goal_update_bloc.dart';

import 'app_bloc_observer.dart';

Future registerAppDependencies() async {
  GetIt.instance.registerSingleton<BlocObserver>(AppBlocObserver());
  GetIt.instance.registerSingleton<GoalUpdateNavigation>(NavigatorGoalUpdate());
  await SharedPreferences.getInstance().then(
      (value) => GetIt.instance.registerSingleton<SharedPreferences>(value));
  var areNotificationsEnabled = GetIt.instance
      .get<SharedPreferences>()
      .getBool(NotificationBloc.notificationStatusKey);
  registerStepRepositoryDependencies(GetIt.instance);
  registerNotificationsDependencies(GetIt.instance, notificationHour,
      notificationTitle, notificationDescription);
  registerBackgroundStepsGoalTracker(GetIt.instance);
  await registerBlocs(GetIt.instance, areNotificationsEnabled ?? false);
}

Future registerBlocs(GetIt getIt, bool areNotificationsEnabled) async {
  await GetIt.instance.get<StepsGoalRepository>().getStepsGoal().then((value) =>
      getIt.registerSingleton<GoalInputCubit>(
          GoalInputCubit(value ?? StepsGoalRepository.defaultStepsCount)));
  getIt
    ..registerSingleton<NotificationBloc>(
        NotificationBloc(getIt.get(), getIt.get(), areNotificationsEnabled))
    ..registerSingleton<GoalUpdateBloc>(GoalUpdateBloc(getIt.get()))
    ..registerSingleton<StepsBloc>(
        StepsBloc(getIt.get(), getIt.get())..add(LoadStepsData()))
    ..registerSingleton<CaloriesBurntBloc>(CaloriesBurntBloc(getIt.get()));
}
