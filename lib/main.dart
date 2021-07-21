import 'package:background_work_manager/background_work_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerAppDependencies();
  await GetIt.instance
      .get<BackgroundStepsGoalNotificationTracker>()
      .startBackgroundWorkManager();
  Bloc.observer = GetIt.instance.get<BlocObserver>();
  runApp(const App());
}
