import 'package:get_it/get_it.dart';
import 'package:steps_repository/goal/local_steps_goal_repository.dart';
import 'package:steps_repository/mocked_repository.dart';
import 'package:steps_repository/steps_repository.dart';

void registerStepRepositoryDependencies(GetIt injector) {
  var mockedRepository = MockedRepository();
  injector
    ..registerSingleton<StepsRepository>(mockedRepository)
    ..registerSingleton<StepsGoalRepository>(
        LocalStepsGoalRepository(injector.get()))
    ..registerSingleton<CaloriesRepository>(mockedRepository);
}
